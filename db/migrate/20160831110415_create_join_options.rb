class CreateJoinOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :join_options do |t|
      t.integer :multi_response_id
      t.integer :response_option_id

      t.timestamps
    end
    add_index :join_options, [:multi_response_id, :response_option_id]
  end
end
