class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :status_bar_notifications, inverse_of: :user, dependent: :nullify
  has_many :notifications, through: :status_bar_notifications
  has_many :locations, through: :status_bar_notifications
  has_many :notification_extras, through: :notifications
  has_many :devices, inverse_of: :user, dependent: :destroy
end
