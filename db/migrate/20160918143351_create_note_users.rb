class CreateNoteUsers < ActiveRecord::Migration
  def change
    create_table :note_users do |t|
      t.integer :user_id
      t.integer :note_id
    end
  end
end
