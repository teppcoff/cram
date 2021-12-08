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

    //予約型(reservation_type)のeventで予約されていない(予約可能な)ものは'lightpink'
    //それ以外のevent(通常授業または自分が既に予約したevent)は'deepskyblue'
    eventDidMount: function(info) {
      if (info.event.extendedProps.student_member_id == null) {
          info.el.style.background='lightpink'
      } else {
          info.el.style.background='deepskyblue';
      }
    },

    //予約型のeventに予約するためのリンクを表示
    //eventをクリックで詳細確認
    eventClick: function(info) {
      if (info.event.extendedProps.student_member_id == null) {
        alert('授業: ' + info.event.title);
        if (confirm('これは予約可能な講習です。予約しますか?')) {
            window.location.href = '../student/events/' +info.event.id+ '/edit';
            return;
        }
      }
      alert('授業: ' + info.event.title);
      if (confirm('詳細を確認しますか?')) {
          window.location.href = '../student/events/' +info.event.id+ '/';
      }
    }
  });
  
  calendar.render();
});