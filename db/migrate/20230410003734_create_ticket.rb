class CreateTicket < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :subject
      t.integer :age

      t.timestamps
    end
  end
end
