require 'bcrypt'

class User < ActiveRecord::Base
  attr_reader :password
	attr_accessor :email_confirmation
	attr_accessor :password_confirmation

  has_many :deals, through: :lists

  validates_uniqueness_of :email, on: :create
  # validates_inclusion_of :customer, :in => [true, false]
  # validates_inclusion_of :business_owner, :in => [true, false]
  before_create :business_owner?, :only => :create
  validates_presence_of :email, :email_confirmation, on: :create
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, on: :create 
	validates :password, presence: true, confirmation: true, length: { minimum: 7 }, format: { with: /\S{7}/}, on: :create

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def authenticate(test_password)
    if BCrypt::Password.new(self.password_digest) == test_password
	    self
	  else
      false
    end
  end

  def business_owner?
    if !self.business_owner
      self.customer = true
    elsif self.business_owner = true
      self.customer = true
    end
  end
end



