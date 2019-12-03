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
        puts address
        puts results.first.coordinates[0]
        puts results.first.coordinates[1]


        offering_params_2 = {}
        offering_params_2[:title] = offering_params[:title]
        offering_params_2[:course_id] = offering_params[:course_id]
        offering_params_2[:cost] = offering_params[:cost]
        offering_params_2[:description] = offering_params[:description]
        offering_params_2["startTime(1i)"] = offering_params["startTime(1i)"]
        offering_params_2["startTime(2i)"] = offering_params["startTime(2i)"]
        offering_params_2["startTime(3i)"] = offering_params["startTime(3i)"]
        offering_params_2["startTime(4i)"] = offering_params["startTime(4i)"]
        offering_params_2["startTime(5i)"] = offering_params["startTime(5i)"]
        offering_params_2["endTime(1i)"] = offering_params["endTime(1i)"]
        offering_params_2["endTime(2i)"] = offering_params["endTime(2i)"]
        offering_params_2["endTime(3i)"] = offering_params["endTime(3i)"]
        offering_params_2["endTime(4i)"] = offering_params["endTime(4i)"]
        offering_params_2["endTime(5i)"] = offering_params["endTime(5i)"]
        offering_params_2[:street] = offering_params[:street]
        offering_params_2[:city] = offering_params[:city]
        offering_params_2[:province] = offering_params[:province]
        offering_params_2[:country] = offering_params[:country]
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
        @offering_startTime = @offering.startTime.in_time_zone("Eastern Time (US & Canada)")
        @offering_endTime = @offering.endTime.in_time_zone("Eastern Time (US & Canada)")
    end

    def book
        @offering = Offering.find(params[:id])

        # Book the offering
        @offering.update_attribute(:attendee, User.find(current_user.id))
        @offering.update_attribute(:status, "Booked")

        OfferingMailer.with(user: User.find(@offering.organizer_id), offering: @offering).booking_email.deliver_now
        OfferingMailer.with(user: current_user.id, offering: @offering).booking_email.deliver_now

        redirect_to @offering
    end

    def bookings
        @offerings = Offering.all
    end

    def edit
        @offering = Offering.find(params[:id])
    end

    def update
        @offering = Offering.find(params[:id])
        address = [offering_params[:street], offering_params[:city], offering_params[:province], offering_params[:country]].compact.join(', ')
        results = Geocoder.search(address)

        offering_params_2 = {}
        offering_params_2[:course_id] = offering_params[:course_id]
        offering_params_2[:cost] = offering_params[:cost]
        offering_params_2[:description] = offering_params[:description]
        offering_params_2["startTime(1i)"] = offering_params["startTime(1i)"]
        offering_params_2["startTime(2i)"] = offering_params["startTime(2i)"]
        offering_params_2["startTime(3i)"] = offering_params["startTime(3i)"]
        offering_params_2["startTime(4i)"] = offering_params["startTime(4i)"]
        offering_params_2["startTime(5i)"] = offering_params["startTime(5i)"]
        offering_params_2["endTime(1i)"] = offering_params["endTime(1i)"]
        offering_params_2["endTime(2i)"] = offering_params["endTime(2i)"]
        offering_params_2["endTime(3i)"] = offering_params["endTime(3i)"]
        offering_params_2["endTime(4i)"] = offering_params["endTime(4i)"]
        offering_params_2["endTime(5i)"] = offering_params["endTime(5i)"]
        offering_params_2[:address] = address
        offering_params_2[:latitude] = results.first.coordinates[0]
        offering_params_2[:longitude] = results.first.coordinates[1]
        offering_params_2[:organizer] = User.find(current_user.id)
        # For now set the attendee to yourself
        # We can also add 'optional: true' for this foreign key in offerings model
        offering_params_2[:attendee] = offering_params_2[:organizer]

        if @offering.update(offering_params_2)
            redirect_to @offering
        else
            render 'edit'
        end
    end

    def destroy
        @offering = Offering.find(params[:id])
        @offering.destroy

        redirect_to offerings_path
    end

    def cancel
        @offering = Offering.find(params[:id])

        @offering.update_attribute(:status, "Free")

        redirect_to @offering
    end

    private
        def offering_params
            params.require(:offering).permit(:title, :description, :course_id, :cost, :startTime, :endTime, :street, :city, :province, :country)
        end

end
