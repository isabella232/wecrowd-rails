class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.integer :goal_cents
      t.integer :amount_donated
      t.string :account_type
      t.integer :state, :limit => 1
      t.integer :promoted
      t.datetime :deleted_at
      
      t.timestamps
    end
    
    add_index :campaigns, :user_id
    add_index :campaigns, :promoted
  end
end
