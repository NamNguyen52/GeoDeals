class Business < ActiveRecord::Base
	has_many :deals
	has_one :user

	accepts_nested_attributes_for :user, :deals

	attr_accessor :business, :user_attributes
end
