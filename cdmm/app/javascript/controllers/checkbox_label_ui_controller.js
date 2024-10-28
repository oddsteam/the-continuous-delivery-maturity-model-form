import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox-label-ui"
export default class extends Controller {
  static targets = [ 'label' ];

  connect() {
  }

  refresh(event) {
    const checkedClasses = this.labelTarget.getAttribute("data-checkbox-label-ui-checked-classes-value").split(" ");
    const uncheckedClasses = this.labelTarget.getAttribute("data-checkbox-label-ui-unchecked-classes-value").split(" ");
    const inapplicableClasses = this.labelTarget.getAttribute("data-checkbox-label-ui-inapplicable-classes-value").split(" ");
    this.labelTarget.classList.remove(...checkedClasses);
    this.labelTarget.classList.remove(...uncheckedClasses);
    this.labelTarget.classList.remove(...inapplicableClasses);
    switch (event.detail.state) {
      case 'checked':
        this.labelTarget.classList.add(...checkedClasses);
        break;
      case 'unchecked':
        this.labelTarget.classList.add(...uncheckedClasses);
        break;
      case 'inapplicable':
        this.labelTarget.classList.add(...inapplicableClasses);
        break;
    }
  }
}
