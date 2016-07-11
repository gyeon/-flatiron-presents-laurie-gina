class CreateCiphers < ActiveRecord::Migration[5.0]
  def change
    create_table :ciphers do |t|
      t.string :text
      t.string :key

      t.timestamps
    end
  end
end
