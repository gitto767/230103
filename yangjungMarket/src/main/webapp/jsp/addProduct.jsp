<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>상품 등록</title>
<script>
function CheckAddProduct(){
	var productId=document.getElementById("productId");
	var name=document.getElementById("name");
	var unitprice=document.getElementById("unitprice");
	var unitsinstock=document.getElementById("unitsinstock");
	
	//상품아이디 체크
	if(!check(/^P[0-9]{4,11}$/, productId,
			"[상품코드]\nP와 숫자를 조합하여 5~12자 까지 입력하세요\n첫 글자는 반드시 P로 시작하세요."))
		return false;
	//상품명 체크
	if(name.value.length<4||name.value.length>12){
		alert("[상품명]\n최소 4자에서 최대 50자 까지 입력하세요.");
		name.select();
		name.focus();
		return false;
	}
	//상품가격체크
	if(unitprice.value.length==0||isNaN(unitprice.value)){
		alert("[가격]\n숫자만 입력하세요.");
		unitprice.select();
		unitprice.focus();
		return false;
	}
	if(unitprice.value<0){
		alert("[가격]\n은 음수를 입력할수없습니다.");
		unitprice.select();
		unitprice.focus();
		return false;
	}else if(!check(/^\d+(?:[.]?[\d]?[\d])?$/,unitprice,
			"[가격]\n소수점 둘째자리까지만 입력하세요."))
		return false
	
	//재고수체크
	if(isNaN(unitsinstock.value)){
		alert("[재고수]\n숫자만 입력하세요");
		unitsinstock.select();
		unitsinstock.focus();
		return false;
	}
	function check(regExp, e, msg){
		if(regExp.test(e.value)){
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	document.newProduct.submit()
}
</script>
</head>
<body>
    <%@ include file="menu.jsp" %>
    <div class="jumbotron">
      <div class="container">
        <h1 class="display-6">상품등록</h1>
      </div>
    </div>
    <div class="container">
      <form name="newProduct" action="processAddProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
        <div class="form-group row">
          <label class="col-sm-2">상품코드</label>
          <div class="col-sm-3">
            <input type="text" id="productId" name="productId" class="form-control">
          </div>
        </div>
        
        <div class="form-group row">
          <label class="col-sm-2">가격</label>
          <div class="col-sm-3">
            <input type="text" id="unitprice" name="unitprice" class="form-control">
          </div>
        </div>
        
        <div class="form-group row">
          <label class="col-sm-2">상품명</label>
          <div class="col-sm-3">
            <input type="text" id="name" name="name" class="form-control">
          </div>
        </div>
        
        <div class="form-group row">
          <label class="col-sm-2">상세정보</label>
          <div class="col-sm-5">
            <textarea name="description" cols="50" rows="2" class="form-control"></textarea>
          </div>
        </div>
        
        <div class="form-group row">
          <label class="col-sm-2">제조사</label>
          <div class="col-sm-3">
            <input type="text" name="manufacturer" class="form-control">
          </div>
        </div>
        
        <div class="form-group row">
          <label class="col-sm-2">분 류</label>
          <div class="col-sm-3">
            <input type="text" name="category" class="form-control">
          </div>
        </div>
        
        <div class="form-group row">
          <label class="col-sm-2">재고수</label>
          <div class="col-sm-3">
            <input type="text" id="unitsinstock" name="unitsinstock" class="form-control">
          </div>
        </div>
        
        <div class="form-group row">
          <label class="col-sm-2">상 태</label>
          <div class="col-sm-5">
            <input type="radio" name="condition" value="New">신규 제품
            <input type="radio" name="condition" value="Old">중고 제품
            <input type="radio" name="condition" value="Refurbished">재생 제품
          </div>
        </div>
        
        <div class="form-group row">
          <label class="col-sm-2">이미지</label>
          <div class="col-sm-5">
            <input type="file" name="productimage" class="form-control">
          </div>
        </div>
        
        <div class="form-group row">
          <div class="col-sm-offset-2 col-sm-10">
            <input type="button" class="btn btn-primary" value="등록" onclick="CheckAddProduct()">
          </div>
        </div>
      </form>
    </div>

</body>
</html>