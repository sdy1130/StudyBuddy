class OfferingsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @offerings = Offering.all
    end

    def new
        @offering = Offering.new
    end

    def create
        address = [offering_params[:street], offering_params[:city], offering_params[:province], offering_params[:country]].compact.join(', ')
        results = Geocoder.search(address)
        puts "Address: "
        puts results.first.coordinates

        offering_params_2 = {}
        offering_params_2[:course_id] = offering_params[:course_id]
        offering_params_2[:cost] = offering_params[:cost]
        offering_params_2[:startTime] = offering_params[:startTime]
        offering_params_2[:endTime] = offering_params[:endTime]
        offering_params_2[:address] = address
        offering_params_2[:latitude] = results.first.coordinates[0]
        offering_params_2[:longitude] = results.first.coordinates[1]
        offering_params_2[:organizer] = User.find(current_user.id)
        # For now set the attendee to yourself
        # We can also add 'optional: true' for this foreign key in offerings model
        offering_params_2[:attendee] = offering_params_2[:organizer]

        @offering = Offering.new(offering_params_2)

        if @offering.save
            redirect_to @offering
        else
            render 'new'
        end
    end

    def show
        @offering = Offering.find(params[:id])
    end

    def book
        @offering = Offering.find(params[:id])

        # Stripe payment

        # Book the offering
        @offering.update_attribute(:attendee, User.find(current_user.id))
        @offering.update_attribute(:status, "Booked")

        redirect_to @offering
    end

    def bookings
        @offerings = Offering.all
    end

    private
        def offering_params
            params.require(:offering).permit(:course_id, :cost, :startTime, :endTime, :street, :city, :province, :country)
        end

end
