class FightsController < ApplicationController

  def show
    @fight = Fight.find_by(id: params[:id])
  end

  def index
    @fights = Fight.order(:id)
  end

  def create
    @fight = Fight.new(fight_params)
    @fight.machine_learning_disruptive_blockchained_ia_fight_processor
    if @fight.save
      redirect_to @fight
    else
      redirect_to root_path, alert: "Bloody Davy Jones' locker. 'tis wrong !"
    end
  end

  private

  def fight_params
    params.require(:fight).permit(:pirate_a_id, :pirate_b_id)
  end

end
