import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu"]

  toggleMenu(e) {
    this.menuTarget.classList.toggle('!block');
    this.menuTarget.classList.toggle('!opacity-100');
  }
}
