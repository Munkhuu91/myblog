Site::Application.routes.draw do
  resources :comments


  resources :posts


	get '/articles/search' => 'articles#search' 
	resources :articles do
  resources :comments
end
	
end
