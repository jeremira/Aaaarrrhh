class PiratesController < ApplicationController

  def index
    @pirate = Pirate.new
    @fight = Fight.new
    @pirates = Pirate.order(:id)
  end

  def edit
    @pirate = Pirate.find_by(id: params[:id])
    redirect_to pirates_path, alert: "Bloody Davy Jones' locker. 'tis wrong !" unless @pirate
  end

  def update
    @pirate = Pirate.find_by(id: params[:id])
    if @pirate
      if @pirate.update_attributes(pirate_params)
        redirect_to pirates_path, notice: "Pirate's changes has been saved t' rthe registe"
      else
        redirect_to pirates_path, alert: "Bloody Davy Jones' locker. 'tis wrong !"
      end
    else
      redirect_to pirates_path, alert: "Bloody Davy Jones' locker. 'tis wrong !"
    end
  end

  def create
    @pirate = Pirate.new(pirate_params)
    if @pirate.save
      redirect_to pirates_path, notice: "A new pirate has been add t' th' crew !"
    else
      redirect_to pirates_path, alert: "Bloody Davy Jones' locker. 'tis wrong !"
    end
  end

  def destroy
    @pirate = Pirate.find_by(id: params[:id])
    redirect_to pirates_path, alert: "Bloody Davy Jones' locker. 'tis wrong !" unless @pirate
    @pirate.destroy
    redirect_to pirates_path, notice: "Ahahahaha ! Ye did it ! We scuttle this useless brat !"
  end

  private

  def pirate_params
    params.require(:pirate).permit(:name, :hp, :dmg)
  end

end
