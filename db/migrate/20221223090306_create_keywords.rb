class CreateKeywords < ActiveRecord::Migration[7.0]
  def change
    create_table :keywords do |t|
      t.references :page, null: false, foreign_key: true
      t.integer :priority
      t.integer :index_val
      t.string :name

      t.timestamps
      t.index :name
    end
  end
end
