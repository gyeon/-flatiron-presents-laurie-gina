Model
  - app.rb

View
  - encrypt
    - new.html.erb
      Form for user input
    - show.html.erb
      Show encrypted message
  - decrypt
    - new.html.erb
      Form for user input
    - show.html.erb
      Show decrypted message

Controller
  - app_controller.rb
    #new
    #show

Config
  - routes.rb
    resources :app, only: [:new, :show]
