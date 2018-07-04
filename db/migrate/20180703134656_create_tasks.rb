class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.string :name
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end