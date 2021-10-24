class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    @relation = Relationship.new(follower_id: current_user.id, followed_id: user.id)
    if @relation.follower_id != @relation.followed_id
      if @relation.save
        redirect_back(fallback_location: users_path)
      else
        redirect_to users_path, alert:'You have already followed.'
      end
    end
  end

  def destroy
    user = User.find(params[:user_id])
    relation = Relationship.find_by(followed_id: user.id, follower_id: current_user.id)
    relation.destroy
    redirect_back(fallback_location: users_path)
  end

  def follow
    @user = User.find(params[:user_id])
    @follow_users = @user.followed_users
  end

  def follower
    @user = User.find(params[:user_id])
    @follower_users = @user.follower_users
  end

end
