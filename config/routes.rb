Meurio::Application.routes.draw do
  get "organizations/show"
  root 'mobilizations#index'

  resources :mobilizations
  resources :task_types, except: [:destroy]
  resources :badges, except: [:show]
  resources :organizations, only: [:show]
  resources :users, only: [:index, :show]
  resources :rewards, only: [:create]

  get 'team' => 'users#team'
  get 'funders' => 'users#funders'
  get 'founders' => 'pages#founders'
  # get 'edit_profile' => 'users#edit', as: :edit_profile
  get 'login' => redirect { |params, request| "#{ENV['ACCOUNTS_HOST']}/login?#{request.params.to_query}" }, as: :login

  get ENV['MEURIO_ACCOUNTS_URL'] => 'mobilizations#index' if Rails.env.test?
end
