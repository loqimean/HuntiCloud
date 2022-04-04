import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['switcher'];

  connect(e) {
    this.switcherTarget.checked = ![...document.documentElement.classList].includes('dark');
  }

  toggleTheme(e) {
    document.documentElement.classList.toggle('dark')
  }
}
