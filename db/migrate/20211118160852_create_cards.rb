class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :title, null: false
      t.string :description, null: true
      t.integer :position, null: false, default: 0

      t.belongs_to :list

      t.timestamps
    end
  end
end
