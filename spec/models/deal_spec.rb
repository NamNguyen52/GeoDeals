require 'spec_helper'
require 'rails_helper'
describe 'Deal' do
  describe "#create" do
    it 'should have a valid name' do
      deal = Deal.new(name: "50% off Massages!", description: "50% off Massages!", fine: "something", start_date: "02-01-2015", end_date: "02-01-2015", code: '123456789013')
      expect(deal).to be_valid
    end
    it 'should have a valid description' do
      deal = Deal.new(name: "test", description: "50% off Massages!", fine: "something", start_date: "02-01-2015", end_date: "02-01-2015", code: '123456789013')
      expect(deal).to be_valid
    end
    it 'should have a valid code consisting of 10 numbers ONLY' do
      deal = Deal.new(name: "test", description: "50% off Massages!", fine: "something", start_date: "02-01-2015", end_date: "02-01-2015", code: '1234567890')
      expect(deal).to be_invalid
    end
    it 'should have a valid fine' do
      deal = Deal.new(name: "test", description: "50% off Massages!", fine: "something", start_date: "02-01-2015", end_date: "02-01-2015", code: '11111111111111')
      expect(deal).to be_valid
    end
    it 'should have a valid start date' do
      deal = Deal.new(name: "test", description: "50% off Massages!", fine: "something", start_date: "02-01-2015", end_date: "02-01-2015", code: '11111111111111')
      expect(deal).to be_valid
    end
     it 'should have a valid end date' do
      deal = Deal.new(name: "test", description: "50% off Massages!", fine: "something", start_date: "02-01-2015", end_date: "02-01-2015", code: '11111111111111')
      expect(deal).to be_valid
    end
     it 'should have a start date that is not in the past' do
      deal = Deal.new(name: "test", description: "50% off Massages!", fine: "something", start_date: "02-01-2013", end_date: "02-01-2015", code: '11111111111111')
      expect(deal).to be_invalid
    end
     it 'should have an end date that is not in the past' do
      deal = Deal.new(name: "test", description: "50% off Massages!", fine: "something", start_date: "02-01-2015", end_date: "02-01-2013", code: '11111111111111')
      expect(deal).to be_invalid
    end
  end
end