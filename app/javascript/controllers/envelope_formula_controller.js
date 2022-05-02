import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['dailyExpences', 'fundsForExpensivePurchase', 'fundsForOthers',
                    'fundsForSelfDevelopment', 'investmentFunds', 'savings', 'formula', 'amount']

  calculate(e) {
    this.currentOption = this.formulaTarget.options[this.formulaTarget.selectedIndex];
    this.dailyExpencesTarget.value = parseFloat(this.amountTarget.value * this.currentOption.dataset.dailyExpences).toFixed(2)
    this.savingsTarget.value = parseFloat(this.amountTarget.value * this.currentOption.dataset.savings).toFixed(2)
    this.fundsForOthersTarget.value = parseFloat(this.amountTarget.value * this.currentOption.dataset.fundsForOthers).toFixed(2)
    this.fundsForSelfDevelopmentTarget.value = parseFloat(this.amountTarget.value * this.currentOption.dataset.fundsForSelfDevelopment).toFixed(2)
    this.fundsForExpensivePurchaseTarget.value = parseFloat(this.amountTarget.value * this.currentOption.dataset.fundsForExpensivePurchase).toFixed(2)
    this.investmentFundsTarget.value = parseFloat(this.amountTarget.value * this.currentOption.dataset.investmentFunds).toFixed(2)

    if (this.amountTarget.value == '') {
      this.dailyExpencesTarget.value = ''
    }
  }
}
