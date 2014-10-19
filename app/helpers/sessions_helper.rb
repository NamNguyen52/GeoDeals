module SessionsHelper
  def current_user
    if logged_in?
      @current_user ||= User.find(cookies[:logged_in_id])
   else
      nil
   end
 end

  def current_user=(user)
    @current_user = user
  end

  def log_in(user)
    cookies[:logged_in_id] = {value: user.id, :expire_after => 60.minutes}
    @current_user = user
  end

  def log_out
    cookies.delete(:logged_in_id)
  end

  def logged_in?
    cookies[:logged_in_id] ? true : false
  end
end
