class GroupsController < ApplicationController

  def index
    @groups = GroupMember.where(user_id:current_user.id)
  end
end
