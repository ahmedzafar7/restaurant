class CreateUsersTable < ActiveRecord::Migration
  
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password
      
    end
     add_index :users, :email, unique: true
  end

end
