class CreateWorkspaces < ActiveRecord::Migration[6.1]
  def change
    create_table :workspaces do |t|
      t.string :name, null: false
      t.boolean :public, default: false
      t.belongs_to :user

      t.timestamps
    end
  end
end
