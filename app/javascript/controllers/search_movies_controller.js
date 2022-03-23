import { Controller } from "stimulus"
import { useDebounce } from 'stimulus-use'

export default class extends Controller {
  static targets = ["form", "input", "list"]
  static debounces = ["update"]

  connect() {
    useDebounce(this)
  }

  update(event) {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    if (this.inputTarget.value != "" ) {
      fetch(url, { headers: { "Accept": "text/plain" } })
          .then(response => response.text())
          .then((data) => {
          this.listTarget.innerHTML = data
          })
  }
  }
}



