import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  switch(event) {
    event.preventDefault(); // Evita que el link '#' recargue la página

    const tabName = event.currentTarget.dataset.tabName;

    // Ocultar todos los contenidos y quitar la clase activa de todas las pestañas
    this.element.querySelectorAll('.tab-content').forEach(content => {
      content.style.display = 'none';
    });
    this.element.querySelectorAll('.tab-link').forEach(link => {
      link.classList.remove('active');
    });

    // Mostrar el contenido de la pestaña seleccionada y marcarla como activa
    const contentToShow = this.element.querySelector(`#${tabName}-content`);
    if (contentToShow) {
      contentToShow.style.display = 'block';
    }
    event.currentTarget.classList.add('active');
  }
}
