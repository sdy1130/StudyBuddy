class Repo < ApplicationRecord
    has_many :items
    has_and_belongs_to_many :users
    belongs_to :repo

    validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..30 }
    validates :description, :presence => true

end