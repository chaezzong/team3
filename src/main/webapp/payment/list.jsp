<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>서울여행</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
<!-- Place favicon.ico in the root directory -->
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
.checked {
  color: orange;
}
.star-rating {
  font-size: 0;
  white-space: nowrap;
  display: inline-block;
  height: 50px;
  overflow: hidden;
  position: relative;
  background: url('data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iMjBweCIgaGVpZ2h0PSIyMHB4IiB2aWV3Qm94PSIwIDAgMjAgMjAiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDIwIDIwIiB4bWw6c3BhY2U9InByZXNlcnZlIj48cG9seWdvbiBmaWxsPSIjREREREREIiBwb2ludHM9IjEwLDAgMTMuMDksNi41ODMgMjAsNy42MzkgMTUsMTIuNzY0IDE2LjE4LDIwIDEwLDE2LjU4MyAzLjgyLDIwIDUsMTIuNzY0IDAsNy42MzkgNi45MSw2LjU4MyAiLz48L3N2Zz4=');
  background-size: contain;
}
.star-rating i {
  opacity: 0;
  position: absolute;
  left: 0;
  top: 0;
  height: 100%;
  z-index: 1;
  background: url('data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iMjBweCIgaGVpZ2h0PSIyMHB4IiB2aWV3Qm94PSIwIDAgMjAgMjAiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDIwIDIwIiB4bWw6c3BhY2U9InByZXNlcnZlIj48cG9seWdvbiBmaWxsPSIjRkZERjg4IiBwb2ludHM9IjEwLDAgMTMuMDksNi41ODMgMjAsNy42MzkgMTUsMTIuNzY0IDE2LjE4LDIwIDEwLDE2LjU4MyAzLjgyLDIwIDUsMTIuNzY0IDAsNy42MzkgNi45MSw2LjU4MyAiLz48L3N2Zz4=');
  background-size: contain;
}
.star-rating input {
  -moz-appearance: none;
  -webkit-appearance: none;
  opacity: 0;
  display: inline-block;
  height: 100%;
  margin: 0;
  padding: 0;
  z-index: 2;
  position: relative;
}
.star-rating input:hover + i,
.star-rating input:checked + i {
  opacity: 1;
}
.star-rating i ~ i {
  width: 40%;
}
.star-rating i ~ i ~ i {
  width: 60%;
}
.star-rating i ~ i ~ i ~ i {
  width: 80%;
}
.star-rating i ~ i ~ i ~ i ~ i {
  width: 100%;
}

.star-rating.star-5 {width: 250px;}
.star-rating.star-5 input,
.star-rating.star-5 i {width: 20%;}
.star-rating.star-5 i ~ i {width: 40%;}
.star-rating.star-5 i ~ i ~ i {width: 60%;}
.star-rating.star-5 i ~ i ~ i ~ i {width: 80%;}
.star-rating.star-5 i ~ i ~ i ~ i ~i {width: 100%;}

.star-rating.star-3 {width: 150px;}
.star-rating.star-3 input,
.star-rating.star-3 i {width: 33.33%;}
.star-rating.star-3 i ~ i {width: 66.66%;}
.star-rating.star-3 i ~ i ~ i {width: 100%;}
::after,
::before {
  height: 100%;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  text-align: center;
  vertical-align: middle;
}
</style>

<!-- CSS here -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/magnific-popup.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<link rel="stylesheet" href="../css/themify-icons.css">
<link rel="stylesheet" href="../css/nice-select.css">
<link rel="stylesheet" href="../css/flaticon.css">
<link rel="stylesheet" href="../css/jquery-ui.css">
<link rel="stylesheet" href="../css/gijgo.css">
<link rel="stylesheet" href="../css/animate.css">
<link rel="stylesheet" href="../css/slick.css">
<link rel="stylesheet" href="../css/slicknav.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/style_con.css">

<script type="text/javascript">

