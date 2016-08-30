class CreateResponseOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :response_options do |t|
      t.integer :question_id, null: false
      t.text    :text,        null: false

      t.timestamps
    end
    add_index :response_options, :question_id
  end
end
