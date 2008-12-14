class SetupsController < ApplicationController
  
  def create
    @scenario = Scenario.find(params[:scenario_id])
    setup = Setup.create(params[:setup])
    @scenario.setup = setup
    @scenario.save
  end

  def edit
    @scenario = Scenario.find(params[:scenario_id])
  end
  
  def update
    @scenario = Scenario.find(params[:scenario_id])
    @scenario.setup.content = params[:setup][:content]
    @scenario.setup.save
  end

  def show
    @scenario = Scenario.find(params[:scenario_id])
  end

  def destroy
    @scenario = Scenario.find(params[:scenario_id])
    @scenario.setup.destroy
  end

end
