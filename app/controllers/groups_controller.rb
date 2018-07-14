class GroupsController < ApplicationController
  # before_action :authenticate_user!

  def index
    # @group = Group.all
    @groups = GroupMember.where(user_id:current_user.id)
  end

  def new
    @group = Group.new
  end

  def create
    ActiveRecord::Base.transaction do
      @group = Group.new(permitted_params)
      if @group.save
        GroupMemberManager.create_group(@group, current_user)
        flash[:success] =  t('groups.create.success', group_name: @group.name)
        redirect_to groups_path
      else
        @group.errors.full_messages.each do |message|
          flash[:alert] = message
        end
        render(:new)
      end
    end
  end

  private

  def permitted_params
    params.require(:group).permit(:name, :country, :state, :city)
  end
end
