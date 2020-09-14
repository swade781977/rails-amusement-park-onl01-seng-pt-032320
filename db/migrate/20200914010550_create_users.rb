class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :height
      t.integer :happiness
      t.integer :nausea
      t.string :password_digest
      t.integer :tickets
      t.boolean :admin, null: false

      t.timestamps
    end
  end
end
