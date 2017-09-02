class Channel < ApplicationRecord
  has_many :subscriptions
  has_many :users, through: :subscriptions

  validates_presence_of :name, :callsign, :price_per_month
end
