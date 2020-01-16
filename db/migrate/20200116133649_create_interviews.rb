class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.string :title
      t.string :description
      t.datetime :startdt
      t.datetime :enddt

      t.timestamps
    end
  end
end
