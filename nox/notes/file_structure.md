Model
  - app.rb

Views
  - new.html.erb
    - displays a form with two buttons 
      - encrypt
      - decrypt
  - show.html.erb
    - renders the ecrypted or decrypted message



Controller
  - 2 controllers 
    - decrypt
      #new
      #show
      #create

    - encrypt
      #new
      #show
      #create

 

Config
  - routes.rb
    resources :app, only: [:new, :show]


