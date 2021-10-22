import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';

document.addEventListener('turbolinks:load', function() {
  let calendarEl = document.getElementById('calendar');

  let calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, interactionPlugin ],
    initialView: 'dayGridMonth',
    selectable: true,
    events: '/student/events.json',

    eventClick: function(info) {
        alert('授業: ' + info.event.title);
        if (confirm('詳細を確認する?')) {
            window.location.href = '../student/events/show/' +info.event.id+ '/';
        }
    }
  });
  
  calendar.render();
});