Rails.application.routes.draw do
  get '/search' => 'search#search'                                                      #検索
  get 'favorites/create'                                                                #いいね追加
  get 'favorites/destroy'                                                               #いいね削除
  
  resources :contacts, only: [:new, :create]                                            #お問い合わせ機能
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'                        #お問い合わせ確認画面
  post 'contacts/back', to: 'contacts#back', as: 'back'                                 #お問い合わせ内容に誤りがあった場合
  get 'done', to: 'contacts#done', as: 'done'                                           #お問い合わせ完了画面

  
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
