class RendererController < ApplicationController
  def allpets
    render 'allpets'
  end
  def getPetById
    @petid=params[:id]
    render 'getPetById'
  end
  def getActivities
    @petid=params[:petid]
    render 'getActivities'
  end
  def getPetsByUserId
    @userid=params[:userid]
    render 'getPetsByUserId'
  end
end
