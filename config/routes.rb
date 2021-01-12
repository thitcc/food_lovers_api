Rails.application.routes.draw do
  resources :categories
  resources :foods
  resources :ratings
  resources :users do
    post 'evaluate_food/:food_id', to: 'users#evaluate_food', on: :member
  end
end
