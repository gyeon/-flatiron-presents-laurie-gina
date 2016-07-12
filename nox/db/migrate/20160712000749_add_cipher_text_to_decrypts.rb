class AddCipherTextToDecrypts < ActiveRecord::Migration[5.0]
  def change
    add_column :decrypts, :cipher_text, :string
  end
end
