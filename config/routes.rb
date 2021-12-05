Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1, defaults: { format: :json } do
      match 'users/current' => 'users#current', :via => :get
      resources :firsts, only: %i[index]

      resources :workspaces do
        resources :boards
      end

      resources :lists, only: %i[show create update destroy]
      resources :cards, only: %i[show create update destroy] do
        member do
          post :upload_file
          delete :delete_file
        end
      end
    end
  end
end
