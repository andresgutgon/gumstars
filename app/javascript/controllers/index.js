import { Application } from "@hotwired/stimulus"

// Controllers
import ModalController from './modal_controller'
import CloseModalOnFormSuccessController from './close_modal_on_form_success_controller'

window.Stimulus = Application.start()
Stimulus.register("modal", ModalController)
Stimulus.register("close-modal-on-form-success", CloseModalOnFormSuccessController)
