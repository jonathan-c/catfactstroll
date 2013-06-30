Catfacts::Application.routes.draw do

  post "catfacts/create"
  post  'receive_text/create'

  get "pages/index"

  root to: 'pages#index'
  
  resources :catfacts, :only => [:index, :create]
  
  match '/receivetext', to: 'receive_text#create'
end
