class Item < ApplicationRecord
    belongs_to :repo

    validates :name, :presence => true
    validates :url, :presence => true
    validates :description, :presence => true 
end
