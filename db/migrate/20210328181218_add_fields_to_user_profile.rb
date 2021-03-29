class AddFieldsToUserProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :address, :string
    add_column :user_profiles, :gender, :string
    add_column :user_profiles, :birthdate, :date 
  end
end
