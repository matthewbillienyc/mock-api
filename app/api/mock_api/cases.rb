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
      get 'users/:id/cases' do
        Case.find_all(params[:id])
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
          requires :name, type: String
        end
        post do
          Case.create(name: params[:name])
        end
    end
  end
end
