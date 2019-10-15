class CommentsController < ApplicationController
  def create
    # require 'pry'; binding.pry
    @submission = Submission.find(params[:submission_id])

    @comment = @submission.comments.build(params.require(:comment).permit(:content))
    @comment.user_id = session[:user_id]
    if @comment.save
      redirect_to submission_path(@submission)
    else
      @comments = @submission.comments
      render 'submissions/show'
    end
  end
end
