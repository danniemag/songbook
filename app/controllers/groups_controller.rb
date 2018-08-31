class GroupsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @groups = GroupMember.where(user_id:current_user.id)
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    ActiveRecord::Base.transaction do
      @group = Group.new(permitted_params)
      if @group.save
        GroupMemberManager.create_group_member(@group, current_user)
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

  def destroy
    ActiveRecord::Base.transaction do
      @group = Group.find(params[:id])
      @group.destroy

      GroupMemberManager.destroy_group_member(params[:id]) if @group.destroyed?

      redirect_to groups_path
    end
  end

  def destroy_multiple
    ActiveRecord::Base.transaction do
      group_ids = GroupMember.where(user_id:current_user.id,admin:true).map(&:group_id)
      GroupMember.where(group_id: group_ids).destroy_all
      Group.where(id: group_ids).destroy_all

      respond_to do |format|
        format.html { redirect_to groups_path }
        format.json { head :no_content }
      end
    end
  end



  private

  def permitted_params
    params.require(:group).permit(:name, :country, :state, :city)
  end
end
