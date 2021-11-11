class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :name, null: false
      t.integer :visibility, default: 0
      t.belongs_to :user
      t.belongs_to :workspace

      t.timestamps
    end

    create_table :board_members do |t|
      t.belongs_to :board
      t.belongs_to :user

      t.timestamps
    end
  end
end
