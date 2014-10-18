class Deal < ActiveRecord::Base
	belongs_to :business
	has_many :users, through: :lists
end
