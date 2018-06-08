class Song < ApplicationRecord
  belongs_to :group
  has_many :schedules
end
