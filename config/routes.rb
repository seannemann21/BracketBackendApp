Rails.application.routes.draw do
  resources :brackets
  resources :users do
    resources :user_brackets, path: 'brackets'
  end
end
