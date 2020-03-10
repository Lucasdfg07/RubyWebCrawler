Rails.application.routes.draw do
  resources :quotes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	namespace 'v1' do
		resources :quotes
    #   collection do
    #     get 'show_url'
    #   end
    # end
	end
end
