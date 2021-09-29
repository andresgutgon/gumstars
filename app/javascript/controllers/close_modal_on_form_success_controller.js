import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  closeModal (submitEvent) {
    if (!submitEvent.detail.success) return // Form with errors

    // On success close the modal
    const event = new CustomEvent("form:success", { bubbles: true, cancelable: true });
    document.dispatchEvent(event);
  }
}
