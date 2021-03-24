class CreateWines < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|
      t.string :description
      t.references :type, foreign_key: true
      t.references :grape_type, foreign_key: true
      t.references :country, foreign_key: true
      t.float :price
      t.integer :amount
      t.string :url_img
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
