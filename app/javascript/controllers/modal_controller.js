import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect () {
    // Close a modal when a form is successful. This is working
    // with reviews modal but is generic and can work with any form inside a modal
    document.addEventListener("form:success", () => { this.close() });
  }

  close () {
    this.element.remove()
    this.modalTurboFrame.src = null
  }

  escClose (event) {
    if (event.key === 'Escape') this.close()
  }

  get modalTurboFrame () {
    return document.querySelector("turbo-frame[id='modal']")
  }
}
