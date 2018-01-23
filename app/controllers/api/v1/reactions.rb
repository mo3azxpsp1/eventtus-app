module API  
  module V1
    class Reactions < Grape::API
      include API::V1::Defaults

      helpers do
        def get_post
        @post = Post.find params[:post_id]
        end

        def count
          get_post.reactions.size
        end  
      end

    resource :posts do
      route_param :post_id do
      resource :reactions do
        
          desc "Create a reaction"
          params do
          requires :user_id, type: Integer
          end
          post do
          get_post.reactions.create!({
            user_id: params[:user_id]
            })
          end
        end
      end
    end
    end
  end
end  