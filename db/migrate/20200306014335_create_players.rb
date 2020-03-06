class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :alias
      t.integer :points
      t.integer :game_id

      t.timestamps
    end
  end
end
