class UsersController < ApplicationController
include SessionsHelper

respond_to :json, :html

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :email_confirmation, :password, :password_confirmation, :business_owner, :customer, :deals_array))
	  if @user.save && @user.business_owner == true
      log_in(@user)
      redirect_to new_business_path
    elsif @user.save && @user.business_owner == false
      log_in(@user)
      redirect_to sessions_path   # CHANGED_THIS  
    elsif @user.errors.messages[:password] && @user.errors.messages[:email] 
	    @user.email = ""
	    @user.email_confirmation = ""
	    @user.password = ""
	    @user.password_confirmation = ""
	    render 'new'
    elsif @user.errors.messages[:email] || @user.errors.messages[:email_confirmation]
	    @user.email  = ""
	    @user.email_confirmation = ""
      render 'new'
    elsif @user.errors.messages[:password] || @user.errors.messages[:password_confirmation]
	    @user.password = ""
	    @user.password_confirmation = ""
	    render 'new'
    else
	    render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    respond_with @user
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(params.require(:user).permit(:business_owner, :deals_array))
      redirect_to sessions_path(@user)
    end
  end
end