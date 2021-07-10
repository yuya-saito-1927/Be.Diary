Rails.application.routes.draw do
  
  get 'favorites/create'                                                                #いいね追加
  get 'favorites/destroy'                                                               #いいね削除
  
  devise_for :users
  
  root to:'homes#top'                                                                   #topページ
  get 'home/about' => 'homes#about', as: 'about'                                        #aboutページ
  
  resources :users, only: [:index, :show, :edit, :update] do                            #会員機能
    member do                                                                           #会員退会処理
      get 'unsubscribe'
      patch 'withdraw'
    end 
    resource :relationships, only: [:create, :destroy]                                  #フォロー・フォロワー機能
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' =>'relationships#followers', as: 'followers'
  end 
  
  resources :diaries do                                                                 #日記機能
    collection do 
      delete 'destroy_all'
    end 
    resources :diary_details do                                                         #日記詳細機能
      collection do 
        delete 'destroy_all'
      end 
      resources :post_comments, only: [:create, :destroy]                               #コメント機能
      resource :favorites, only: [:create, :destroy]                                    #いいね機能
    end 
  end 
  
  post 'follow/:id' => 'relationship#follow', as: 'follow'                              #フォロー追加
  post 'unfollow/:id' => 'relationship#unfollow', as: 'unfollow'                        #フォロー削除
end 
