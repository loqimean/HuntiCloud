import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  toggleTheme(e) {
    document.documentElement.classList.toggle('dark')
  }
}
