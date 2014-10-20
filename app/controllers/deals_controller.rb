require 'geotrigger'
class DealsController < ApplicationController

  respond_to :json

  def index
  	# @deals = Deal.all
  end

  def new
  	@deal = Deal.new
  end

  def show
  	@deal = Deal.all
    # @deal1 = Deal.where(:id => 45)
    # @deal1 = Deal.find params[:id => 43]
  end

  def edit
  end

  def create 
  	@deal = Deal.new(params.require(:deal).permit(:direction, :latitude, :longitude, :distance, :start, :expire, :text, :triggerid))   # (deal_params)
  	@deal.save

 	if @deal.save
 	  createtwo(@deal.direction, @deal.latitude, @deal.longitude, @deal.distance, @deal.start, @deal.expire, @deal.text, @deal.triggerid)
 	else
 	  render 'new'
 	end
  end

  def createtwo(direction, latitude, longitude, distance, start, expire, text, triggerid)

	# direction = params[:response][:direction]
 #  	latitude = params[:response][:latitude]
 #  	longitude = params[:response][:longitude]
 #  	distance = params[:response][:distance]
 #  	start = params[:response][:start]
 #  	expire = params[:response][:expire]
 #  	text = params[:response][:text]
 #  	triggerid = params[:response][:triggerid]

  	session = Geotrigger::Trigger.new(:client_id => 'cJWNucifELnFySUa', :client_secret => '051819d572c44c9a9f459a2aab8ef085')
  	response = Geotrigger::Trigger.create session, condition: {:direction => direction, :geo => {:latitude => latitude, :longitude => longitude, :distance => distance}, :fromTimestamp => start, :toTimestamp => expire}, action: {:notification => {:text =>  text}}, :triggerId => triggerid
 	
  	redirect_to show_path

  end

end








