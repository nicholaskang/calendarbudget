class Income < ActiveRecord::Base
  belongs_to :user
  belongs_to :income_type
  belongs_to :frequency


end
