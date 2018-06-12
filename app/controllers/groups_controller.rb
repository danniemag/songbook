class GroupsController < ApplicationController

  def index
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
        format.html { redirect_to groups_path, notice: 'Group was successfully created.' }
        # format.json { render :show, status: :created, location: @line }
        # redirect_to groups_path
      else
        render(:new)
      end
    rescue => e
      puts e.inspect
    end
  end


  private

  def permitted_params
    params.require(:groups).permit(:name, :country, :state, :city)
  end
end
