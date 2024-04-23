import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// import { Latvian } from "flatpickr/dist/l10n/lv";

// Connects to data-controller="flatpickr"
export default class extends Controller {

  static values = {
    enableTime: {type: Boolean, default: true}
  }

  connect() {
    this.flatpickr = flatpickr(this.element, {
      // locale: Latvian,
      locale: {
        firstDayOfWeek: 1
      },
      enableTime: this.enableTimeValue,
      time_24hr: true
    })
  }
}