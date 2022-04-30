class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :second_name
      t.string :last_name
      t.bigint :phone_number
      t.string :photo, null: false
      t.string :email
      t.integer :gender
      t.datetime :birthday
      t.text :characteristic
      t.decimal :blue_personality, precision: 10, scale: 2, default: 0
      t.decimal :red_personality, precision: 10, scale: 2, default: 0
      t.decimal :green_personality, precision: 10, scale: 2, default: 0
      t.decimal :yellow_personality, precision: 10, scale: 2, default: 0

      t.references :childhood_city, null: true, foreign_key: { to_table: 'cities' }
      t.references :current_city, null: false, foreign_key: { to_table: 'cities' }

      t.timestamps
    end
  end
end
