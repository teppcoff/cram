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
    contentHeight: 'auto',
    eventDisplay: 'block',
    editable: true,
    titleFormat: {
        month: 'long',
        year: 'numeric'
    },
    display: 'background',
    headerToolbar: {
        center: 'addEventButton'
    },
    customButtons: {
        addEventButton: {
            text: '授業予定を追加',
            click: function(event, jsEvent, view){
                window.location.href = '../staff/events/new';
            }
        }
    },

    //イベントをクリックで詳細確認・編集
    eventClick: function(info) {
        alert('授業: ' + info.event.title);
        if (confirm('詳細を確認(削除もこちらから)')) {
            window.location.href = '../staff/events/' +info.event.id+ '/';
        }
    }
  });

  calendar.render();
});