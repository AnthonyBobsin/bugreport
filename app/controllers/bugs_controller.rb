class BugsController < ApplicationController

  def new
    @bug = Bug.new
  end

  def create
    @bug = Bug.new(bug_params)
    @bug.user = current_user
    @bug.is_closed = false
    if @bug.save
      flash[:success] = "You successfully reported the bug"
      redirect_to bugs_path
    else
      flash[:danger] = "You failed to report the bug"
      redirect_to new_bug_path
    end
  end

  def index
    @bugs = Bug.all
  end

  def close
    @bug = Bug.find(params[:id])
    @bug.is_closed = true
    if @bug.save
      flash[:success] = "You successfully closed the bug"
      redirect_to bugs_path
    else
      flash[:danger] = "You failed to close the bug"
      redirect_to bugs_path
    end
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :description, :priority)
  end

end