// 결제 내역 삭제
function payment_delete(payment_no){
  var confirm_val = confirm("삭제하시겠습니까?(복구불가능)");

  if(confirm_val){
    var mem_no = $('#mem_no').val();
    var params ='mem_no='+mem_no+'&payment_no=' + payment_no ;
  // alert(params); 
    
  $.ajax({ 
    url: './delete.do',
      type: 'post',  //다른타입은 get
      cache: false,  //응답결과를 브라우저에 임시저장하냐마냐 (취소 새로운값을 계속받을떈 취소함)
      async: true, //true: 비동기통신
      dataType: 'json', //응답형식: json, html, xml ...(응답많은순)
      data: params, //데이터
      success: function(data) { // 서버로부터 성공적으로 응답이 온경우
        // var msg = "";
        // alert ('cnt:' + data.cnt); // 정상적 전달 확인
        // alert ('mem_no:' + data.mem_no); // 정상적 전달 확인
       if (data.cnt > 0) {
           alert("삭제되었습니다?");
         location.reload();
        } else {
          alert("삭제못함");
        }
      },
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    });
  } else
    return false;
  }

  // 리뷰 등록 모달 출력
  function review_create(payment_no, at_no) {
    // alert('payment_no: ' + payment_no);
    //  alert('at_no: ' + at_no);
    var review_create_frm = $('#review_create_frm');
    $('#payment_no', review_create_frm).val(payment_no); // 리뷰 등록할 결제 번호 저장
    $('#at_no', review_create_frm).val(at_no); // 리뷰 등록할 상품 번호 저장
    $('#payment_review_modal').modal();               // 리뷰 등록폼 다이얼로그 출력
  }
    
  //  리뷰 등록 실행
  function review_create_proc() {
    $('#modal_panel_close').focus();    // 모달 창 닫기

    var review_create_frm = $('#review_create_frm');
    var params = review_create_frm.serialize();

    //alert("params: " + params);

    // 영숫자, 한글, 공백, 특수문자: 글자수 1로 인식, 오라클은 1자가 3바이트임으로 300자로 제한
    // alert('내용 길이: ' + $('#review_word', review_frm).val().length);
    
    // 리뷰 내용 review_word는 300자 이내 
    if ($('#review_word', review_create_frm).val().length > 300) {
      $('#modal_title').html('댓글 등록'); // 제목 
      $('#modal_content').html("댓글 내용은 300자이상 입력 할 수 없습니다."); // 내용
      $('#modal_panel').modal();           // 다이얼로그 출력
      return;  // 실행 종료
    }
    
    $.ajax({
      url: "../review/create.do", // action 대상 주소
      type: "post",          // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우

        var msg = ""; // 메시지 출력
        
        if (rdata.count > 0) {
          //alert(rdata.count);
          $('#review_create_frm_close').trigger("click"); // 등록폼 닫기, click 발생 
          $('#' + payment_no).remove(); // 태그 삭제
          
          alert('댓글 등록 성공');
          
          msg = "댓글을 등록했습니다";
          $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
          $('#modal_title').html('성공'); // 제목 
          location.reload();
          
        } else {
          msg = "댓글 등록에 실패했습니다.";
          $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
          $('#modal_title').html('실패'); // 제목 
        }
        $('#modal_content').html(msg);     // 내용
        $('#modal_panel_msg').modal();           // 다이얼로그 출력
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR request.status: '+request.status + '/ ' + error;
        console.log(msg); // Chrome에 출력
      }
    });
  }

  //  리뷰 조회 실행
  function review_view_proc(payment_no) {

    $.ajax({
      url: "../review/read_by_payment_no.do", // action 대상 주소
      type: "post",          // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: {'payment_no':payment_no},    
      contentType: "application/x-www-form-urlencoded; charset=UTF-8",
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        if (rdata.review_rate> 0) {
     //   alert(rdata.review_word);
          var msg = '평점: ' + rdata.review_rate + '<br>' + '리뷰: ' + rdata.review_word;
          $('#review_rate').html(msg); 
        } else {
          var msg = '리뷰 조회에 실패했습니다';
        }
        $('#review_view_modal').modal();           // 다이얼로그 출력
      },
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR request.status: '+request.status + '/ ' + error;
        console.log(msg); // Chrome에 출력
      }
    });
  }
</script>

 

</head> 

<%-- 리뷰 작성 모달 --%>
<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="payment_review_modal" role="dialog">
    <div class="modal-dialog modal-lg">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:25px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form" name='review_create_frm' id=review_create_frm>
            <input type='hidden' name='payment_no' id='payment_no' value=''>
            <input type='hidden' name='at_no' id='at_no' value=''>
            <input type='hidden' name='mem_no' id='mem_no' value='${sessionScope.mem_no }'>
            <div class="form-group">
              <label for="review_rate"> 평점</label>
              <span class="star-rating star-5" >
            <input type="radio" name="review_rate" value="1"><i></i>
            <input type="radio" name="review_rate" value="2"><i></i>
            <input type="radio" name="review_rate" value="3"><i></i>
            <input type="radio" name="review_rate" value="4"><i></i>
            <input type="radio" name="review_rate" value="5"><i></i>
          </span>
            </div>
            <div class="form-group">
              <label for="review_word"> 후기</label>
              <textarea name='review_word' id='review_word' style='width: 100%; height: 60px;' placeholder=" 300자까지 입력 가능합니다."></textarea>
            </div>
              <button type="button" class="btn btn-success btn-block" id='btn_review' onclick="review_create_proc(review_create_frm.payment_no.value); ">등록</button>
          </form>
        </div>
        <div class="modal-footer"> 
          <button type="submit"  id='review_create_frm_close'  class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 취소</button>
        </div>
      </div>
    </div>
  </div> 
