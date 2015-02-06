class CommentsController < ApplicationController
    before_action :require_user
    
    
   def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:body)) 
    @comment.post = @post
    @comment.creator = current_user
    
    # You can instead do: @comment = @post.comments.build(params.require(:comment).permit(:body))
       
       if @comment.save
           flash[:notice] = "Comment saved"
           redirect_to post_path(@post)
       else
           render 'posts/show'
       end
   end 
end
