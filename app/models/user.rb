class User < ApplicationRecord
  has_many :projects, dependent: :destroy

  has_secure_password

  def self.authenticate(params)
    @user = User.find_by(email: params[:email])
    return @user if @user && @user.authenticate(params[:password])
	end
end
