class GroupsController < ApplicationController

  def index
    @group = Group.all
    # @group_member = GroupMember.where(user_id:current_user.id)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(permitted_params)
    if @group.save
      # GroupMemberManager.create_group(@group, current_user)
      flash[:success] =  t('activerecord.group.create.success', group_name: @group.name)
      redirect_to groups_path
    else
      @group.errors.full_messages.each do |message|
        flash[:alert] = message
      end
      render(:new)
    end
  end

  private

  def permitted_params
    params.require(:group).permit(:name, :country, :state, :city)
  end
end
