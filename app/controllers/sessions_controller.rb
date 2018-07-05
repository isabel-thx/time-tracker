class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(email: params[:session][:email])
    if @user = User.authenticate(params[:session])
      session[:user_id] = @user.id
      redirect_to new_project_path
    else
      respond_to do |format|
        format.html { redirect_to sign_in_path, notice: 'Invalid email or password' }
      end
    end
  end

  def destroy
    @current_user = session[:user_id] = nil
    redirect_to root_url
  end
end
