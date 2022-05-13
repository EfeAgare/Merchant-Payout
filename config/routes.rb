require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  root 'api/v1/disbursement#index' 
  namespace :api do
    namespace :v1 do
      get 'disbursement/index'
    end
  end

  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
