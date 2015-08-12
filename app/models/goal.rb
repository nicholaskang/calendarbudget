class Goal < ActiveRecord::Base
  belongs_to :goal_type
  belongs_to :frequency
  belongs_to :user
end
