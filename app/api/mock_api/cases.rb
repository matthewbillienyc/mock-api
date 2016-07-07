module MockAPI
  class Cases < Grape::API
    format :json

    resource :cases do
      desc 'index'
        params do
          # parameters go here
        end
        get do
          Case.all
        end

      desc 'show'
        params do

        end
        get ':id' do
          Case.find(params[:id])
        end

      desc 'find all by user id'
      params do

      end
      get '/users/:id' do
        @cases = Case.where(user_id: params[:id])
      end

      desc 'update'
        params do
          requires :name, type: String
        end
        put ":id" do
          @case = Case.find(params[:id])
          @case.update(name: params[:name])
        end

      desc 'create'
        params do
          requires :description, type: String
          requires :user_id, type: Integer
        end
        post do
          Case.create(description: params[:description], user_id: params[:user_id])
        end
    end
  end
end
