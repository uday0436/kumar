Rails.application.routes.draw do
	namespace :api do
		resources :users, except: [:new, :edit]
	end
	root to: "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
