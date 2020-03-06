class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :question
      t.integer :answer_id
      t.integer :game_id

      t.timestamps
    end
  end
end