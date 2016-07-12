Rails.application.routes.draw do
  root to: 'homepages#root'
  # get '/ciphers/new' => 'ciphers#new'

  resources :decrypts
  resources :encrypts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
