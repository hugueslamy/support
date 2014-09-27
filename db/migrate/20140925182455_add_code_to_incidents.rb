class AddCodeToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :code, :string
  end
end
