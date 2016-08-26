# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  username               :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  bio                    :text
#  uid                    :string
#  provider               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  cover_file_name        :string
#  cover_content_type     :string
#  cover_file_size        :integer
#  cover_updated_at       :datetime
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :omniauthable, :omniauth_providers => [:facebook]

  has_many :posts
  has_many :friendships
  has_many :followers,class_name: "Friendship", foreign_key: "friend_id"

  has_many :friends_added, through: :friendships, source: :friend
  has_many :friends_who_added, through: :friendships, source: :user

  validates :username, presence: true,uniqueness: true ,length: {in: 3..12} 
  validate :validate_username_regex

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_attached_file :cover, styles: { medium: "800x600>", thumb: "400x300>" }, default_url: "/images/:style/missing_cover.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

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

  def my_friend?(friend)
    Friendship.friends?(self,friend)
  end


  #Obtener el id de mis amigos que les envie la amistad
  def friend_ids
    Friendship.active.where(user:self).pluck(:friend_id)
  end

  #IDs de los que me enviaron la amistad
  def user_ids
    Friendship.active.where(friend:self).pluck(:user_id)
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
