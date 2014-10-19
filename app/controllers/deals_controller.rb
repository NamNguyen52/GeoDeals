class DealsController < ApplicationController
  def index
  	@deals = Deal.all
  end

  def destroy
  end

  def edit
  	@deal = Deal.find_by_id(params[:id])
  end

  def new
  end

  def create
  	# capturing all the entry data from the deal_details form
  	name = params[:deal_details][:name]
	description = params[:deal_details][:description]
	fine_print = params[:deal_details][:fine_print]
	start_date = params[:deal_details][:start_date]
	end_date = params[:deal_details][:end_date]

	# creating a new deal from the Deal model to save to database
  	new_deal = Deal.new
  	new_deal.name = name
  	new_deal.description = description
  	new_deal.fine = fine_print
  	new_deal.start_date = start_date
  	new_deal.end_date = end_date
  	new_deal.save

  	if new_deal.save
  		redirect_to index_path
  	else
  		render 'create'
  	end
  end

  def show
  end
end
