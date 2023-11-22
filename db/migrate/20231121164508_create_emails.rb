class CreateEmails < ActiveRecord::Migration[7.1]
  def change
    create_table :emails do |t|
      t.text :body
      t.string :object

      t.timestamps
    end
  end
end
