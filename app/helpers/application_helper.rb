module ApplicationHelper
  def current_user
    @current_user ||= session[:user_id] &&
      User.find_by(id: session[:user_id])
  end

  def signed_in?
    !current_user.nil?
  end

  def signed_in_user
    unless signed_in?
      flash[:danger] = "Please sign in to use TimeTracker."
      redirect_to "/"
    end
  end
end
