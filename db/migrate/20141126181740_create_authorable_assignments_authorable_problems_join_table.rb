class CreateAuthorableAssignmentsAuthorableProblemsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :assignments, :problems do |t|
      t.index [:assignment_id, :problem_id]
      t.index [:problem_id, :assignment_id]
    end
  end
end
