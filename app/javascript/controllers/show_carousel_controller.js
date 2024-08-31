import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-carousel"
export default class extends Controller {
  static targets = ["inner", "highlightedImage"]


    connect() {
      console.log("oi connected")
      this.updateHighlightedImage()
      this.element.addEventListener('slid.bs.carousel', () => this.updateHighlightedImage())
    }

    updateHighlightedImage() {
          const activeItem = this.innerTarget.querySelector('.carousel-item.active img')
      if (activeItem) {
        this.highlightedImageTarget.src = activeItem.src
      }
    }
}
