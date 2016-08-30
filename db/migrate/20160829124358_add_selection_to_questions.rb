class AddSelectionToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :multi_selection, :boolean
  end
end
