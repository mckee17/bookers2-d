class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    relation = Relationship.new
    relation.follower_id = current_user.id
    relation.followed_id = user.id
    relation.save
    redirect_back(fallback_location: users_path)
  end

  def destroy
  end

end

