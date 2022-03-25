import { Application } from "@hotwired/stimulus"

import {Hello} from "./hello"

const application = Application.start()

application.register("hello", Hello)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
