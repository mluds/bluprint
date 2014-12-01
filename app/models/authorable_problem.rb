class AuthorableProblem < ActiveRecord::Base
  belongs_to :user
  
  validates :problem_text, presence: true
end
