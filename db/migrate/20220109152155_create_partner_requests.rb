class CreatePartnerRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :partner_requests do |t|
      t.string :status, null: false, default: 'pending'

      t.references :invited, null: false, foreign_key: { to_table: :users }
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
