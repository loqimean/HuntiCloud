class CreateGallery < ActiveRecord::Migration[6.1]
  def change
    create_table :galleries do |t|
      t.string :file, null: false
      t.boolean :share, default: true, null: false
      t.boolean :removed, default: false, null: false
      t.boolean :favorite, default: false, null: false
      t.integer :count_of_views, default: 0, null: false
      t.references :user, index: true

      t.timestamps
    end
  end
end
