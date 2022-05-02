import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect(e) {
    console.log('hello')
  }

  clear(e) {
    console.log('hello')
    this.element.innerHTML = '';
  }
}
