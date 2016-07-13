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


## we need a text area for plain text
## text area for secret key
## two submit buttons - values of encrypt and decrypt 
## if encrypt is chosen
    #### redirect to show
            ### to display message with original plain text with it
## if decrypt is chosen
    #### redirect to show
            ### to display message with original plain text with it
