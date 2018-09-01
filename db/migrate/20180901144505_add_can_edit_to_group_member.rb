class AddCanEditToGroupMember < ActiveRecord::Migration[5.2]
  def change
    add_column :group_members, :can_edit, :boolean
  end
end
