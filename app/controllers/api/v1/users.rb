module API  
  module V1
    class Users < Grape::API
      include API::V1::Defaults

      helpers do
        def set_user
        @user = User.find params[:id]
        end
      end

      resource :users do

        route_param :id do
        get do
          User.find(params[:id])
        end
      end

        desc "Create user"
        params do
          requires :name, type: String
          requires :title, type: String
          optional :imageUrl, type: String

        end
        post do
          @user = User.create!({
            name: params[:name],
            title: params[:title],
            imageUrl: params[:imageUrl]
            })
      end
    end
  end
 end
end  