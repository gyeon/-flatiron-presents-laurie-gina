class EncryptsController < ApplicationController
 
  def new
    @encrypt = Encrypt.new
  end

  def create

    @encrypt = Encrypt.create(text: params[:encrypt][:text], key: params[:encrypt][:key])
    

    @encrypt.cipher_text = @encrypt.encrypt
    @encrypt.update(cipher_text: @encrypt.cipher_text)
    
    redirect_to encrypt_path(@encrypt)
  end

  def show
    @encrypt = Encrypt.find(params[:id])
  end

  def encrypt_params
    params.require(:encrypt).permit(:text, :key, :cipher_text)
  end

end

