Rails.application.routes.draw do
  resources :applications, only: [:create, :show], param: :token do
    resources :chats, only: [:create, :index], param: :number do
      resources :messages, only: [:create, :index] do
        collection do
          get 'search', to: 'messages#search'
        end
      end
    end
  end
end
