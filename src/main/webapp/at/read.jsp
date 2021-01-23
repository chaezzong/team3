<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="shortcut icon" type="image/x-icon"
  href="../../img/favicon.png">
<!-- Place favicon.ico in the root directory -->

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
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">

<script type="text/javascript">
  $(function() {
    $('#btn_wish').on('click', wish);
    $('#btn_img_dlt').on('click', img_dlt);
  });

/*   function send() {
    var frm = $('#frm').serialize(); //At_Dates
    var dates_date = $('#dates_date').val();
    var params = frm + "&dates_date=" + dates_date;
    //alert(params);
    $.ajax({
      type : "post",
      url : "./book.do",
      cache : false,
      dataType : "json",
      async : false,
      data : params,
      success : function(rdata) {

        if (rdata.cnt >= 1) {
          alert("예약 성공");
          location.href = "./book.jsp";
        } else if (rdata.no_book == 1) {
          alert("예약 가능한 수량이 없습니다. 날짜와 수량을 다시 확인해 주세요.");
        }

      },
      error : function(request, status, error) { // callback 함수, 전형적인 에러함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
        msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
        console.log(msg);
      }
    });
  } */

  function img_dlt() {
    var frm = $('#frm');
    var at_no = $('#at_no', frm).val();
    var param = "at_no=" + at_no;
    alert(at_no);
    $.ajax({
          type : "post",
          url : "../at_img/delete.do",
          cache : false,
          dataType : "json",
          async : false,
          data : param,
          success : function(rdata) {

            if (rdata.cnt >= 1) {
              alert("이미지 삭제 성공");
              location.href = "./read.do?at_grp_no=${at_VO.at_grp_no }&at_no=${at_VO.at_no }";
            } else {
              alert("이미지 삭제 실패");
            }

          },
          error : function(request, status, error) { // callback 함수, 전형적인 에러함수
            var msg = 'ERROR<br><br>';
            msg += '<strong>request.status</strong><br>' + request.status
                + '<hr>';
            msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
            console.log(msg);
          }
        });
  }



  $(function() { // 자동 실행
    $('#btn_send').on('click', send); 
  });

  function send(){
    
    var frm = $('#frm');
    var mem_no = $('#mem_no', frm).val();
    var at_no = $('#at_no', frm).val();
    
    var params = frm.serialize();// 값가져옴
   // var params ='mem_no='+mem_no +'&at_no=' + at_no;
  //  alert(params); 
    $.ajax({ 
      url: '../cart/create.do',
      type: 'post',  //다른타입은 get
      cache: false,  //응답결과를 브라우저에 임시저장하냐마냐 (취소 새로운값을 계속받을떈 취소함)
      async: true, //true: 비동기통신
      dataType: 'json', //응답형식: json, html, xml ...(응답많은순)
      data: params, //데이터

      success: function(data) { // 서버로부터 성공적으로 응답이 온경우
        // var msg = "";
       if (data.cnt > 0) {
          
          //alert (rdata.cnt); // 정상적 전달 확인
         location.href='${root}/cart/at_cart_mem_list.do?mem_no='+data.mem_no;

        } else {
          alert("장바못감");


        }
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      }
    });

  
  }
</script>
</head>

<body>

  <!-- header-start -->
  <jsp:include page="/menu/top.jsp" />
  <!-- 관리자만 노출 -->
  <ASIDE style='float: right;'>
    <button type="button"
      onclick="location.href='${root }/at/update.do?at_no=${at_VO.at_no }'">상품
      수정</button>
  </ASIDE>
  <!-- 관리자만 노출 -->

  <!--  본문 start -->
  <div class="destination_details_info">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-9">
          <div class="destination_info">

            <h3>${at_VO.at_no} / ${at_VO.at_name }
                  <!-- 이미지 갤러리 -->

      <div class="section-top-border">
        <div>
          

            <c:forEach var="img" items="${list_img }">
              <div class="col-md-4 ">
                <a href="./storage/${img.at_img_fupname }"
                  class="img-pop-up">
                  <div class="single-gallery-image"
                    style="background: url(./storage/${img.at_img_fname});"></div>
                </a>
              </div>
            </c:forEach>
          </div>
        </div>
        </h3>
      </div>
      <!-- 이미지 갤러리 --></h3>
                 
            <p>${at_VO.at_name } | ${at_VO.at_detail }|
              <fmt:formatNumber value="${at_VO.at_price }" pattern="#,###" />
              KRW
            </p>
            <p>
              <c:forEach var="dates_cnt" items="${list }">
                예약 가능 날짜:${dates_cnt.dates_date }<br>
              </c:forEach>
            </p>
   
            <!-- 예약입력받기 start -->
            <FORM name='frm' id='frm' method='POST' action='../cart/create.do'>
            <input type='hidden' name='mem_no' id='mem_no' value='${sessionScope.mem_no }'>
            <input type='hidden' name='at_no' id='at_no' value='${at_VO.at_no }'>
            <input type='hidden' name='at_name' id='at_name' value='${at_VO.at_no }'>
              <!-- 넘겨야 할 값: At_dates, int book -->
              <%--       <input type='hidden' name='at_grp_no' id='at_grp_no' value='${at_VO.at_grp_no }'> --%>
<br><br><br><br><br><br>

      
      <div class="form-group">   
        <label class="control-label col-md-3">수량 : </label>   
        <div class="col-md-9">
          <input type='number'id = 'cart_cnt'  name='cart_cnt' value='' placeholder="수량" min="1" max="10" step="1" style='width: 30%;'
          class="form-control" required>
        </div>

      </div>
      
      <div class="form-group">   
         <label class="control-label col-md-3">개별가격 : </label>   
        <div class="col-md-9">
          <input type='text' class="form-control input-lg"  id = 'at_price'  name='at_price' value='${at_VO.at_price}' placeholder="개별가격" style='width: 80%;'>
        </div>
      </div>      
      
      
      
         
              <button type="button" class="btn" id="btn_send">장바구니</button>
                      <button type="button" 
                    onclick="history.back()" 
                    class="btn">취소</button>
              
            </FORM>
          </div>
        </div>
      </div>


      <!-- 예약입력받기 end -->
      <div class="bordered_1px"></div>
      <p>${at_VO.at_content }</p>
      <p>${at_VO.at_map }</p>
      <div class="single_destination">
        <h4>Point</h4>
        <p>There are many variations of passages of Lorem Ipsum
          available, but the majority have suffered alteration in some
          form, by injected humour, or randomised words.</p>
      </div>

      <div class="bordered_1px"></div>


   <!-- 이미지 갤러리 -->

<%--       <div class="section-top-border">
        <div>
          <h3>Image Gallery</h3>
          <!-- 관리지만 표시 -->
          <a href="${root }/at_img/modify.do?at_no=${at_VO.at_no }">이미지
            파일 추가 업로드</a>
          <div class="row gallery-item">

            <!--   <button type="button" class="btn" id="btn_img_dlt">이미지 파일 전체 삭제</button></div> -->
            <!-- 관리자만 표시 -->

            <c:forEach var="img" items="${list_img }">
              <div class="col-md-4 ">
                <a href="./storage/${img.at_img_fupname }"
                  class="img-pop-up">
                  <div class="single-gallery-image"
                    style="background: url(./storage/${img.at_img_fname});"></div>
                </a>
              </div>
            </c:forEach>
          </div>
        </div>
      </div> --%>
      <!-- 이미지 갤러리 -->
    </div>



    <!--  본문 end -->




    <jsp:include page="/menu/bottom.jsp" />
</body>

</html>