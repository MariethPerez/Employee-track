class CreateDialings < ActiveRecord::Migration[5.2]
  def change
    create_table :dialings do |t|
      t.date :date
      t.string :category
      t.integer :hour
      t.integer :minute
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
