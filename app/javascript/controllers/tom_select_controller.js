import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

// Connects to data-controller="tom-select"
export default class extends Controller {
  connect() {
    const options = {
      plugins: ['clear_button']
    }
    this.tomSelect = new TomSelect(this.element, options)
  }
}