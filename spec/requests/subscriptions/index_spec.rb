require 'rails_helper'

RSpec.describe "Subscriptions index", type: :request do
  describe "Happy Path" do
    it("returns all of a cx subscriptions active and cancelled") do
      cx = create(:customer).id
      tea = create(:tea).id
      tea2 = create(:tea).id
      sub1 = Subscription.create!( title: "Good tea", price: 4.50, status:"Active", frequency: "Daily", customer_id: cx, tea_id: tea )
      sub2 = Subscription.create!( title: "poop", price: 4.50, status:"Cancelled", frequency: "Daily", customer_id: cx, tea_id: tea2 )
      get
    end