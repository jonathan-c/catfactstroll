Catfacts::Application.routes.draw do
  post "catfacts/create"

  get "pages/index"

  root to: 'pages#index'
  
  resources :catfacts, :only => [:index, :create]
end
