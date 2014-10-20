class SessionsController < ApplicationController
include SessionsHelper

  def index
    if !logged_in?
	  redirect_to sign_in_path
	else
	  @user = current_user
	end	
  end

  def new
    if logged_in? 
      redirect_to sessions_path
	end
	flash.clear
	@image = ["113H.jpg", '114H.jpg', '119H.jpg', '28H.jpg', '34H.jpg', '70H.jpg', '86H.jpg', '9H.jpg'].sample
  end

  def create
    flash.clear
	begin
	  user = User.find_by({username: params[:session][:username]})
	rescue
	  flash[:error] = 'Email not found.'
	end
	
	if user && user.authenticate(params[:session][:password])
	  flash[:success] = 'Logged In!'
	  log_in(user)
	  redirect_to sessions_path
	else
	  flash[:error] ||= 'Password not found.'
	  redirect_to root_path
	end
  end

  def destroy
	log_out
	redirect_to sessions_path
  end
end