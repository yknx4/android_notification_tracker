class Api::V1::EchoController < Api::V1::V1BaseController

  def index
    render json: [params].as_json
  end

  def create
    render json: request.body
  end

end
