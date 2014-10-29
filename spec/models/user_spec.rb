require 'spec_helper'
describe 'User' do
  describe "#create" do
    it 'should have a valid first name' do
      user = User.new(first_name: '!@#$%^&*()-_=+1234567890', last_name: 'Smilansky', password: 'testpassword',\
       password_confirmation: 'testpassword', email: 'test@test.com', email_confirmation: 'test@test.com')
      expect(user).to be_invalid
    end
    it 'should have a valid last name' do
      user = User.new(first_name: 'Matthew', last_name: '!@#$%^&*)12345678910', password: 'testpassword',\
       password_confirmation: 'testpassword', email: 'test@test.com', email_confirmation: 'test@test.com')
      expect(user).to be_invalid
    end
    it 'should have a first name without spaces' do
      user = User.new(first_name: 'M a thew', last_name: 'Smilansky', password: 'testpassword',\
       password_confirmation: 'testpassword', email: 'test@test.com', email_confirmation: 'test@test.com')
      expect(user).to be_invalid
    end
    it 'should have a valid last name without spaces' do
      user = User.new(first_name: 'Matthew', last_name: 'S m ilansky', password: 'testpassword',\
       password_confirmation: 'testpassword', email: 'test@test.com', email_confirmation: 'test@test.com')
      expect(user).to be_invalid
    end
    it 'should have a valid email without any spaces in' do
      user = User.new(first_name: 'Matthew', last_name: 'Smillansky', password: 'testpassword',\
       password_confirmation: 'testpassword', email: 'test @ test.com', email_confirmation: 'test@test.com')
      expect(user).to be_invalid
    end
    it 'should have an email beginning with characters and/or integers only' do
      user = User.new(first_name: 'Matthew', last_name: 'Smillansky', password: 'testpassword',\
       password_confirmation: 'testpassword', email: '@@test.com', email_confirmation: 'test@test.com')
      expect(user).to be_invalid
    end
      it 'should have an email that separates the beginning from the end with a @ symbol' do
        user = User.new(first_name: 'Matthew', last_name: 'Smillansky', password: 'testpassword',\ 
          password_confirmation: 'testpassword', email: '@@test.com', email_confirmation: 'test@test.com')
        expect(user).to be_invalid
      end
      it 'should be able to sign up as a customer or a business owner' do
        user = User.new(first_name: 'Matthew', last_name: 'Smillansky', password: 'testpassword'\
         password_confirmation: 'testpassword', email: '@@test.com', email_confirmation: 'test@test.com')
        expect(user).to be_invalid
      end
      it 'should have an email that separates the beginning from the end with a @ symbol' do
        user = User.new(first_name: 'Matthew', last_name: 'Smillansky', password: 'testpassword',\
         password_confirmation: 'testpassword', email: '@@test.com', email_confirmation: 'test@test.com')
        expect(user).to be_invalid
      end
      it 'should have an email ending with three parts: a beginning consisting of any characters, a period, and an ending consisting of 3 or less characters ONLY' do
        user = User.new(first_name: 'Matthew', last_name: 'Smillansky', password: 'testpassword',\
         password_confirmation: 'testpassword', email: '@@test.com', email_confirmation: 'test@test.com')
        expect(user).to be_invalid
      end
      it 'it should be able to sign up as a customer or a business owner' do
        user = User.new(first_name: 'Matthew', last_name: 'Smillansky', password: 'testpassword',\ 
          password_confirmation: 'testpassword', email: '@@test.com', email_confirmation: 'test@test.com')
        expect(user).to be_invalid
      end
      it 'should have users who are business owners should be able to revert to customer-only status at any given time.' do 
        user = User.new(first_name: 'Matthew', last_name: 'Smillansky', password: 'testpassword',\
         password_confirmation: 'testpassword', email: '@@test.com', email_confirmation: 'test@test.com')
        expect(user).to be_invalid
      end
      it "should have a user that should be able to view only their business page ONLY if they're a business owner and NOT also a customer" do
        user = User.new(first_name: 'Matthew', last_name: 'Smillansky', password: 'testpassword',\
         password_confirmation: 'testpassword', email: '@@test.com', email_confirmation: 'test@test.com')
        expect(user).to be_invalid
      end
  

   
  
  end

end