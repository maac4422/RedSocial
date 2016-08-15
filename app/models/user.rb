class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :omniauthable, :omniauth_providers => [:facebook]

  has_many :posts
  validates :username, presence: true,uniqueness: true ,length: {in: 3..12} 
  validate :validate_username_regex


  #Validate if exist a user with credentiral facebook, if not exist create
  def self.from_omniauth(auth)
  	where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |user|
  		if auth[:info]
  			user.email = auth[:info][:email]
  			user.first_name = auth[:info][:name]
  		end
  		#Create string random characters 
  		user.password = Devise.friendly_token[0,20]
  	end
  end

  private

    #Validar si el usuario cumple con la expresion regular
    def validate_username_regex
      unless username =~ /\A[a-zA-Z]*[a-zA-Z][a-zA-Z0-9_]*\z/
        errors.add(:username," debe iniciar una letra ")
         errors.add(:username,"solo puede contener letras,números y guión bajo.")
      end
    end
end
