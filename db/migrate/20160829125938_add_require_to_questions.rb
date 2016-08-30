class AddRequireToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :required, :boolean, null: false
  end
end
