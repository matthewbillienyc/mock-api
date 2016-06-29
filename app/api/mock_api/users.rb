module MockAPI
  class Users < Grape::API
    format :json

    resource :users do
      desc 'index'
      params do
        # parameters go here
      end
      get do
        User.all
      end

      desc 'show'
      params do
      end
      get do
        User.find(params[:id])
        byebug
      end

      desc 'create'
      params do
        requires :name, type: String
      end
      post do
        User.create(name: params[:name])
      end
    end
  end
end
