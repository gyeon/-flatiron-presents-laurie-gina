class CiphersController < ApplicationController
  def new
    @cipher = Cipher.new
  end

  def create
    @cipher = Cipher.create(cipher_params)
    redirect_to cipher_path(@cipher)
  end

  def show
    @cipher = Cipher.find(params[:id])
  end

  def cipher_params
    params.require(:cipher).permit(:text, :key)
  end
end
