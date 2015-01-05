class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
    	t.string :teste
    	t.timestamp
    end
  end
end