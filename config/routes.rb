Rails.application.routes.draw do

  get 'comments/edit'
  devise_for :users
  root 'posts#index'
  resources :posts do
    resources :comments
  end

end
