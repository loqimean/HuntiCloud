class ProfitsController < ApplicationController
  before_action :set_profit, only: %i[ show edit update destroy ]

  def index
    @profits = Profit.all
  end

  def new
    @profit = Profit.new
  end

  def edit
  end

  def create
    @profit = current_user.profits.new(profit_params)

    if @profit.save
      redirect_to profits_path, notice: "Profit was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @profit.update(profit_params)
      redirect_to @profit, notice: "Profit was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @profit.destroy
    flash.now[:notice] = 'Profit was successfully destroyed.'

    render turbo_stream: [
      turbo_stream.remove(@profit)
    ]
  end

  private
    def set_profit
      @profit = Profit.find(params[:id])
    end

    def profit_params
      params.require(:profit).permit(:amount, :daily_expences, :investment_funds,
                                    :funds_for_expensive_purchase, :funds_for_others,
                                    :funds_for_self_development, :savings, :user_id, :envelope_formula_id)
    end
end
