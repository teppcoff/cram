import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';

document.addEventListener('DOMContentLoaded', function() {
  let calendarEl = document.getElementById('calendar');

  let calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, interactionPlugin ],
    initialView: 'dayGridMonth',
    events: '/student/events.json',
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

    //予約型のeventは色を変える
    eventDidMount: function(info) {
      if (info.event.title.includes("講習")) {
          info.el.style.background='limegreen';
      } else {
          info.el.style.background='deepskyblue';
      }
  },

    //予約型のeventに予約するためのリンクを表示
    //イベントをクリックで詳細確認
    eventClick: function(info) {
      if (info.event.title.includes("講習")) {
        alert('授業: ' + info.event.title);
        if (confirm('予約する?')) {
            window.location.href = '../student/events/' +info.event.id+ '/edit';
        }
      }
      alert('授業: ' + info.event.title);
      if (confirm('詳細を確認する?')) {
          window.location.href = '../student/events/' +info.event.id+ '/';
      }
    }
  });
  
  calendar.render();
});