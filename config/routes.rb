Rails.application.routes.draw do
  resources :brackets
  resources :users do
    resources :user_brackets, path: 'brackets'
  end
  resources :votes
  post 'brackets/:id/advance_round', to: 'brackets#advance_round'
end
