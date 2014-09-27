class AddHoldingToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :holding, :boolean
  end
end
