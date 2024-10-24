import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checklist-ui"
export default class extends Controller {
  static values = { itemCount: Number, completeClasses: String }

  connect() {
  }

  refresh(event) {
    const uncheckedChecklists = this.element.querySelectorAll("input[type='hidden'][value='unchecked']");
    if (uncheckedChecklists.length === 0) {
      this.element.classList.add(this.completeClassesValue);
    } else {
      this.element.classList.remove(this.completeClassesValue);
    }
  }

}
