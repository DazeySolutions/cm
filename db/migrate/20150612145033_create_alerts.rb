class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :title
      t.string :description
      t.string :type
      t.datetime :start
      t.datetime :end
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
