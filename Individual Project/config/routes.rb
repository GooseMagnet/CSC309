Rails.application.routes.draw do

  resources :posts do
  	member do
  	  put "unvote", to: "posts#unvote"
	    put "like", to: "posts#upvote"
	    put "dislike", to: "posts#downvote"
  	end
  end

  root  					         'sessions#new'
  get 		'about'   		=> 'static_pages#about'
  get 		'signup'  		=> 'users#new'
  get     'statistics'  => 'posts#statistics'
  post   	'login'   		=> 'sessions#create'
  delete 	'logout'  		=> 'sessions#destroy'
  resources :users
end
