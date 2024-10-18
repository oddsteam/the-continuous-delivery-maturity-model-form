import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="event-sensor"
export default class extends Controller {
  static values = { identifier: String };

  connect() {
  }

  invoke(event) {
    this.dispatch('triggered', { prefix: this.identifierValue });
  }
}
