class Repo < ApplicationRecord
    has_many :items, dependent: :destroy
    has_and_belongs_to_many :users
    has_and_belongs_to_many :courses

    validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..30 }
    validates :description, :presence => true
end