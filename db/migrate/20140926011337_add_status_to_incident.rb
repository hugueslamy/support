class AddStatusToIncident < ActiveRecord::Migration
  def change
    add_reference :incidents, :status, index: true
  end
end
