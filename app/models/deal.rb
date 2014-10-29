class Deal < ActiveRecord::Base
  belongs_to :business
  has_many :users, through: :lists

  before_create :set_deal_salt


  def set_deal_salt
    self.code = (0...10).map { ('1'..'50').to_a[rand(26)] }.join
  end
end
