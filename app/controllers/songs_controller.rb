class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    ActiveRecord::Base.transaction do
      @song = Song.create(permitted_params)
      if @song.save
        flash[:success] =  t('songs.create.success', song_name: @song.name)
        redirect_to @song
      else
        @song.errors.full_messages.each do |message|
          flash[:alert] = message
        end
        render(:new)
      end
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(permitted_params)
      redirect_to song_path
    else
      render(:edit)
    end
  end

  #
  # def destroy
  #   ActiveRecord::Base.transaction do
  #     @group = Group.find(params[:id])
  #     @group.destroy
  #
  #     GroupMemberManager.destroy_group_member(params[:id]) if @group.destroyed?
  #
  #     redirect_to groups_path
  #   end
  # end
  #
  # def destroy_multiple
  #   ActiveRecord::Base.transaction do
  #     group_ids = GroupMember.where(user_id:current_user.id,admin:true).map(&:group_id)
  #     GroupMember.where(group_id: group_ids).destroy_all
  #     Group.where(id: group_ids).destroy_all
  #
  #     respond_to do |format|
  #       format.html { redirect_to groups_path }
  #       format.json { head :no_content }
  #     end
  #   end
  # end
  #

  private

  def permitted_params
    params.require(:song).permit(:name, :singer, :key, :source, :video_url, :lyrics, :sheet)
  end
end
