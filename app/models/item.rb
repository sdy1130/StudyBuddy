class Item < ApplicationRecord
    belongs_to :repo
    has_rich_text :description

    validates :name, :presence => true
    validates :url, :presence => true
    validates :description, :presence => true 
end
