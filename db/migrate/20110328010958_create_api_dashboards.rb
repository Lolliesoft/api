class CreateApiDashboards < ActiveRecord::Migration
  def self.up
    create_table :api_dashboards do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :api_dashboards
  end
end
