class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea
  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :status
  validates_presence_of :status, inclusion:["Active","Cancelled"]
  validates_presence_of :frequency, inclusion:["Daily","Weekly","Monthly"]


end
