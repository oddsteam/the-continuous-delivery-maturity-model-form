import { Controller } from "@hotwired/stimulus"
import { useDebounce } from 'stimulus-use'

// Connects to data-controller="auto-submit"
export default class extends Controller {
  static targets = [ 'savingIcon', 'savedIcon' ];
  static debounces = [ 'submit' ];

  connect() {
    useDebounce(this, { wait: 2500 });
    this.savedIconTarget.classList.add('hidden');
    this.savingIconTarget.classList.add('hidden');
  }

  dirty(event) {
    event.preventDefault()
    this.savingIconTarget.classList.add('hidden');
    this.savedIconTarget.classList.add('hidden');
  }

  submit(event) {
    event.preventDefault()
    this.savingIconTarget.classList.remove('hidden');
    this.savedIconTarget.classList.add('hidden');
    this.element.requestSubmit();
    this.savingIconTarget.classList.add('hidden');
    this.savedIconTarget.classList.remove('hidden');
  }
}
