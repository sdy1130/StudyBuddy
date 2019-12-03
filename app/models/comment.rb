class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    has_rich_text :description
    
    validates :description, :presence => true
end
