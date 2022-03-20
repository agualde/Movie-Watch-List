import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = [ "infos", "image1", "image2" ]
connect() {
console.log('hello')
}

  display(event) {
    event.preventDefault()
    this.infosTarget.classList.remove('d-none');
    this.image1Target.classList.add('d-none')
    this.image2Target.classList.remove('d-none')
}

hide(event) {
    event.preventDefault()
    this.infosTarget.classList.add('d-none');
    this.image1Target.classList.remove('d-none')
    this.image2Target.classList.add('d-none')
  }
}