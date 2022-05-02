class EnvelopeFormulasController < ApplicationController
  include ActionView::RecordIdentifier

  def index
    @envelope_formulas = collection
  end

  def new
    @envelope_formula = EnvelopeFormula.new
  end

  def edit
    @envelope_formula = resource
  end

  def create
    @envelope_formula = current_user.envelope_formulas.new(envelope_formula_params)

    if @envelope_formula.save
      render turbo_stream: [
        turbo_stream.after('new-envelope_formula-form', @envelope_formula),
        turbo_stream.replace('form_envelope_formula', '')
      ]
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @envelope_formula = resource

    if @envelope_formula.update(envelope_formula_params)
      render @envelope_formula
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @envelope_formula = resource

    @envelope_formula.destroy

    render turbo_stream: [
      turbo_stream.remove(@envelope_formula)
    ]
  end

  private

    def collection
      EnvelopeFormula.ordered
    end

    def resource
      collection.find(params[:id])
    end

    def envelope_formula_params
      params.require(:envelope_formula).permit(:name, :daily_expences, :savings,
                                              :funds_for_expensive_purchase, :funds_for_others,
                                              :funds_for_self_development, :investment_funds)
    end
end
