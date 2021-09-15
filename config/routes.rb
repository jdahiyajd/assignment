Rails.application.routes.draw do
  root :to => "user_files#index"
  resources :user_files
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
