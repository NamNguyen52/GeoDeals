class Business < ActiveRecord::Base
	has_many :deals
	has_many :users, as: :admins
end
