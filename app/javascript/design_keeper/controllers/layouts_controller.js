import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.element.textContent = "This is the Card Component Controller";
    console.log("Layouts controller connected", this.element);
  }
}
