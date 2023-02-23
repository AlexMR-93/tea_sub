class Api::V1::SubscriptionsController <ApplicationController

  def create
    new_subscription = Subscription.new(sub_params)

    if new_subscription.save!
      #render json: { success: 'You did it' }, status: 400
      render json: SubscriptionSerializer.new(new_subscription), status: 201
    else
      render json: { errors: 'Unable to create subscription. Please try again.' }, status: 400
    end
  end
    private
  def sub_params
    params.permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end

