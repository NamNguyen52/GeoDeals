require 'spec_helper'
describe 'User' do
  describe "#create" do
    it 'should have a valid first name' do
      user = User.new(first_name: '42', last_name: 'Name', password: 'testpassword', password_confirmation: 'testpassword', email: 'test@test.com', email_confirmation: 'test@test.com')
      expect(user).to be_invalid
    end
    # #it 'should have a first name containing characters only' do
    # it 'should have a first name without spaces'
   	# it 'should have a valid last name' do
    # it 'should have a last name containing characters only' do
    # it 'should have a last name without spaces'
   	# it 'should have a valid email' do
   	# it 'should have a valid email without any spaces in it' do
   	# it 'should have an email beginning with characters only' do
   	# it 'should have an email that separates the beginning from the end with a @ symbol' do
   	# it 'should have an email ending with three parts: a beginning consisting of any characters, a period, and an ending consisting of 3 or less characters ONLY' do	
   	# it 'should be able to sign up as a customer or a business owner, the latter of which will also provide business owners customer priviliges' do
   	# it 'should have users who are business owners should be able to revert to customer-only status at any given time.' do
   	# it "should have a user that should be able to view only their business page ONLY if they're a business owner and NOT also a customer" do
   	# it '' do
   	# it '' do
   	# it '' do
   	# it '' do
  end

end