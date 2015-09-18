class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :alerts, :type, :atype
  end
end
