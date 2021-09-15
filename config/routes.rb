Rails.application.routes.draw do
  root :to => "user_files#index"
  resources :user_files
  devise_for :users
  get 'user_file_tags/:user_file_tag', to: 'user_files#index', as: :user_file_tag
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
