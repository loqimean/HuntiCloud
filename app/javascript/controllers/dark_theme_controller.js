import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['sun', 'moon'];

  connect(e) {
    // this.switcherTarget.checked = ![...document.documentElement.classList].includes('dark');
  }

  toggleTheme(e) {
    document.documentElement.classList.toggle('dark')
    this.sunTarget.classList.toggle('hidden')
    this.moonTarget.classList.toggle('hidden')
  }
}
