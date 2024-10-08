import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-carousel"
export default class extends Controller {
  static targets = ["mainImage", "carouselImage"]
  static targets = ["mainImage", "carouselImage"]

  connect() {
    this.currentIndex = 0
    this.totalImages = this.carouselImageTargets.length
    this.updateMainImage()
  }

  updateMainImage() {
    const activeImageDiv = this.carouselImageTargets[this.currentIndex]
    const activeImage = activeImageDiv.querySelector('img')

    // Atualizar a imagem principal com a fonte e o alt da imagem ativa
    this.mainImageTarget.src = activeImage.src
    this.mainImageTarget.alt = activeImage.alt

    // Atualizar a classe de destaque no carrossel
    this.carouselImageTargets.forEach((imageDiv, index) => {
      imageDiv.classList.toggle('active', index === this.currentIndex)
    })
  }

  nextImage() {
    this.currentIndex = (this.currentIndex + 1) % this.totalImages
    this.updateMainImage()
  }

  prevImage() {
    this.currentIndex = (this.currentIndex - 1 + this.totalImages) % this.totalImages
    this.updateMainImage()
  }

  selectImage(event) {
    console.log("teste")
    // Encontrar a imagem clicada no carrossel
    const clickedImage = event.currentTarget.querySelector('img')
    console.log(clickedImage)

    // Atualizar a imagem principal com a fonte e o alt da imagem clicada
    this.mainImageTarget.src = clickedImage.src
    this.mainImageTarget.alt = clickedImage.alt

    // Remover e adicionar a classe 'active' para a imagem clicada
    this.carouselImageTargets.forEach((imageDiv) => {
      imageDiv.classList.remove('active')
    })
    event.currentTarget.classList.add('active')
  }
}
