class LikesController < ApplicationController
  def create
    user = Micropost.find(params[:micropost_id]).user
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = 'Likeしました！'
    redirect_to user
  end

  def destroy
    user = Micropost.find(params[:micropost_id]).user
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success] = 'Likeを解除しました'
    redirect_to user
  end
end
