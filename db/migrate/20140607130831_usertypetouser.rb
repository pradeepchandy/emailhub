class Usertypetouser < ActiveRecord::Migration
  def change
add_column :users, :usertype, :string
  end
end
