class AddIsMinorToUsers < ActiveRecord::Migration[6.1]

  def up
    execute <<-SQL
      ALTER TABLE users
      ADD COLUMN is_minor boolean GENERATED ALWAYS AS (age < 21) STORED
    SQL

    add_index :users, :is_minor
  end

  def down
    remove_column :users, :is_minor
  end
end
