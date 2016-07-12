class AddCipherTextToEncrypts < ActiveRecord::Migration[5.0]
  def change
    add_column :encrypts, :cipher_text, :string
  end
end
