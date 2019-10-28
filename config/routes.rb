Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#secret'
  get 'pages/secret'  => 'pages#secret'
    	# sign up page with form:
	# get 'users/new' => 'users#new', as: :new_user

	# create (post) action for when sign up form is submitted:
  # post 'users' => 'users#create'

  	# log in page with form:
	get '/login'     => 'sessions#new'

	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'

	# delete action to log out:
  delete '/logout' => 'sessions#destroy'

  scope '/api' do
    resources :users
    resources :dialings
    get "/metrics_entry_exit/:id", to: "users#metrics_entry_exit"
  end

end
