Rails.application.routes.draw do
  root 'welcome#index'
  get 'auth/:provider/callback', to: 'session#create'
  get '/dashboard', to: 'users#show'
  get '/repositories', to: 'repositories#index'
end
