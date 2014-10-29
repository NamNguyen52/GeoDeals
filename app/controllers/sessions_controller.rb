 class SessionsController < ApplicationController
include SessionsHelper

  def index
    if !logged_in?
	  redirect_to sign_in_path
	else
	  @user = current_user
	  gon.userid = @user.id
	  @business = Business.new
	end	
  end

  def business_index
    if !logged_in?
	  redirect_to sign_in_path
	else
	  @user = current_user
	  gon.userid = @user.id
	end	
	@deals = Deal.all
  end

  def settings
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
	  user = User.find_by({email: params[:session][:email]})
	rescue
	  flash[:error] = 'Email not found.'
	end
	
	if user && user.authenticate(params[:session][:password]) && user.business_owner == true
	  flash[:success] = 'Logged In!'
	  log_in(user)
	  redirect_to sessions_path
	elsif user && user.authenticate(params[:session][:password]) && user.business_owner == false
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

   def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:business_owner))
	  redirect_to sessions_path
    else
	  render 'edit'
    end
  end
end