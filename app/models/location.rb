class Location < ApplicationRecord
  has_many :status_bar_notifications, inverse_of: :location
end
