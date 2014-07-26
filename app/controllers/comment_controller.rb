class CommentController < ApplicationController

  def create
    parameters = params[:comment]
    @comment = Comment.new(parameters.permit(:content,:author))
    @comment.post = Post.find_by_id(params[:post_id])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post , notice: 'Comment was successfully created.' }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

end
