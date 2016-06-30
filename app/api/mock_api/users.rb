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
        get ':id' do
          User.find(params[:id])
        end

      desc 'update'
        params do
          requires :name, type: String
        end
        put ":id" do
          @user = User.find(params[:id])
          @user.update(name: params[:name])
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
