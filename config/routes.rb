Rails.application.routes.draw do
  resources :status_bar_notifications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/socket'
  namespace :api do
    namespace :v1 do
      resources :echo

    end
  end
end
