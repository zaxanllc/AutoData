Rails.application.routes.draw do
	resources(:cars) 

    # Refuels is a nested resource, you have to get to them through
    # the cars resource.  This affects URLs and the URL generators.
    # After adding this try running `rake routes`.
    #resources(:refuels)
  #end
  
  ##############################################################################
  # Default and custom routes for sessions
  resources(:sessions)
  get '/login'  => 'sessions#new',     :as => :login
  get '/logout' => 'sessions#destroy', :as => :logout
  
  ##############################################################################
  # Route '/' to the cars controller.
  root(:to => 'cars#index')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
