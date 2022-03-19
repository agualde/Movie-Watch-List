import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = [ "infos", "form", "card", "remove", "image1", "image2" ]

  connect() {
    // console.log('hello')
    // console.log(this.infosTarget);
    // console.log(this.formTarget);
    // console.log(this.cardTarget);
  }

  displayForm(event) {
    event.preventDefault()
    this.infosTarget.classList.add('d-none');
    this.removeTarget.classList.remove('d-none');
    this.image1Target.classList.add('d-none');
    this.image2Target.classList.remove('d-none');
  }

  cancelForm(event) {
    event.preventDefault()
    this.infosTarget.classList.remove('d-none');
    this.removeTarget.classList.add('d-none');
    this.image1Target.classList.remove('d-none');
    this.image2Target.classList.add('d-none');
  }

  add(event) {
    event.preventDefault()
    event.stopImmediatePropagation()
    // console.log('tities')
    const url = document.getElementById("form_id").action;
    // console.log(url)

    // fetch POST request to link url
    fetch(url, {
    method: "POST",
    headers: {
      "Accept": "text/plain",
      "X-CSRF-Token": csrfToken()
    },
    body: new FormData(this.formTarget)
  })
  alert('Movie added to list!')
}

}
