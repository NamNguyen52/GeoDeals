class Business < ActiveRecord::Base
  has_many :deals
  has_one :user

  attr_accessor :business, :user_attributes
  accepts_nested_attributes_for :user
end