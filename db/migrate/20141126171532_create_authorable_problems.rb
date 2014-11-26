class CreateAuthorableProblems < ActiveRecord::Migration
  def change
    create_table :authorable_problems do |t|
      t.references :user, index: true
      t.text :problem_text
      t.text :solution_diagram
      t.text :solution_model
      t.text :partial_solution
      t.integer :style

      t.timestamps
    end
  end
end
