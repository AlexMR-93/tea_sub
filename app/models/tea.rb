class Tea < ApplicationRecord
  has_many :subscriptions, through: :subscription_teas
  has_many :subscription_teas
end
