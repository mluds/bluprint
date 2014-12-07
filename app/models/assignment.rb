class Assignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :authorable_assignment
  has_many :problems
end
