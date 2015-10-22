class CommentsController < ApplicationController
  before_action :load_commentable

  def create
     @comment = @commentable.comments.new(comment_params)
     if @comment.save
       if params[:comment][:commentable_type] == 'albums'
         redirect_to  "/users/#{params[:comment][:user_id]}/#{params[:comment][:commentable_type]}/#{@commentable.id}"
       else
         redirect_to  "/#{params[:comment][:commentable_type]}/#{@commentable.id}"
       end
     else
       redirect_to  "/#{params[:comment][:commentable_type]}/#{@commentable.id}",
       alert: 'You must supply comment content'
     end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :content)
  end
  def load_commentable
    @commentable = params[:comment][:commentable_type].singularize.classify.constantize.find(params[:comment][:commentable_id])
  end
end
