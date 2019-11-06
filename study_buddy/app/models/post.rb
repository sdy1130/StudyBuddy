class Post < ApplicationRecord
    has_many :comments
    belongs_to :course
    belongs_to :user

    validates :title, :presence => true, :uniqueness => true, :length => { :in => 3..30 }
    validates :description, :presence => true
    # validates :categories, :presence => true 
end
