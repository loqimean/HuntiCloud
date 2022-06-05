class AddSocialLinksToPeople < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :instagram_url, :string
    add_column :people, :telegram, :string
  end
end
