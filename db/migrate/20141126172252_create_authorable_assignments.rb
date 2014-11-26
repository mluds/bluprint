class CreateAuthorableAssignments < ActiveRecord::Migration
  def change
    create_table :authorable_assignments do |t|
      t.references :user, index: true
      t.string :title

      t.timestamps
    end
  end
end
