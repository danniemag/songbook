class SubscribeController < ApplicationController

  def index
    @subscriptions = GroupMember.where(user_id:current_user.id, can_edit:nil)
  end
end
