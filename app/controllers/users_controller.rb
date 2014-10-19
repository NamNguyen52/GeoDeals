class UsersController < ApplicationController
include SessionsHelper

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :first_name, :last_name, :email, :email_confirmation, :password, :password_confirmation))
	if @user.save
      log_in(@user)
      redirect_to root_path 
    elsif @user.errors.messages[:password] && @user.errors[:email] 
	  @user.email = ""
	  @user.email_confirmation = ""
	  @user.password = ""
	  @user.password_confirmation = ""
	  render 'new'
    elsif @user.errors.messages[:email] || @user.errors[:email_confirmation]
	  @user.email  = ""
	  @user.email_confirmation = ""
      render 'new'
    elsif @user.error.messages[:password] || @user.errors.messages[:password_confirmation]
	  @user.password = ""
	  @user.password_confirmation = ""
	  render 'new'
    else
	  render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update!(params.require(:user).permit())
      redirect_to user_path(@user)
    end
  end
end