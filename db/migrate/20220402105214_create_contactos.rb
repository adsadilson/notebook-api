class CreateContactos < ActiveRecord::Migration[7.0]
  def change
    create_table :contactos do |t|
      t.string :name
      t.string :email
      t.date :birthdate

      t.timestamps
    end
  end
end
