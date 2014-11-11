class Deal < ActiveRecord::Base
  belongs_to :business
  has_many :users, through: :lists

  before_create :set_deal_salt
  # validate :start_date_not_less_than_today
  # validate :end_date_not_less_than_today
  validates_presence_of :name, :description, :fine, :start_date, :end_date, on: :create
  # validates :code, format: { with: /[0-9]+{11}/}, on: :create
  
  def set_deal_salt
    self.code = (0...10).map { ('1'..'50').to_a[rand(26)] }.join
  end

  # def start_date_not_less_than_today
  # 	if self.start_date < Date.today
  # 		errors.add(:start_date, "That date is in the past!")
  # 	end
  # end

  # def end_date_not_less_than_today
  # 	if self.end_date < Date.today
  # 		errors.add(:start_date, "That date is in the past!")
  # 	end
  # end
end