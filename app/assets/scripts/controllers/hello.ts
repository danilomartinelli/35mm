import { Controller } from "@hotwired/stimulus"

export class Hello extends Controller {
  static targets = ["name"];

  nameTarget: HTMLSpanElement;

  connect() {
  }

  handleSayHello() {
    this.nameTarget.textContent = "Jown";
  }
}
