class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :text
      t.belongs_to :collection, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
