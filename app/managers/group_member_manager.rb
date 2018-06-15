class GroupMemberManager

  def self.create_group(group, current_user)
    ActiveRecord::Base.transaction do
      group_member = GroupMember.new(group_id: group.id, user_id: current_user.id, admin: true)
      group_member.save!
    end
  end
end