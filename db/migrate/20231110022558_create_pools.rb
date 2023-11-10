class CreatePools < ActiveRecord::Migration[7.1]
  def change
    create_table :pools do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.datetime :start_datetime
      t.integer :status, default: 0
      t.boolean :private, default: true

      t.timestamps
    end
  end
end
