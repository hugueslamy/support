class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.text :requestor_name
      t.text :requestor_email
      t.references :departement
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
