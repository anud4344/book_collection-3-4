Rails.application.routes.draw do
  root "books#index"
  get "books/index"
  # get "books/new"
  # get "books/show"
  # get "books/create"
  # get "books/edit"
  # get "books/update"
  # get "books/delete"
  # get "books/destroy"

   resources :books do
     member do
       get :delete
     end
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
