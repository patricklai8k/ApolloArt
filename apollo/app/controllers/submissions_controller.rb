class SubmissionsController < ApplicationController
  def index
    @submissions = Submission.order(created_at: :desc)
  end

  def new
    @submission = Submission.new
  end

  def create
    attrs = params.require(:submission).permit(:title, :description)
    @submission = Submission.new(attrs)
    @submission.save
    redirect_to submissions_path
  end

  def show
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
