class User < ActiveRecord::Base
	has_many :deals, through: :lists
end
