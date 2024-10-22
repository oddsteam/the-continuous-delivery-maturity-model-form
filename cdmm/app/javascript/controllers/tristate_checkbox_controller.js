import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tristate-checkbox"
export default class extends Controller {
  static targets = [ "unchecked", "checked", "inapplicable", "value" ];
  static values = { state: String, identifier: String };

  connect() {
    this.state = this.stateValue || "unchecked";
    this.updateView();
  }

  toggle() {
    if (this.state === "unchecked") {
      this.state = "checked";
    } else {
      if (this.state === "checked") {
        this.state = "inapplicable";
      } else {
        this.state = "unchecked";
      }
    }
    this.updateView();
    this.dispatch('toggled', { prefix: this.identifierValue });
  }

  updateView() {
    this.valueTarget.value = this.state;
    switch (this.state) {
      case "unchecked":
        this.uncheckedTarget.classList.remove("hidden");
        this.checkedTarget.classList.add("hidden");
        this.inapplicableTarget.classList.add("hidden");
        break;
      case "checked":
        this.uncheckedTarget.classList.add("hidden");
        this.checkedTarget.classList.remove("hidden");
        this.inapplicableTarget.classList.add("hidden");
        break;
      case "inapplicable":
        this.uncheckedTarget.classList.add("hidden");
        this.checkedTarget.classList.add("hidden");
        this.inapplicableTarget.classList.remove("hidden");
        break;  
    }
  }
}
