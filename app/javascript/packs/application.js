import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require('jquery')
require('@nathanvda/cocoon')
require("../calendar/staff_member_event.js")
require("../calendar/student_member_event.js")
require("../calendar/parent_member_event.js")

Rails.start()
Turbolinks.start()
ActiveStorage.start()
