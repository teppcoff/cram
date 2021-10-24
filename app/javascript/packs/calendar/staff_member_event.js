import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';

document.addEventListener('turbolinks:load', function() {
  let calendarEl = document.getElementById('calendar');

  let calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, interactionPlugin ],
    initialView: 'dayGridMonth',
    events: '/staff/events.json',

    headerToolbar: {
        center: 'addEventButton'
    },
    customButtons: {
        addEventButton: {
            text: 'add event',
            click: function(event, jsEvent, view){
                window.location.href = '../staff/events/new';
            }
        }
    },
    eventClick: function(info) {
        alert('授業: ' + info.event.title);
        if (confirm('詳細を確認する?(削除もこちらから)')) {
            window.location.href = '../staff/events/show/' +info.event.id+ '/';
        }
    }
  });

  calendar.render();
});