class AuthorableAssignment < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :auth_probs,
    class_name: "AuthorableProblem",
    join_table: :assignments_problems,
    foreign_key: :assignment_id,
    association_foreign_key: :problem_id
end
