import { Controller } from "@hotwired/stimulus"

// Se conecta a data-controller="password-visibility"
export default class extends Controller {
  // Define los "targets" que este controlador puede manipular
  static targets = ["input", "icon"]

  toggle() {
    // Cambia el tipo del input
    if (this.inputTarget.type === "password") {
      this.inputTarget.type = "text"
      this.iconTarget.innerHTML = "👁️‍🗨️" // Ojo tachado
    } else {
      this.inputTarget.type = "password"
      this.iconTarget.innerHTML = "👁️" // Ojo normal
    }
  }
}