class GroupMemberManager

  def self.create_group_member(group, current_user)
    group_member = GroupMember.new(group_id: group.id, user_id: current_user.id, admin: true, can_edit: true)
    group_member.save!
  end

  # def self.update_group_member(group, current_user)
  #   ActiveRecord::Base.transaction do
  #     group_member = GroupMember.new(group_id: group.id, user_id: current_user.id, admin: true)
  #     group_member.save!
  #   end
  # end

  def self.destroy_group_member(group_id)
    GroupMember.destroy_all(:group_id => group_id)
  end

  def self.destroy_group_member2(group_id)
    GroupMember.destroy_all(:group_id => group_id)
  end

end