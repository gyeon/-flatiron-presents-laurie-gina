class DecryptsController < ApplicationController
  def new
    @decrypt = Decrypt.new
  end

  def create
    @decrypt = Decrypt.create(text: params[:decrypt][:text], key: params[:decrypt][:key])
    
    @decrypt.message = @decrypt.decrypt
    @decrypt.update(message: @decrypt.message)

    redirect_to decrypt_path(@decrypt)
  end

  def show
    @decrypt = Decrypt.find(params[:id])
  end

  def decrypt_params
    params.require(:decrypt).permit(:text, :key, :message)
  end

end

