class CreateTelefonos < ActiveRecord::Migration[5.0]
  def change
    create_table :telefonos do |t|
      t.integer :numero
      t.references :persona

      t.timestamps
    end

    add_column :personas, :email, :string
    
  end
end
