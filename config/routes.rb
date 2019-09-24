Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'ideas#index'	
  resources :ideas
  # this function gets the about from the http response and the rocketsybmbol denotes to redirect to the static pages with action about
  get 'about' => 'static_pages#about'
  # this function takes the random and same working principle as above 
  get 'random' => 'static_pages#random'

end
