class CreateRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :regions do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_reference :cities, :region, index: true
  end
end
