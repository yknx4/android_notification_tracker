class Api::BaseApiController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!, unless: :is_in_development_mode?
  include Pundit
  after_action :verify_authorized, unless: :is_in_development_mode?
  before_action :cleanse_page

  private
  def cleanse_page
    @page = Integer(params[:page]) rescue 1
  end

  def is_in_development_mode?
    ( Rails.env.development? or  current_user.try(:admin?) ) and params[:override_auth]
  end


end