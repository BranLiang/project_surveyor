class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :text,  null: false

      t.timestamps
    end
  end
end
