import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';

document.addEventListener('DOMContentLoaded', function() {
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

    //予約型(reservation_type)のeventで予約されていないものは'lightpink'
    //予約型(reservation_type)のeventですでに生徒が予約したものは'limegreen'
    //それ以外のevent(通常授業)は'deepskyblue'
    eventDidMount: function(info) {
        if (info.event.extendedProps.student_member_id == null) {
            info.el.style.background='lightpink'
        } else if (info.event.extendedProps.event_type == "reservation_type") {
            info.el.style.background='limegreen';
        } else {
            info.el.style.background='deepskyblue';
        }
    },

    //eventをクリックで詳細確認・編集
    eventClick: function(info) {
        alert('授業: ' + info.event.title);
        if (confirm('詳細を確認(削除もこちらから)')) {
            window.location.href = '../staff/events/' +info.event.id+ '/';
        }
    }
  });

  calendar.render();
});