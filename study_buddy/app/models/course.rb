class Course < ApplicationRecord
    has_many :repos
    has_many :posts
    has_and_belongs_to_many :users

    validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..30 }
    validates :description, :presence => true
end
