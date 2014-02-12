Meurio::Application.routes.draw do
  root 'mobilizations#index'

  resources :mobilizations
  resources :users, only: [:index, :show, :edit, :update]

  get 'team' => 'users#team'
  get 'funders' => 'users#funders'
  get 'edit_profile' => 'users#edit', as: :edit_profile
  get 'login' => redirect { |params, request| "#{ENV['ACCOUNTS_HOST']}/login?#{request.params.to_query}" }, as: :login
  get 'task' => redirect { |params, request| "#{ENV['MULTITUDE_HOST']}/tasks/#{params[:id]}" }, as: :task
end
