class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.integer :questions_total
      t.integer :questions_correct
      t.integer :user_id

      t.timestamps
    end
    add_index :attempts, [:user_id, :created_at]
  end
end
