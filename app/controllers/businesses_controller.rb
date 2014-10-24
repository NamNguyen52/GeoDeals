class BusinessesController < ApplicationController
include SessionsHelper

  def index
    @user = current_user
  	@business = Business.all
  end

  def destroy
    business_record = Business.find(params[:id])
    business_record.destroy

    redirect_to index_path
  end

  def edit
  	@business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(params.require(:business).permit(:name, :location, :street, :ste, :city, :state, :zip, :country, :id))
      if @business.save
        @user = current_user
        @user.business_id = @business.id
        @user.save
        redirect_to root_path
      else
        render 'new'
      end
  end

  def show
    @business = Business.find(params[:id])
  end

  def update
    redirect_to index_path
  end
end
