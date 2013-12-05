Meurio::Application.routes.draw do
  root 'mobilizations#index'

  resources :mobilizations
  resources :users, only: [:index, :show, :edit, :update]

  get 'team' => 'pages#team'
  get 'funders' => 'pages#funders'
  get 'edit_profile' => 'users#edit', as: :edit_profile
  get 'login' => redirect { |params, request| "#{ENV['ACCOUNTS_HOST']}/login?#{request.params.to_query}" }, as: :login
end
