class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.string :name, null: false
      t.integer :position, null: false, default: 0

      t.belongs_to :board

      t.timestamps
    end
  end
end
