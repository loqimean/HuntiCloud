class CreateProfits < ActiveRecord::Migration[7.0]
  def change
    create_table :profits do |t|
      t.decimal :amount, null: false
      t.decimal :daily_expences
      t.decimal :funds_for_expensive_purchase
      t.decimal :funds_for_others
      t.decimal :funds_for_self_development
      t.decimal :investment_funds
      t.decimal :savings
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :envelope_formula, foreign_key: true

      t.timestamps
    end
  end
end
