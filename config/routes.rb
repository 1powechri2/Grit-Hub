Rails.application.routes.draw do
  root 'welcome#index'
  get 'auth/github/callback', to: 'session#create'
end
