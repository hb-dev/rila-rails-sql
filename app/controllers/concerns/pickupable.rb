module Pickupable
  extend ActiveSupport::Concern

  def update_payed
    @registration  = controller_name.classify.constantize.find(params[:id])
    @registration.update_attribute(:payed, !@registration.payed)
    render nothing: true
  end

  def update_picked_up
    @registration  = controller_name.classify.constantize.find(params[:id])
    @registration.update_attribute(:picked_up, !@registration.picked_up)
    render nothing: true
  end

end