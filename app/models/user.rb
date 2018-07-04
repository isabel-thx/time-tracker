class User < ApplicationRecord
  has_many :projects, dependent: :destroy

  has_secure_password

  validates :email, presence: true
	validates :email, uniqueness: { case_sensitive: false, message: " has already been registered." }
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validates :password, presence: true,
                       confirmation: true,
                       length: { in: 8..12, message: " must be between 8 to 12 characters in length." },
                       on: :create

  def self.authenticate(params)
    @user = User.find_by(email: params[:email])
    return @user if @user && @user.authenticate(params[:password])
	end
end
