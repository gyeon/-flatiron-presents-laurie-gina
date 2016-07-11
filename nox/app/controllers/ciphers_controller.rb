class CiphersController < ApplicationController
  def root
  end

  def new
    @cipher = Cipher.new
  end

  # def create

  #   # @cipher = Cipher.create(cipher_params)
  #   # redirect_to cipher_path(@cipher)
  # end

  def show
    @cipher = Cipher.find(params[:id])
  end

  def cipher_params
    params.require(:cipher).permit(:text, :key)
  end

  def encrypt
    @cipher = Cipher.create(cipher_params)
    @cipher.encrypt
    redirect_to cipher_path(@cipher)
  end

  def decrypt
  end

end
