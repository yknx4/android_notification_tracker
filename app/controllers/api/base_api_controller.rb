class Api::BaseApiController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!, unless: :is_in_development_mode?

  private
  def is_in_development_mode?
    ( Rails.env.development? or  current_user.try(:admin?) ) and params[:override_auth]
  end


end