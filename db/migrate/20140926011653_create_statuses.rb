class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.boolean :initial
      t.boolean :closing

      t.timestamps
    end
  end
end
