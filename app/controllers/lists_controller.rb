class ListsController < ApplicationController
include SessionsHelper

  respond_to :html, :json

  def index
  	@user = current_user
  	@lists = List.all
  end

  def new
  	@list = List.new
  end

  def create
  	new_list_entry = List.new
  	new_list_entry.deal_name = params[:list][:deal_name]
  	new_list_entry.deal_description = params[:list][:deal_description]
  	new_list_entry.deal_code = params[:list][:deal_code]
  	new_list_entry.deal_fine = params[:list][:deal_fine]
  	new_list_entry.deal_date = params[:list][:deal_date]
  	new_list_entry.deal_time = params[:list][:deal_time]
  	new_list_entry.user_id = params[:list][:user_id]
  	new_list_entry.save
  	# @list = List.new(params.require(:list).permit(:deal_name, :deal_description, :deal_code, :deal_fine, :deal_date, :deal_time, :user_id))
	# @list.user_id = current_user.id
	if new_list_entry.save
	redirect_to sessions_path
	end
  end

  def show
  	@list = List.find(params[:id])
  	respond_with @list
  end 

  def destroy
  	list_record = List.find(params[:id])
  	list_record.destroy
  	redirect_to sessions_path
  end

end
