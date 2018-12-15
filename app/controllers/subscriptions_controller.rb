class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      redirect_to root_path, flash: {success: "Inscription enregistrée avec succès."}
    end
  end

  private
  def subscription_params
    params.require(:subscription).permit(:name, :address, :age, :tel, :email)
  end
end 