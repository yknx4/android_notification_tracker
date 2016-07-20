class Api::BaseApiController < ActionController::API
  attr_reader :current_device
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!, unless: :is_in_development_mode?
  before_action :set_current_device
  include Pundit
  after_action :verify_authorized, unless: :is_in_development_mode?
  before_action :cleanse_page

  private
  def set_current_device
    device_id = request.headers['device-id']
    if device_id.present? and validate_uuid(device_id)
      @current_device = Device.find_or_initialize_by(id: device_id, user_id: current_user.id)
    end
  end

  def cleanse_page
    @page = Integer(params[:page]) rescue 1
  end

  def is_in_development_mode?
    ( Rails.env.development? or  current_user.try(:admin?) ) and params[:override_auth]
  end

  def validate_uuid(uuid)
    return true if uuid =~ /\A[\da-f]{32}\z/i
    return true if
        uuid =~ /\A(urn:uuid:)?[\da-f]{8}-([\da-f]{4}-){3}[\da-f]{12}\z/i
  end


end