class CreateDepartements < ActiveRecord::Migration
  def change
    create_table :departements do |t|
      t.text :name

      t.timestamps
    end
  end
end
