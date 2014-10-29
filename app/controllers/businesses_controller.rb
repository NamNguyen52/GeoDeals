class BusinessesController < ApplicationController
include SessionsHelper

  def index
    @user = current_user
  	@business = Business.all
    @deals = Deal.where(id: current_user.business_id)
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
    @business = Business.new(params.require(:business).permit(:name, :location, :latitude, :longitude, :id))
      if @business.save
        @user = current_user
        @user.business_id = @business.id
        @user.save
        redirect_to business_index_path
      else
        render 'new'
      end
  end

 

  def show
    @business = Business.find(params[:id])
  end

  def update
    @deals = Deal.find(params[:id])
    @business = Business.find(params[:id])
      if @business.update(business_params)
        @business.user.update(params.require(:business).require(:user_attributes).permit(:first_name))
        @deals.update(params.require(:deal).permit(:name))
        redirect_to sessions_path(@user)
      end
    end


  private

  def business_params
    params.require(:business).permit(
      :name)
  end
end

