class Deal < ActiveRecord::Base
	belongs_to :business
	has_many :users, through: :lists

	after_validation :expired_deal
  def expired_deal
    if self.end_date > Date.today
      self.expired = true
    end
  end
end
