module API  
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        prefix "api"
        version "v1", using: :path
        default_format :json
        format :json 
             # Grape::Formatter::ActiveModelSerializers

        helpers do
        # def get_user
        # @user = User.find params[:user_id]
        # end

        # def set_user
        # @user = User.find params[:id]
        # end

        def logger
            Rails.logger
        end

        # def set_resources
        # @user = User.find params[:user_id]
        # @post = @user.posts.find params[:post_id]
        # end

        end

        rescue_from ActiveRecord::RecordNotFound do |e|
          error_response(message: e.message, status: 404)
        end
         rescue_from ActiveRecord::RecordInvalid do |e|
          error_response(message: e.message, status: 422)
        end
      end
    end
  end
end  