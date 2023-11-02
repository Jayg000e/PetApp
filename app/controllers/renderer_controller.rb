class RendererController < ApplicationController
  def allpets
    render 'allpets'
  end
  def getPetById
    @petid=params[:id]
    @apiKey=Rails.application.credentials[:api_key]
    render 'getPetById'
  end
  def getActivities
    @petid=params[:petid]
    @apiKey=Rails.application.credentials[:api_key]
    puts @petid,"petid"
    render 'getActivities'
  end
  def getPetsByUserId
    @userid=params[:userid]
    render 'getPetsByUserId'
  end

  def createPet
    render 'createPet'
  end

  def createActivity
    @petid=params[:petid]
    render 'createActivity'
  end

  def market
    @apiKey=Rails.application.credentials[:api_key]
    render 'market'
  end

end
