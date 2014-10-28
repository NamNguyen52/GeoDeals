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
    @business = Business.find(params[:id])
        if @business.update(business_params)
          @business.save
        if @business.user.update(params.require(:business).require(:user_attributes).permit(:first_name))
          @business.user.save
      redirect_to sessions_path(@user)
    end
  end
end

  private

  def business_params
    params.require(:business).permit(
      :name)
  end
end

