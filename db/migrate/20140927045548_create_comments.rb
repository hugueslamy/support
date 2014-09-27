class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :incident
      t.text :body

      t.timestamps
    end
  end
end
