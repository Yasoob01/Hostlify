class User < ApplicationRecord

  ROLES = %i[admin hostel_owner hostel_seeker]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :hostels, dependent: :destroy
  has_many :rooms, :through => :hostels,  dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers:[:google_oauth2]


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do user
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
    end
  end

  def admin?
    role == "admin"
  end

  def hostel_seeker?
    role == "hostel_seeker"
  end

  def hostel_owner?
    role == "hostel_owner"
  end
end
