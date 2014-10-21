class DealsController < ApplicationController
  def index
  	@deals = Deal.all
  end

  def destroy
    deal_record = Deal.find(params[:id])
    deal_record.destroy

    redirect_to index_path
  end

  def edit
  	@deal = Deal.find(params[:id])
  end

  def new
    @deal = Deal.new
  end

  def create
    @deal = Deal.new(params.require(:deal).permit(:name, :description, :fine, :start_date, :end_date))

      if @deal.save
        redirect_to index_path
      else
        render 'new'
      end
  ## capturing all the entry data from the deal_details form
   #  name = params[:deal_details][:name]
	  # description = params[:deal_details][:description]
	  # fine = params[:deal_details][:fine]
	  # start_date = params[:deal_details][:start_date]
	  # end_date = params[:deal_details][:end_date]

	## creating a new deal from the Deal model to save to database
  	# new_deal = Deal.new
  	# new_deal.name = name
  	# new_deal.description = description
  	# new_deal.fine = fine
  	# new_deal.start_date = start_date
  	# new_deal.end_date = end_date
  	# new_deal.save

  	# if new_deal.save
  	# 	redirect_to index_path
  	# else
  	# 	render 'create'
  	# end
  end

  def show
    @deal = Deal.find(params[:id])
  end

  def update
    redirect_to index_path
  end
end
