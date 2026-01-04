import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
// fetch meta environment conent
window.env ||= document.head.querySelector('meta[name="environment"]')?.content
application.debug = window.env === 'development';
window.Stimulus   = application

export { application }
