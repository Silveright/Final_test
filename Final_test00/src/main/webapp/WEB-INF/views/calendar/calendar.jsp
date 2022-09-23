<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link href='${pageContext.request.contextPath}/resources/fullcalendar/main.css' rel='stylesheet' />
    <script src='${pageContext.request.contextPath}/resources/fullcalendar/main.js'></script>
    <script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/locales/ko.js'></script>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
 <style>

  body {
    margin-top: 40px;
    font-size: 14px;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  }

  #external-events {
    position: fixed;
    left: 20px;
    top: 200px;
    width: 150px;
    padding: 0 10px;
    border: 1px solid #ccc;
    background: #eee;
    text-align: left;
  }

  #external-events h4 {
    font-size: 16px;
    margin-top: 0;
    padding-top: 1em;
  }

  #external-events .fc-event {
    margin: 3px 0;
    cursor: move;
  }

  #external-events p {
    margin: 1.5em 0;
    font-size: 11px;
    color: #666;
  }

  #external-events p input {
    margin: 0;
    vertical-align: middle;
  }

  #calendar-wrap {
    margin-top:100px;
    margin-bottom:100px;
    margin-left: 200px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }
 /*  .fc-h-event, .fc .fc-button-primary:disabled, .fc .fc-button-primary {
  	background-color:#776bcc;
  	border-color:#776bcc
  } */
  .fc-h-event{
  	background-color:#776bcc;
  	border-color:#776bcc
  }
  a {
    color: #4232c2;
    text-decoration: none  !important;
}
.fc .fc-button-primary:hover,.fc .fc-button-primary, .fc .fc-button-primary:disabled {
    color: #000 !important;
    color: var(--fc-button-text-color, #fff);
    background-color: #cac6e3ed;
    border-color: #282636;
}
.fc .fc-button-primary:not(:disabled):active, .fc .fc-button-primary:not(:disabled).fc-button-active {
    color: #fff;
    color: var(--fc-button-text-color, #fff);
    background-color: #776bcc;
    border-color: #282636;
}
</style>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
  <div id='wrap'>
	
    <div id='external-events'>
      <h4>Draggable Events</h4>

      <div id='external-events-list'>
        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
          <div class='fc-event-main'>정모</div>
        </div>
        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
          <div class='fc-event-main'>번개</div>
        </div>
        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
          <div class='fc-event-main'>비대면</div>
        </div>
      </div>

      <p>
        <input type='checkbox' id='drop-remove' />
        <label for='drop-remove'>remove after drop</label>
      </p>
    </div>

    <div id='calendar-wrap'>
      <div id='calendar'></div>
    </div>

  </div>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">일정 정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <input type="hidden" name="calendar_no" id="calendar_no" value=""/>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label" >제목</label>
            <input type="text" class="form-control" id="subject" name="subject">
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label" >모임유형</label>
            <input type="text" class="form-control" name="title" id="title">
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label" >날짜</label>
            <input type="text" class="form-control" id="date" name="startdate">
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label" >장소</label>
            <input type="text" class="form-control" id="location" name="location">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">내용</label>
            <textarea class="form-control" id="content" name="content"></textarea>
          </div>
          <div class="mb-3">
            <div class="fakeimg"></div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <!-- <button type="button" class="btn btn-secondary" id="close" data-bs-dismiss="modal">Close</button> -->
        <button type="button" class="btn btn-primary" id="save">Save</button>
      </div>
    </div>
  </div>
</div>
   <script>
   var group_no=1;//더미용
   console.log(group_no);
   var myModal = new bootstrap.Modal(document.getElementById('exampleModal'))

    var containerEl = document.getElementById('external-events-list');
    new FullCalendar.Draggable(containerEl, {
      itemSelector: '.fc-event',
      eventData: function(eventEl) {
        return {
          title: eventEl.innerText.trim()
        }
      }
    });

    //// the individual way to do it
    // var containerEl = document.getElementById('external-events-list');
    // var eventEls = Array.prototype.slice.call(
    //   containerEl.querySelectorAll('.fc-event')
    // );
    // eventEls.forEach(function(eventEl) {
    //   new FullCalendar.Draggable(eventEl, {
    //     eventData: {
    //       title: eventEl.innerText.trim(),
    //     }
    //   });
    // });

    /* initialize the calendar
    -----------------------------------------------------------------*/

    var calendarEl = document.getElementById('calendar');
    var calendar;
    calendar = new FullCalendar.Calendar(calendarEl, {
      dateClick: function(){
    	  alert('clicked!!');
      },
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
      },
      editable: true,
      droppable: true, // this allows things to be dropped onto the calendar
      events:
    	  /* [
          {
              "start":"2022-09-09",
              "title":"바지"
            }] */

 
    	 loadingEvents()//처음 일정 페이지
      ,
      eventClick: function (event) {//세부 일정 확인
    	  $('.btn-close').show();
          //$('#ModalLabel').text('일정을 확인하세요!'); //이벤트 클릭시에는 일정확인 메세지로 변경
          //클릭시에는 이미있는 이벤트를 삭제할수있는 삭제버튼이 생성됨
         /*  $('#buttonDiv').each(function () {
              if ($('button', this).length == 2) {
                  $('#buttonDiv').prepend('<button type="button" id="delete" class="btn btn-danger">삭제</button>');
                  cancelEvent();
              }
          }) */
          console.log(event)
          $('#content').val('');
          $('#subject').val('');
          /* $('#diarySubmit').hide(); */ //확인버튼숨김
          var calendar_no = event.event.extendedProps.calendar_no//클릭한 이벤트의 스케쥴넘버(DB)
          console.log("캘린더 번호:"+calendar_no)
          //ajax로 해당 스케줄의 정보 가져와서 출력
          $.ajax({
              url: "detail",
              type: 'POST',
              dataType: 'JSON',
              async: false,
              data: {
                  group_no: '1',
                  calendar_no: calendar_no
              },
              success: function (response) {
            	  $('.modal-footer>button').remove();
            	  output='';
            	  output += '<button type="button" class="btn btn-primary" id="delete">삭제</button>'
            	  output += '<button type="button" class="btn btn-primary" id="modify">수정</button>'
            	  output += "<input type='hidden' value='"+ response.calendar_no+"'>"
            	 $(".modal-footer").append(output);
            	  /* console.log(response);
                  console.log("날짜"+response.startdate); */
                  var data = new Date(response.startdate);
                  /* console.log("년도"+data.getFullYear());
                  console.log("월"+(data.getMonth()+1));
                  console.log("일"+data.getDate()); */
                  var date = data.getFullYear() +"-" + (data.getMonth()+1) + "-" + data.getDate()
                  
                  $('#title').val(response.title);
                  $('#date').val(date);
                  $('#content').val(response.content);
                  $('#subject').val(response.subject);
                  $('#location').val(response.location);
                 // $('#calendar_no').val(response.calendar_no);
              },
              error: function (Http, status, error) {
                  console.log(error);
              }
          });

          myModal.show();
      },
      drop: function(info,revertFunc) {
    	   myModal.show();//일정 등록 폼 띄우기
    	   $('.btn-close').hide();
    	   $('.modal-footer>button').remove();
     	  output='';
     	  output += '<button type="button" class="btn btn-primary" id="save">저장</button>'
     	  output += '<button type="button" class="btn btn-primary" id="close">닫기</button>'
     	 $(".modal-footer").append(output);
    	   $('#content').val('');
           $('#subject').val('');
           $('#location').val('');
    	  $('#title').val(info.draggedEl.innerText);//input tag-모임 유형 입력
          $('#date').val(info.dateStr); //input tag-모임 날짜 입력
        // is the "remove after drop" checkbox checked?
        if (document.getElementById('drop-remove').checked) {
          // if so, remove the element from the "Draggable Events" list
          arg.draggedEl.parentNode.removeChild(arg.draggedEl);
        }
         
        //drop하고 정보 기입 안하고 close를 누를 경우 이벤트 사라지도록?? 적용 안됨
       $('#close').click(function(){
        	alert("일정 적용이 취소됩니다.")
        	document.location.href = document.location.href;
    	   //$("[data-date='"+info.dateStr+"']").find('a:eq(1)').remove()
        });
          
          
      },
      eventDrop: function (info) { //이벤트를 옮겼을때 수정함
          var year = (info.event._instance.range.start.getFullYear()); //옮긴 달력의 날짜
          var month = info.event._instance.range.start.getMonth() + 1; //옮긴 달력의 날짜
          var day = info.event._instance.range.start.getDate(); //옮긴 달력의 날짜


          var modifyDate = year + '-' + month + '-' + day;
          console.log(modifyDate)
          var calendar_no = info.event._def.extendedProps.calendar_no;// 옮긴이벤트번호
          console.log(modifyDate)
          console.log(calendar_no)

          $.ajax({
              url: "modifydate",
              type: 'post',
              async: false,
              data: {
            	  startdate: modifyDate,
                  calendar_no: calendar_no
              },
              success: function (response) {
                  alert('날짜가 변경되었습니다!')
              },
              error: function (Http, status, error) {
                  alert('날짜변경에 실패했습니다.')
              }
          });


      },
      locale:'ko'//한글 처리
    });
  
    calendar.render();

   
   
   function loadingEvents() { //처음 페이지 로딩시 이벤트 불러오기, json형태로
       var return_value = null;
       $.ajax({
           type: 'POST',
           url: 'loadevent',
           async: false,
           data: {
               "group_no": group_no //group_no를 통해 해당그룹의 이벤트정보들 가져옴
           },
           dataType: 'JSON',
           success(response) {
               console.log(response);//받은 데이터 콘솔 확인
               return_value = response;
           }
       })
       return return_value;
   }
   
   
   //일정 만들기 확인 클릭
   $(".modal-footer").on('click', '#save', function (e) {
	   console.log( $('#title').val())
       if ($("#subject").val() == "") {
           alert('일정 제목을 입력해주세요 !')
           return;
       } else if ($("#content").val().trim() == "") {
           alert('일정 내용을 입력해주세요 !')
           return;
       } else {

           $.ajax({
               url: "add",
               type: "post",
               async: false,
               data: {
                   group_no: group_no,
                   title: $('#title').val(),
                   startdate: $('#date').val(),
                   subject: $('#subject').val(),
                   content: $('#content').val(),
                   location: $('#location').val()
               },
               success: function (response) {
                   alert( '일정이 추가되었습니다!')
                   calendar.refetchEvents();
                   calendar.render();
                   $('.btn-close').click();
                   document.location.href = document.location.href;
                   //loadingEvents();
                   //calendar.refetchEvents();
                  //$("#calendar").load("../calendar/view",{group_no: group_no})
               }
               ,
               error: function (Http, status, error) {
                   console.log(error);
               }
           });
       }
   });
   
   
 //deltet.png 클릭 시
	$(".modal-footer").on('click', '#delete',function(){
		var calendar_no = $(this).next().next().val();//댓글번호
		console.log(calendar_no)
		if(!confirm('정말 삭제하시겠습니까?')) {
			return;
		}
		$.ajax({
			type: "post",
			url:"delete",
			data : {
				"calendar_no":calendar_no
			},
			success:function(result){
				if(result==1) {
					alert( '일정이 삭제되었습니다!')
					document.location.href = document.location.href;//다시 load하는 방법..?
					$('.btn-close').click();
					loadingEvents();//삭제 후 해당 페이지의 내용을 보여준다.
				}
			}
		})
	})
   
   
	$(".modal-footer").on('click', '#modify',function(){
		var calendar_no = $(this).next().val();//댓글번호
		console.log(calendar_no)
		if(!confirm('수정하시겠습니까?')) {
			return;
		}
		$.ajax({
			type: "post",
			url:"modify",
			data : {
				group_no: group_no,
                title: $('#title').val(),
                startdate: $('#date').val(),
                subject: $('#subject').val(),
                content: $('#content').val(),
                location: $('#location').val(),
                calendar_no : calendar_no
			},
			success:function(result){
				if(result==1) {
					alert( '일정이 수정되었습니다!')
					document.location.href = document.location.href;//다시 load하는 방법..?
					//$('.btn-close').click();
					//loadingEvents();//삭제 후 해당 페이지의 내용을 보여준다.
				}
			}
		})
	})
	
	//새로고침 방식  calendar.refetchEvents(); 으로 바꾸는 법 찾기
</script>
</body>
</html>