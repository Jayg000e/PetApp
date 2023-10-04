
class ControllerNameController < ApplicationController
  def example_action
    respond_to do |format|
      format.js
    end
  end
end
