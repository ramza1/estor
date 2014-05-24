Shopnany::Application.routes.draw do
  get "products/show"
  get "products/index"



  devise_for :users, :path_prefix => 'store', :controllers => { :registrations => "registrations", :sessions => "sessions", :passwords => "passwords" }





  get "terms", to: "welcome#terms"
  get "privacy", to: "welcome#privacy"
  get "features", to: "welcome#features"
  get "faq", to: "welcome#faq"
  get "about_shopnany", to: "welcome#about_shopnany"
  get "contact", to: "welcome#contact"
  get 'pricing', to: "welcome#pricing"

  resources :subscribers, only: [:create]
  resources :messages, only: [:create]
  resources :themes, only: [:index, :show]


  get "dashboard/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end


    resources :wish_items,  :only => [:index, :destroy]


    resources :search_suggestions
    resources :mailing_lists, only: [:create]


    get "about", to: "welcome#about"
    get "privacy_policy", to: "welcome#privacy_policy"
    get "terms_and_conditions", to: "welcome#terms_and_conditions"
    get "contact_us_info", to: "welcome#contact_us_info"

    get "activation" => "payments#notify", as: :payments_notify
    get "success" => "payments#thank_you", as: :payments_successful
    get "failed" => "payments#failure_alert", as: :payments_failed
    post 'find_products' => "products#search", as: :find_products

    devise_for :customers, :path_prefix => 'account'
    resources :customers do
      member do
        get 'change_password'
        put 'change_my_password'
      end
    end
    resources :comments


    resources :products
    resources :categories
    resources :brands
    resources :states
    resources :product_types

    get "search" => "products#search", as: :search

    namespace :admin do
      resources :featured_products
      namespace :wizards do
        resources :brands,              only: [:index, :create, :update]
        resources :products,            only: [:new, :create]
        resources :properties,          only: [:index, :create, :update]
        resources :prototypes,          only: [:update]
        resources :tax_categories,      only: [:index, :create, :update]
        resources :shipping_categories, only: [:index, :create, :update]
        resources :product_types,       only: [:index, :create, :update]
      end

      namespace :history do
        resources  :orders, only: [:index, :show] do
          resources  :addresses, only: [:index, :show, :edit, :update, :new, :create]
        end
      end

      namespace :fulfillment do
        resources  :orders do
          member do
            put :create_shipment
          end
          resources  :comments
        end

        namespace :partial do
          resources  :orders do
            resources :shipments, only: [ :create, :new, :update ]
          end
        end

        resources  :shipments do
          member do
            put :ship
          end
          resources  :addresses , only: [:edit, :update]# This is for editing the shipment address
        end
      end

      namespace :document do
        resources :invoices
      end


      namespace :rma do
        resources  :orders do
          resources  :return_authorizations do
            member do
              put :complete
            end
          end
        end
        #resources  :shipments
      end

      resources :users
      root :to => 'dashboard#index'
      namespace :images do
        resources :products
      end
      resources :themes,  :only => [:index, :show] do
        member do
          post :apply_theme
          post :add_to_collection
        end
      end
      resources :prototypes
      resources :product_types
      resources :image_groups
      resources :properties
      resources :shop_themes do
        member do
          post :apply_theme
          post :disable_theme
        end
      end

      namespace :shopping do
        resources :carts
        resources :products
        resources :users
        namespace :checkout do
          resources :billing_addresses, only: [:index, :update, :new, :create, :select_address] do
            member do
              put :select_address
            end
          end
          resources :credit_cards
          resource  :order, only: [:show, :update, :start_checkout_process] do
            member do
              post :start_checkout_process
            end
          end
          resources :shipping_addresses, only: [:index, :update, :new, :create, :select_address] do
            member do
              put :select_address
            end
          end
          resources :shipping_methods, only: [:index, :update]
        end
      end

      namespace :generic do
        resources :coupons
        resources :deals
        resources :sales
      end

      namespace :inventory do
        resources :suppliers
        resources :overviews
        resources :purchase_orders
        resources :receivings
        resources :adjustments
      end

      namespace :changes do
        resources :products do
          resource :property,          only: [:edit, :update]
        end
      end
      get "products/product_wizard" => "products#product_wizard", as: :product_wizard
      get "activation" => "activation#notify", as: :activation
      get "success" => "activation#thank_you", as: :successful_activation
      get "failed" => "products#failure_alert", as: :failed_activation
      resources :products do
        member do
          get :upload_images
          get :add_properties
          put :activate
        end

        resources :images
        resources :variants
      end

      namespace :products do
        resources :descriptions, only: [:edit, :update]
      end

      namespace :multi do
        resources :products do
          resource :variant,      only: [:edit, :update]
        end
      end
      namespace :config do
        resources :shipping_categories
        resources :shipping_rates
        resources :shipping_zones
        resources :shipping_methods
        resources :tax_rates
        resources :countries do
          resources :states
        end
      end
      resources :posts
      resources  :orders  do
        member do
          post :reject
          post :reopen
          post :mark_as_shipped
        end
      end
      resources :images
      resources :categories
      resources :customers
      resources :shops do
        member do
          get 'basic_update'
          get 'about_update'
          get 'contact_update'
          get 'social_update'
          get 'search_update'
          get 'bank_update'
          get 'privacy_update'
          get 'terms_update'
          get 'logo_update'
        end
      end
      resources :slides
      resources :withdrawals, only: [:create, :index]
      resources :posts
      resources :mailing_lists
      resources :news_letters do
        member do
          post :send_now
        end
      end
      resources :comments
      resources :brands
    end

    namespace :shopping do
      resources  :cart_items do
        member do
          put :move_to
        end
      end
      #resource  :coupon, :only => [:show, :create]
      resources  :orders do
        member do
          get :checkout
          post :pay
          post :delivery_request
          post :session_delivery_request
        end
      end
      resources  :shipping_methods
      resources  :orders
      resources  :addresses do
        member do
          put :select_address
        end
      end
    end

    namespace :myaccount do
      resources :orders
      get 'completed_orders' => "orders#completed", as: :completed_orders
      get 'pending_orders' => "orders#pending", as: :pending_orders
      get 'awaiting_shipping_orders' => "orders#awaiting_shipping", as: :shipping_orders
      root :to => 'dashboard#index'
      resources :addresses
      resources :credit_cards
      resource  :store_credit, :only => [:show]
      resource  :overview, :only => [:show, :edit, :update]
    end

    namespace :blog do
      root :to => 'posts#index'
      resources :posts, only: [:index, :show]
    end


  root :to => 'welcome#index'

end
