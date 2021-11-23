import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import '@fullcalendar/common/main.css'
import '@fullcalendar/daygrid/main.css'
require('jquery')
require('@nathanvda/cocoon')

Rails.start()
Turbolinks.start()
ActiveStorage.start()
