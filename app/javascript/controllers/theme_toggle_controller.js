import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sunIcon", "moonIcon"]

  connect() {
    this.updateIcons();
  }

  toggle() {
    // Alternar la clase en el BODY
    if (document.body.classList.contains('dark-mode')) {
      document.body.classList.remove('dark-mode');
      document.body.classList.add('light-mode');
      localStorage.setItem('theme', 'light');
    } else {
      document.body.classList.remove('light-mode');
      document.body.classList.add('dark-mode');
      localStorage.setItem('theme', 'dark');
    }
    this.updateIcons();
  }

  updateIcons() {
    // Comprobar la clase en el BODY
    const isDarkMode = document.body.classList.contains('dark-mode');
    this.sunIconTarget.style.display = isDarkMode ? 'none' : 'block';
    this.moonIconTarget.style.display = isDarkMode ? 'block' : 'none';
  }
}
