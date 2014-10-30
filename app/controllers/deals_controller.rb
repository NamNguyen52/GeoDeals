class DealsController < ApplicationController
include SessionsHelper
  def index
    @user = current_user
  	@deals = Deal.all
  end

  def destroy
    deal_record = Deal.find(params[:id])
    deal_record.destroy
    redirect_to business_index_path
  end

  def edit
  	@deal = Deal.find(params[:id])
  end

  def new
    @deal = Deal.new
  end

  def create
    @deal = Deal.new(params.require(:deal).permit(:name, :description, :fine, :start_date, :end_date, :start_time, :end_time, :business_id, :latitude, :longitude))
      curr_user_biz_id = current_user.business_id
      curr_user_biz_obj = Business.find_by_id(curr_user_biz_id)
      curr_user_biz_lat = curr_user_biz_obj.latitude
      curr_user_biz_lng = curr_user_biz_obj.longitude
      @deal.business_id = curr_user_biz_id
      @deal.latitude = curr_user_biz_lat
      @deal.longitude = curr_user_biz_lng
      @deal.save
      if @deal.save
        redirect_to business_index_path
      else
        render 'new'
      end
  end

  def show
    @deal = Deal.find(params[:id])
  end

  def update
    redirect_to index_path
  end
end
