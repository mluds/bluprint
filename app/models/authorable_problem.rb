class AuthorableProblem < ActiveRecord::Base
  belongs_to :user
  has_many :problems

  validates :problem_text, presence: true
end
