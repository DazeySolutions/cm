class CreateSermons < ActiveRecord::Migration
  def change
    create_table :sermons do |t|
      t.string :title
      t.text :description
      t.datetime :start
      t.datetime :end
      t.attachment :image
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
