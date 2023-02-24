require 'rails_helper'

RSpec.describe "Subscriptions index", type: :request do
  describe "Happy Path" do
    it("returns all of a cx subscriptions active and cancelled") do
      cx = create(:customer)
      tea = create(:tea)
      tea2 = create(:tea)
      sub1 = Subscription.create!( title: "Good tea", price: 4.50, status:"Active", frequency: "Daily", customer_id: cx.id, tea_id: tea.id )
      sub2 = Subscription.create!( title: "poop", price: 4.50, status:"Cancelled", frequency: "Daily", customer_id: cx.id, tea_id: tea2.id )
      # headers = { 'CONTENT_TYPE' => 'application/json' }
      get ("/api/v1/customers/#{cx.id}/subscriptions")
      result = JSON.parse(response.body,symbolize_names: true)
      expect(response).to be_successful
      expect(result).to be_a Hash
    end
  end
  describe "Sad Path" do
    it("returns an error when cx does not have a subscription") do
      cx = create(:customer)
      tea = create(:tea)
      tea2 = create(:tea)

      # headers = { 'CONTENT_TYPE' => 'application/json' }
      get ("/api/v1/customers/#{cx.id}/subscriptions")
      result = JSON.parse(response.body,symbolize_names: true)
      expect(response).to_not be_successful
      expect(result).to be_a Hash
      expect(response).to have_http_status(400)
      expect(result[:errors]).to be_a String

    end
  end
end
