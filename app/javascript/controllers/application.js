import { Application } from "@hotwired/stimulus"
// import "@rails/actioncable"
// import MapController from "./controllers/map_controller"

const application = Application.start()
// application.register("map", MapController)
// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
