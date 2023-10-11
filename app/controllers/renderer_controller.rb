class RendererController < ApplicationController
  def allpets
    render 'allpets'
  end
  def getPetById
    @petid=params[:id]
    render 'getPetById'
  end
end
