class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :comments
    has_many :posts
    has_and_belongs_to_many :repos
    has_and_belongs_to_many :courses

    attr_accessor :password

    # validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
    # validates :age, :numericality => { :only_integer => true }
    # validates :age, numericality: { greater_than: 15, less_than: 100 }
    validates :email, :presence => true, :uniqueness => true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :password, :confirmation => true #password_confirmation attr   #this is for confirming the password 
    validates_length_of :password, :in => 6..20, :on => :create

    # before_save :encrypt_password
    # after_save :clear_password

    # def encrypt_password
    #     self.salt = BCrypt::Engine.generate_salt
    #     self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    # end

    # def clear_password
    #     self.password = nil
    # end

end
