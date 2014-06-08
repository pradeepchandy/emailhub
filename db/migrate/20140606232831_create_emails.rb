class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.text :objective
      t.datetime :deadline
      t.text :call_to_action
      t.string :email_type
      t.string :recipient_name
      t.text :subject
      t.text :body
      t.integer :requestor_id
      t.integer :supplier_id

      t.timestamps

    end
  end
end
