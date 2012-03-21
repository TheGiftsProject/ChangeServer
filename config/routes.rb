ChangeServer::Application.routes.draw do
  root :to => 'scores#index'

  resources :scores
end
