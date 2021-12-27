class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.string :color, default: 'white'

      t.belongs_to :board
      t.belongs_to :card

      t.timestamps
    end
  end
end
