import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['sidebar', 'backdrop']

  toggleMenu(e) {
    toggleDisplay(this.sidebarTarget)
    toggleDisplay(this.backdropTarget)
  }

  hide(e) {
    this.sidebarTarget.style.display = 'none';
    this.backdropTarget.style.display = 'none';
  }
}

function toggleDisplay(el) {
  el.style.display = (el.style.display == 'none') ? 'block' : 'none'
}
