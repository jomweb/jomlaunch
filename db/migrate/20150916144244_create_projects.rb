class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :logo
      t.string :developer_name
      t.string :developer_url
      t.string :submitter_name
      t.string :submitter_email
      t.string :submitter_phone
      t.string :category
      t.string :state

      t.timestamps null: false
    end
    add_index :projects, :submitter_email
    add_index :projects, :category
    add_index :projects, :state
  end
end
