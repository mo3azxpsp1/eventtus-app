module API  
  module V1
    class Comments < Grape::API
      include API::V1::Defaults


      helpers do
        def get_post
        @post = Post.find params[:post_id]
        end
      end
      
      resource :posts do
        route_param :post_id do
        resource :comments do
          desc "Return all comments on a post"
          get do
            get_post.comments
          end

          desc "Create a comment"
          params do
            requires :content, type: String, desc: "Your comment."
            requires :user_id, type: Integer
          end
          post do
            get_post.comments.create!({
              user_id: params[:user_id],
              content: params[:content]
            })
          end
         end 
        end
      end
    end
  end
end  