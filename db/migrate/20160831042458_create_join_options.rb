class CreateJoinOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :join_options do |t|
      t.integer :response_option_id
      t.integer :multi_response_id

      t.timestamps
    end
    add_index :join_options, [:response_option_id, :multi_response_id]
  end
end
