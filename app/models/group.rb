class Group < ApplicationRecord

  has_many :group_members, class_name: 'GroupMember'
  has_many :users, through: :group_members
  has_many :schedules

  validates_presence_of :name
end
