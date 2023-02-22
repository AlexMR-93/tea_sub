class SubscriptionTea < ApplicationRecord
  belongs_to :subscription
  has_many :teas
end
