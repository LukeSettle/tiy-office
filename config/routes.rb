Rails.application.routes.draw do
  root 'pictures#home'
  resources 'pictures' do
  	put :up
  	put :down
  end
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
end
