import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';

document.addEventListener('turbolinks:load', function() {
  let calendarEl = document.getElementById('calendar');

  let calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, interactionPlugin ],
    initialView: 'dayGridMonth',
    events: '/staff/events.json',
    locale: 'ja',
    timeZone: 'Asia/Tokyo',
    firstDay: 1,
    titleFormat: { // will produce something like "Tuesday, September 18, 2018"
        month: 'long',
        year: 'numeric'
    },
    display: 'background',
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
        if (confirm('詳細を確認(出欠登録・削除もこちらから)')) {
            window.location.href = '../staff/events/show/' +info.event.id+ '/';
        }
    }
  });

  calendar.render();
});