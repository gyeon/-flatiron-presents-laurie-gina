Rails.application.routes.draw do
  get '/' => 'ciphers#root'
  resources :ciphers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
