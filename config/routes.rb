Rails.application.routes.draw do
  resources :status_bar_notifications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/socket'
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :echo
      resources :status_bar_notifications

    end
  end
end
