# Galería Rails - Un tablón de imágenes multiusuario

![Ruby on Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)

Este proyecto es una aplicación web completa inspirada en Pinterest, desarrollada con Ruby on Rails. Fue creada como un proyecto de aprendizaje personal con el objetivo de dominar los fundamentos y conceptos avanzados del desarrollo web moderno con el ecosistema de Rails.

---

## Sobre el Proyecto y Objetivos de Aprendizaje

La intención principal de este proyecto fue construir una aplicación funcional y robusta desde cero para aplicar y profundizar mis conocimientos en:

* La arquitectura **MVC (Modelo-Vista-Controlador)**.
* El desarrollo guiado por **RESTful design**.
* El manejo de **asociaciones complejas** en Active Record.
* La implementación de **funcionalidades interactivas** con herramientas modernas como Hotwire (Turbo y Stimulus).
* Las **prácticas de desarrollo profesionales** como la refactorización de código (principio DRY) y la atención al detalle en la experiencia de usuario (UX).

---

## Características Principales

La aplicación cuenta con las siguientes funcionalidades:

* **Autenticación de Usuarios:** Sistema completo de registro, inicio y cierre de sesión utilizando la gema Devise.
* **Gestión de "Pins" (CRUD):** Los usuarios pueden crear, ver, editar y eliminar sus propias publicaciones (imágenes con descripción).
* **Perfiles de Usuario:** Cada usuario tiene una página de perfil pública donde se muestran todos los pins que ha subido.
* **Sistema de "Me Gusta":** Funcionalidad para dar "Me Gusta" a los pins. La acción es instantánea y no requiere recargar la página gracias a **Turbo Streams**.
* **Sistema de Comentarios:** Los usuarios pueden dejar comentarios en los pins, los cuales también aparecen en tiempo real sin recargar la página.
* **Sección Privada de "Me Gusta":** En su propio perfil, cada usuario puede ver una pestaña privada con todos los pins a los que le ha dado "Me Gusta".
* **Autorización:** La lógica de la aplicación asegura que un usuario solo pueda editar o eliminar su propio contenido.
* **Diseño Responsivo:** Una interfaz limpia y consistente que se adapta a diferentes tamaños de pantalla usando CSS Grid y Flexbox.
* **Internacionalización (i18n):** La aplicación está completamente traducida al español, incluyendo los mensajes de error y validaciones.

---

## Tecnologías y Conceptos Aplicados

* **Backend:**
    * **Ruby on Rails 8:** Como framework principal.
    * **SQLite:** Como base de datos
    * **Devise:** Para la gestión de la autenticación.
    * **Active Record:** Para el modelado de datos y las asociaciones (`has_many`, `belongs_to`, `has_many :through`).

* **Frontend:**
    * **Hotwire:** La suite de herramientas por defecto de Rails 7.
        * **Turbo Streams:** Para actualizaciones en tiempo real de likes y comentarios.
        * **Stimulus.js:** Para pequeñas interacciones de JavaScript, como el toggle de visibilidad de la contraseña y la funcionalidad de las pestañas en el perfil.
    * **HTML5** y **ERB**.
    * **CSS3:** Maquetación moderna con Flexbox y CSS Grid para lograr un diseño consistente y responsivo.

* **Conceptos Clave:**
    * Arquitectura MVC y principios REST.
    * Sistema de Rutas de Rails (incluyendo rutas anidadas y `resource` singular).
    * Principio DRY (Don't Repeat Yourself) a través del uso de parciales (`partials`).
    * Manejo de la Internacionalización (i18n) con archivos YAML.
    * Lógica de autorización simple en controladores y vistas.

---

## Cómo Empezar

Para ejecutar este proyecto de forma local, sigue estos pasos:

1.  **Clona el repositorio:**
    ```bash
    git clone https://github.com/alexisefn/rails-galeria.git
    cd rails-galeria
    ```
2.  **Instala las dependencias:**
    ```bash
    bundle install
    ```
3.  **Configura la base de datos:**
    ```bash
    rails db:setup
    ```
4.  **Inicia el servidor:**
    ```bash
    rails server
    ```
5.  Abre tu navegador y ve a `http://localhost:3000`.

---

## Próximos Pasos

* Continuar reforzando mis conocimientos en Rails actualizando o creando nuevos proyectos.
* Aprender e implementar PostgreSQL en este o en un nuevo proyecto a futuro.
