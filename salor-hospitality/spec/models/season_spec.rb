require 'rails_helper'

describe Season do
  context "#current" do
    it "returns autumn" do
      FactoryGirl.create(:season)
      expect(Season.current(Vendor.new(id:1)).name).to eq("Autumn")
    end
  end
end
