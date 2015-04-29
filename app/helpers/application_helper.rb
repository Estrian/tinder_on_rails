module ApplicationHelper
  def user_signed_in?
    !!session[:signed_in]
  end

  def current_user
    User.find(session[:signed_in])
  end
end
