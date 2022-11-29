import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "emojiPicker", "field" ]

  connect() {
    this.emojiPickerTarget.addEventListener("emoji-pick", (event) => {
      this.fieldTarget.value += event.detail.emoji;

      this.fieldTarget.focus();
    });
  }

  toggleEmoji() {
    this.emojiPickerTarget.classList.toggle("d-none");
  }
}
