class AddAdminToGroupMember < ActiveRecord::Migration[5.2]
  def change
    add_column :group_members, :admin, :boolean
  end
end
