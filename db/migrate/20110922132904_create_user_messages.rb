class CreateUserMessages < ActiveRecord::Migration
  def self.up
    create_table :user_messages do |t|
      t.text :message, :null => false
      t.string :komu, :null => false
      t.string :result, :default => 'запущено'
      t.integer :numsentmsg, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :user_messages
  end
end
