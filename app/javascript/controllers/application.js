import "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-loading"

const application = Application.start()
application.debug = false
window.Stimulus = application

const context = require.context("controllers", true, /\.js$/)
application.load(definitionsFromContext(context))
