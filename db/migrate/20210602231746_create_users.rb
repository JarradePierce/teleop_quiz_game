class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.password :password

      t.timestamps
    end
  end
end
