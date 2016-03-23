class CreatePortraits < ActiveRecord::Migration
  def change
    create_table :portraits do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
