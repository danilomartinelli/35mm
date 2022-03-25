import { Controller } from "@hotwired/stimulus"

export class Hello extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}
