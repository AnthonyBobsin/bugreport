class BugsController < ApplicationController

  def new
    @bug = Bug.new
  end

  def create
    @bug = Bug.new(bug_params)
    @bug.user = current_user
    @bug.is_closed = false
    if @bug.save
      UserMailer.bug_submit(current_user, @bug).deliver_now
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
      UserMailer.bug_closed(current_user, @bug).deliver_now
      flash[:success] = "You successfully closed the bug"
      redirect_to bugs_path
    else
      flash[:danger] = "You failed to close the bug"
      redirect_to bugs_path
    end
  end

  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy
    flash[:success] = "You successfully deleted the bug."
    redirect_to bugs_path
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :description, :priority)
  end

end
