class Course < ApplicationRecord
    # Changed to many to many relationship
    # has_many :repos
    has_and_belongs_to_many :repo
    has_many :posts
    has_and_belongs_to_many :users

    validates :name, :presence => true, :length => { :in => 3..30 }
    validates :description, :presence => true
    validates :code, :presence => true
end
