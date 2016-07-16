class Location < ApplicationRecord
  include CalculatesValues
  has_many :status_bar_notifications, inverse_of: :location

  private
  def calculate_values
    if longitude.present? and latitude.present?
      self.lonlat = "POINT(#{longitude} #{latitude})"
    end
    if longitude.present? and latitude.present? and altitude.present?
      self.lonlatheight = "POINT(#{longitude} #{latitude} #{altitude})"
    end
  end
end
