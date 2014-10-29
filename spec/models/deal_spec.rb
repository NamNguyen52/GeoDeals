require 'spec_helper'

describe 'Deal' do
  describe "#create" do
    it 'should have a valid name' do
      deal = Deal.new(name: "50% off Massages!")
      expect(deal).to be_valid
    end