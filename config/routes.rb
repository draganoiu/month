Rails.application.routes.draw do
  resources :items
  resources :tweets
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  as :user do
  	get "signin" => 'devise/sessions#new'
  	delete "signout" => 'devise/sessions#destroy'
  	get 'signup' => 'devise/registrations#new'
end
  
  root 'pages#home'

  get 'about' => 'pages#about'

  

end