</div>

<%-- 리뷰 조회 모달 --%>
<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="review_view_modal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        
        <div class="modal-header" style="padding:25px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body" style="padding:40px 50px;">
            <div class="review_rate" id='review_rate'></div> 
        </div>
        
        <div class="modal-footer"> 
          <button type="submit"  id='review_create_frm_close'  class="btn btn-danger btn-default pull-left" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div> 
</div>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
    
  <div class='menu_line'></div>
  
  <br>
  <br>
<c:import url="../mem/list_index_left.do" />
<DIV class="col-sm-9 col-md-10 cont">  <!-- 내용 출력 컬럼 --> 
 
<form name='frm' id='frm' style='margin-top:50px;'>
  <input type='hidden' name='mem_no' id='mem_no' value='${sessionScope.mem_no }'>
  <input type='hidden' name='payment_no' id='payment_no' value='${payment_no }'>
   <c:choose>
      <c:when test="${search_count == 0 }">
      <h2 style='text-align: center;'>   [${memVO.mem_nick }]님의 결제내역이 없습니다! ~</h2>
      </c:when>
      <c:otherwise> 
        <div style='width: 100%; margin-top:50px;' >
          <table class="table table-striped" style='width: 100%;'>
            <colgroup>
              <col style="width: 5%;"></col>
              <col style="width: 15%;"></col>
              <col style="width: 10%;"></col>
              <col style="width: 20%;"></col>
              <col style="width: 20%;"></col>
              <col style="width: 50%;"></col>
            </colgroup>
            <%-- table 컬럼 --%>
            <thead>
              <tr>
                <th style='text-align: center;'>번호</th>
                <th style='text-align: center;'>상품</th>
                <th style='text-align: center;'>총액</th>
                <th style='text-align: center;'>결제방법</th>
                <th style='text-align: center;'>결제일</th>
                <th style='text-align: center;'></th>
              </tr>
            </thead>
            
            <%-- table 내용 --%>
            <tbody>
              <c:forEach var="paymentVO" items="${list }">
                <c:set var="payment_no" value="${paymentVO.payment_no }" />
                <c:set var="at_price" value="${paymentVO.at_price }" />
                <c:set var="at_name" value="${paymentVO.at_name }" />
                <c:set var="at_no" value="${paymentVO.at_no }" />
                <c:set var="payment_total" value="${paymentVO.payment_total }" />
                <c:set var="payment_way" value="${paymentVO.payment_way }" />
                <c:set var="payment_date" value="${paymentVO.payment_date }" />
                <c:set var="exp" value="${paymentVO.exp }" />
                <c:set var="cart_cnt" value="${paymentVO.cart_cnt }" />
                <c:set var="mem_no" value="${memVO.mem_no }" />
                <tr> 
                
                 <td style='text-align: center;'> 
                    ${payment_no } 
                 </td>
                 <td style='text-align: center;'>
                  <a href="../at/read.do?at_no=${at_no }">
                   ${at_name} 
                  </a> 
                 </td>
                 <td style='text-align: center;'>${payment_total} </td>
                 <td style='text-align: center;'>${payment_way }</td>
                 <td style='text-align: center;'>${payment_date}</td>
                 <td  style='text-align: center;'>
                   <button type="button" id='btn_payment_delete_${payment_no }' name='btn_payment_delete_${payment_no }'  class="btn btn-info"
                                  onclick="payment_delete(${payment_no})">삭제</button>
                   <button type="button" id='btn_payment_read_${payment_no }' name='btn_payment_read_${payment_no }'  class="btn btn-info"
                                  onclick="location.href='./read.do?payment_no=${payment_no }'">상세 내역</button>
        <c:choose>
                    <c:when test="${exp == 0 }">
                    <button type="button" onclick="review_create('${payment_no }' , '${at_no }')" class="btn btn-info"> 리뷰 쓰기 </button>
                    </c:when>
                    <c:otherwise>
                    <button type="button" onclick="review_view_proc('${payment_no }')" class="btn btn-info"> 리뷰 보기 </button>
                    </c:otherwise>
                   </c:choose>
                 </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
         </div>
        </c:otherwise>
      </c:choose>
  </form>
  </DIV>
  <div style='margin-bottom:50px;'>${paging }</div>
  
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html> 