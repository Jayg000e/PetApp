class CreateUsersAndActivitesAndModifyPets < ActiveRecord::Migration[7.0]
  def change
    # Create the 'users' table
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :role
      t.timestamps
    end

    # Modify the 'pets' table
    add_column :pets, :onsale, :boolean
    add_column :pets, :price, :float
    add_reference :pets, :user, foreign_key: true

    # Create the 'activites' table
    create_table :activities do |t|
      t.string :content
      t.references :pet, foreign_key: true
      t.timestamps
    end
  end
end
