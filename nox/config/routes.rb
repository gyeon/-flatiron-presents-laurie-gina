Rails.application.routes.draw do
  get '/' => 'ciphers#root'
  get '/ciphers/new_encrypt' => 'ciphers#new'
  # resources :ciphers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
