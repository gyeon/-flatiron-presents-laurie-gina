class ChangeCipherTextNameInDecrypts < ActiveRecord::Migration[5.0]
  def change
    rename_column :decrypts, :cipher_text, :message 
  end
end
