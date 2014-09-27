class AddAssigneeToIncident < ActiveRecord::Migration
  def change
    add_reference :incidents, :assignee, index: true
  end
end
