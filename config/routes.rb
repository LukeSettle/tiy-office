Rails.application.routes.draw do
  devise_for :users
  root 'pictures#home'
  resources 'pictures' do
  	put :up
  	put :down
  end
  resources 'authors'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
end
