class CreateLostFounds < ActiveRecord::Migration
  def change
    create_table :lost_founds do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.boolean :approved

      t.timestamps
    end
  end
end
