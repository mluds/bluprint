class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.references :user, index: true
      t.references :assignment, index: true
      t.references :authorable_problem, index: true
      t.boolean :completed
      t.integer :attempts
      t.text :last_attempt

      t.timestamps
    end
  end
end
