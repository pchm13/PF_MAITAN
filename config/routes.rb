Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/choice'
  devise_for :users
  get '/search' => 'search#search'
  resource :study_counts, only: [:create]
  get '/dangers' => 'dangers#index'
  get '/category' => 'categories#category'

  # collection以降、学習機能実装時、URL要確認
  resources :it_words do
    collection do
      get 'start'
      get 'finish'
      get 'quiz'
      get 'category_quiz'
    end
    member do
      get 'category_show'
    end
    resources :bookmarks, only: %i[create destroy]
    resources :dangers, only: %i[create destroy]
  end

  resources :users, only: %i[index edit update destroy show] do
    member do
      get '/bookmarks' => 'bookmarks#index'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
