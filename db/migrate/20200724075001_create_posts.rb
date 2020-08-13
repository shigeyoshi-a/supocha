class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :image
      t.string :name, null: false
      t.string :discipline, null: false
      t.string :place, null: false
      t.string :time, null: false
      t.string :age, null: false
      t.string :level, null: false
      t.string :price, null: false
      t.text :info, null: false
      t.timestamps
    end
  end
end
