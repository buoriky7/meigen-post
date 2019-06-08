Rails.application.routes.draw do
  get 'favorites/lank_all'
  get 'favorites/lank_pro'
  get 'favorites/lank_ama'
  get 'users/delete_confirmation'
  get 'words/index_pro'
  get 'words/index_ama'
  resources :words
  resources :words do
    resource :favorites, only:[:create, :destroy]
  end
  resources :favorites, only:[:index]
  resources :users, only:[:index, :show, :edit, :update, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
