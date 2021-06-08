class CreateOperations < ActiveRecord::Migration[6.1]
  def change
    create_table :operations do |t|
      t.integer :first_number, null: false
      t.integer :second_number, null: false
      t.string :operation_type, null: false

      t.timestamps
    end
  end
end
