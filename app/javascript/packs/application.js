require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap"
import "../stylesheets/application"

require("./create")
require("./delete")
require("./update")

console.log("Hello world!")
