module API  
  module V1
    class Posts < Grape::API
      include API::V1::Defaults

      

      helpers do
        def get_user
        @user = User.find params[:user_id]
        end
      end

      resource :users do
        route_param :user_id do
          resource :posts do
          desc "Return all posts"
        
          get do
          get_user.posts
          end

          desc "Create a post"
          params do
          requires :content, type: String, desc: "Your post."
          end
          post do
          user.post.create!({
            content: params[:content]
            })
          end
         end 
        end
      end
    end
  end
end  