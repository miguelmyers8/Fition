class CommentsController < ApplicationController
  before_action :set_photo

  def create
    @comment = @photo.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "You commented the hell out of that photo!"
      redirect_to :back
    else
      flash[:alert] = "Check the comment form, something went horribly wrong."
      render root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_photo
    @photo = Photo.find(params[:photo_id])
  end



end
