require 'rails_helper'

RSpec.describe "Subscriptions update", type: :request do
  describe "Happy Path" do
    it("When patch request is sent to /api/v1/customers/:customer_id/subscriptions") do
      cx = create(:customer).id
      tea = create(:tea).id
      sub = Subscription.create!( title: "Good tea", price: 4.50, status:"Active", frequency: "Daily", customer_id: cx, tea_id: tea )

      cancelled_params = {
        subscription_id: sub.id,
        status: 'cancelled'
      }
      headers = { 'CONTENT_TYPE' => 'application/json' }
      patch "/api/v1/customers/#{cx}/subscriptions", headers: headers, params: JSON.generate(cancelled_params)
      expect(response).to be_successful
      expect(response).to have_http_status(200)

      results = JSON.parse(response.body, symbolize_names: true)

      expect(results).to have_key(:data)
      expect(results[:data]).to have_key(:id)
      expect(results[:data]).to have_key(:type)
      expect(results[:data][:type]).to eq('subscription')

      expect(results[:data]).to have_key(:attributes)
      expect(results[:data][:attributes]).to have_key(:title)
      expect(results[:data][:attributes][:title]).to eq('Good tea')
      expect(results[:data][:attributes]).to have_key(:price)
      expect(results[:data][:attributes][:price]).to eq('4.5')
      expect(results[:data][:attributes]).to have_key(:status)
      expect(results[:data][:attributes][:status]).to eq('1')
      expect(results[:data][:attributes]).to have_key(:frequency)
      expect(results[:data][:attributes][:frequency]).to eq(0)
    end
  end

  describe "Sad Path" do
    it("will error if params are missing") do
      cx = create(:customer).id
      tea = create(:tea).id
      sub = Subscription.create!( title: "Good tea", price: 4.50, status:"Active", frequency: "Daily", customer_id: cx, tea_id: tea )

      cancelled_params = {
        subscription_id: sub.id,
        status: ''
      }
      headers = { 'CONTENT_TYPE' => 'application/json' }
      patch "/api/v1/customers/#{cx}/subscriptions", headers: headers, params: JSON.generate(cancelled_params)

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
    end
  end
end
