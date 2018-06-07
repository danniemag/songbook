class Group < ApplicationRecord
  belongs_to :user
  has_many :users, through: :group_members
  has_many :schedules
end
