class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title
      t.text :description
      t.boolean :completed
      t.datetime :completed_at
      t.datetime :due_date
      t.references :task, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
