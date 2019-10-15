class SubmissionsController < ApplicationController
  def index
    @submissions = Submission.order(created_at: :desc)
  end

  def new
    @submission = Submission.new
  end

  def create
    attrs = params.require(:submission).permit(:title, :description, :art)
    @submission = Submission.new(attrs)
    @submission.user_id = session[:user_id]
    @submission.save
    redirect_to submissions_path
  end

  def show
    @submission = Submission.find(params['id'])
    @comment = @submission.comments.build
    @comment.user_id = session[:user_id]
    @comments = @submission.comments.includes(:user)
    @canEdit = @submission.user_id == session[:user_id]
    # @count = @post.votes.length
  end

  def edit
    @submission = Submission.find(params['id'])
  end

  def update
    @submission = Submission.find(params['id'])
    attrs = params.require(:submission).permit(:title, :description)
    @submission.update(attrs)
    redirect_to submissions_path
  end
end
