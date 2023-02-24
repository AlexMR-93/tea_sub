class Api::V1::SubscriptionsController <ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    cx_sub = customer.subscriptions
    if cx_sub.empty?
      render json: { errors: 'Customer does not have subscriptions. Please try again.' }, status: 400
    else
      #render json: CustomerSerializer.new(customer, include:[:subscriptions])
      render json: SubscriptionSerializer.new(cx_sub)
    end
  end

  def create
    new_subscription = Subscription.new(sub_params)
    if new_subscription.save
       render json: SubscriptionSerializer.new(new_subscription), status: 201
    else
      render json: { errors: 'Unable to create subscription. Please try again.' }, status: 400
    end
  end
  def update
    subscription = Subscription.find(params[:subscription_id])
    if params[:status] == 'cancelled'
      subscription.update_attribute(:status, 1)
      render json: SubscriptionSerializer.new(subscription), status: 200
    elsif params[:status] == 'active'
      subscription.update(sub_params)
      render json: SubscriptionSerializer.new(subscription), status: 200
    else
      render json: { error: 'Bad request, unable to update' }, status: 400
    end
    end

    private
  def sub_params
    params.permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end

