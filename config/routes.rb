Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#secret'
  get 'pages/secret'  => 'pages#secret'
	get '/login'     => 'sessions#new'
	post '/login'    => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  scope '/api' do
    resources :users
    resources :dialings
    get "/metrics_entry_exit/:id", to: "users#metrics_entry_exit"
    get "/metrics_late_employees", to: "dialings#metrics_late_employees"
    get "/metrics_overtime_employees", to: "dialings#metrics_overtime_employees"
  end

end
