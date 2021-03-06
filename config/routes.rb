Posmaster::Application.routes.draw do
  resources :uuid_userids


  resources :zaiko_logs


  resources :abcs


  resources :sho1buns


  resources :orders


  resources :salesmeis


  resources :salesheads


  resources :tokuis


  resources :zaikos


  resources :items


  root :to => "home#index"
  get "home/index"
  get "home/master" => "home#master"
  get "home/index2" => "home#index2"
  #devise_for :users
  devise_for :users, :path_names => { :sign_up => "register" } 
  resources :currents

  post 'record/post' => 'record#post'
  post 'record/itempost' => 'record#itempost'
  post 'record/itempost2' => 'record#itempost2'
  get  'record/list' => 'record#list'
  post 'record/zaikopost' => 'record#zaikopost'
  get  'record/zaikotranpost' => 'record#zaikotranpost'
  post 'record/zaikotranhtml' => 'record#zaikotranhtml'
  get 'record/hasone' => 'record#hasone'
  get 'record/belongs' => 'record#belongs'
  post 'record/tokuipost' => 'record#tokuipost'
  post 'record/sho1bunpost' => 'record#sho1bunpost'
  post 'record/salesheadpost' => 'record#salesheadpost'
  post 'record/salesmeipost' => 'record#salesmeipost'
  get 'record/rireki/:id' => 'record#rireki'
  get 'record/rirekitest/' => 'record#rirekitest'
  post 'record/orderpost' => 'record#orderpost'
  get 'record/searchitem/:id' => 'record#searchitem'
  get 'record/ordersheet/:id' => 'record#ordersheet'
  get 'record/delorder/:id' => 'record#delorder'
  get 'authentication_token/show' => 'authentication_token#show'
  get 'authentication_token/auth' => 'authentication_token#auth'
  get 'authentication_token/user' => 'authentication_token#user'
  post 'ctrl/upfile/:id' => 'ctrl#upfile'
  post 'ctrl/upload_process/:id/:id2' => 'ctrl#upload_process'
  get 'record/delsaleshead/:id' => 'record#delsaleshead'
  get 'record/salesheadshow/:id/:id2' => 'record#salesheadshow'
  get 'salesmeis/show/:id/:id2' => 'salesmeis#show'
  get 'salesmeis/showzaiko/:id/:id2' => 'salesmeis#showzaiko'
  get 'ctrl/act2/:id' => 'ctrl#act2'
  get 'ctrl/act3/:id' => 'ctrl#act3'
  get 'salesheads/serchdayoutlet/:id/:id2' => 'salesheads#serchdayoutlet'
  get 'abcs/index/:id' => 'abcs#index'
  post 'salesheads/serchhead/:id1/:id2' => 'salesheads#serchhead'
  get 'salesheads/serchheaddayoutlet/:id1/:id2' => 'salesheads#serchheaddayoutlet'
  post 'abcs/show/:id1/:id2' => 'abcs#show'
  get 'ctrl/act5/:id/:id2' => 'ctrl#act5'
  get 'ctrl/act6/:id/:id2' => 'ctrl#act6'
  get 'ctrl/act7/:id/:id2' => 'ctrl#act7'
  get 'sort/sortabc/' => 'sort#sortabc'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
