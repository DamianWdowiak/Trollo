Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1, defaults: { format: :json } do
      resources :firsts, only: %i[index]
    end
  end
end
