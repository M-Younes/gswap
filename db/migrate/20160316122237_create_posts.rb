class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :console
      t.string :name
      t.string :category
      t.string :prefered
      t.string :image
      t.integer :user_id
      t.string :note
      t.boolean :swaped

      t.timestamps null: false
    end
  end
end
