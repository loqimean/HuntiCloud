class CreateEnvelopeFormulas < ActiveRecord::Migration[7.0]
  def change
    create_table :envelope_formulas do |t|
      t.string :name, null: false
      t.decimal :daily_expences, precision: 10, scale: 2, null: false
      t.decimal :savings, precision: 10, scale: 2, null: false
      t.decimal :funds_for_others, precision: 10, scale: 2, null: false
      t.decimal :funds_for_self_development, precision: 10, scale: 2, null: false
      t.decimal :funds_for_expensive_purchase, precision: 10, scale: 2, null: false
      t.decimal :investment_funds, precision: 10, scale: 2, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
