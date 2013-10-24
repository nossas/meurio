Meurio::Application.routes.draw do
  root 'mobilizations#index'

  devise_for :users, controllers: { confirmations: 'confirmations', registrations: 'registrations', passwords: 'passwords' }
  resources :mobilizations
  resources :users, only: [:index, :show, :edit, :update]

  get 'team' => 'pages#team'
  get 'funders' => 'pages#funders'
  get 'edit_profile' => 'users#edit', as: :edit_profile  
end
