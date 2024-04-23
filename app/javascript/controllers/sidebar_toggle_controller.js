import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar-toggle"
export default class extends Controller {
  connect() {
    super.connect();

    // Uncomment Below to persist sidebar toggle between refreshes
    // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
    //     document.body.classList.toggle('sb-sidenav-toggled');
    // }
  }

  disconnect() {
    super.disconnect();
  }

  toggle() {
    document.body.classList.toggle('sb-sidenav-toggled');
    localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
  }
}
