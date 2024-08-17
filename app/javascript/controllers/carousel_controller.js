import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["slide"];
  static values = { interval: Number };

  initialize() {
    this.currentIndex = 0;
    this.showSlide(this.currentIndex);
    this.startAutoSlide();
  }

  next() {
    this.currentIndex = (this.currentIndex + 1) % this.slideTargets.length;
    this.showSlide(this.currentIndex);
  }

  prev() {
    this.currentIndex = (this.currentIndex - 1 + this.slideTargets.length) % this.slideTargets.length;
    this.showSlide(this.currentIndex);
  }

  showSlide(index) {
    this.slideTargets.forEach((slide, i) => {
      slide.style.display = i === index ? "block" : "none";
    });
  }
  
  startAutoSlide() {
    this.stopAutoSlide();
    this.intervalId = setInterval(() => this.next(), this.intervalValue || 3000); // Troca a cada 3 segundos por padrão
  }

  stopAutoSlide() {
    if (this.intervalId) {
      clearInterval(this.intervalId);
    }
  }

  disconnect() {
    this.stopAutoSlide();
  }
}
