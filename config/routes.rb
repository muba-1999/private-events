Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: "registrations"}
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :attendances
  # Defines the root path route ("/")
  get '/users/:id' => 'users#show', as: 'user'
  get '/users/:id/attended_events' => 'users#show_events_attended', as: 'show_events_attended'

  resources :events
  root "events#index"
end
