class MessagesController < ApplicationController

    before_action :set_post

    def index
      @message = Message.new
      @messages = @post.messages.includes(:user)
      
    end
  
    def create
      @message = Message.create(message_params)
      respond_to do |format|
        format.html { redirect_to "/posts/#{params[:post_id]}/messages"  }
        format.json
      end
      # redirect_to "/posts/#{params[:post_id]}/messages"
    end
    
    private
  
    def message_params
      params.require(:message).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
    end
  
    def set_post
      @post = Post.find(params[:post_id])
    end

end
