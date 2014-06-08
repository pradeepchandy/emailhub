class AddStatustoemail < ActiveRecord::Migration
 def change
add_column :emails, :status, :string
  end
end
