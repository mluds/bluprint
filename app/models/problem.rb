class Problem < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :authorable_problem
end
