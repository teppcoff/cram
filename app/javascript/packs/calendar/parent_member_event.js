import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';

document.addEventListener('turbolinks:load', function() {
  let calendarEl = document.getElementById('calendar');

  let calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, interactionPlugin ],
    initialView: 'dayGridMonth',
    events: '/parent/events.json',
    locale: 'ja',
    timeZone: 'Asia/Tokyo',
    firstDay: 1,
    contentHeight: 'auto',
    eventDisplay: 'block',
    editable: true,
    titleFormat: {
        month: 'long',
        year: 'numeric'
    },

    eventClick: function(info) {
        alert('授業: ' + info.event.title);
        if (confirm('詳細を確認する?')) {
            window.location.href = '../parent/events/show/' +info.event.id+ '/';
        }
    }
  });
  
  calendar.render();
});