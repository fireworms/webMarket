/**
 * 
 */
function CheckAddProduct() {
	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");

	if (!check(/^P[0-9]{4,11}$/, productId,
			"[상품 코드]\nP와 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 P로 시작하세요"))
		return false;

	if (name.value.length < 4 || name.value.length > 12) {
		alert("[상품명]\n최소 4자에서 최대 12자까지 입력하세요");
		name.select();
		name.focus();
		return false;
	}

	if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[가격]\n숫자만 입력하세요");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}

	if (unitPrice.value < 0) {
		alert("[가격]\n음수는 입력할 수 없습니다");
		unitPrice.select();
		unitPrice.focus();
		return false;
	} else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice,
			"[가격]\n소수점 둘째 자리까지만 입력하세요"))
		return false;

	if (isNaN(unitsInStock.value)) {
		alert("[재고 수]\n숫자만 입력하세요");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}

	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

	document.newProduct.submit()
}
function checkAddMember() {
	var id = document.getElementById("id");
	var password = document.getElementById("password");
	var name = document.getElementById("name");
	var gender = document.getElementById("gender");
	var birthday = document.getElementById("birthday");
	var email = document.getElementById("email");
	var tel = document.getElementById("tel");
	var address = document.getElementById("address");

	if (!check(/^[a-zA-Z0-9]{4,10}$/, id, "[아이디]\n영문자와 숫자를 조합하여 4~10자까지 입력하세요"))
		return false;

	if (!check(/^[a-zA-Z0-9]{4,10}$/, password,
			"[비밀번호]\n영문자와 숫자를 조합하여 4~10자까지 입력하세요"))
		return false;

	if (!check(/^[a-zA-Z가-힣]{2,20}$/, name, "[이름]\n2~20자까지 입력하세요"))
		return false;

	if (!check(/^[0-9]{8,8}$/, birthday, "[생년월일]\n 주어진 형식으로 입력하세요"))
		return false;

	if (!check(
			/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i,
			email, "[이메일]\n 이메일 형식으로 입력하세요"))
		return false;
	
	if (!check(/^[0-9]{3,3}[-]{0,1}[0-9]{4,4}[-]{0,1}[0-9]{4,4}$/, tel, "[전화번호]\n 제대로 입력하세요"))
		return false;

	if (!check(/^.{1,200}$/, address, "[주소]\n주소를 정확히 입력하세요"))
		return false;
	
	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

	
	document.newMember.submit()
}
function CheckShippingProduct() {
	var name = document.getElementById("name");
	var shippingDate = document.getElementById("shippingDate");
	var country = document.getElementById("country");
	var zipCode = document.getElementById("zipCode");
	var addressName = document.getElementById("addressName");

	if (name.value.length < 2 || name.value.length > 20) {
		alert("[성명]\n최소 2자에서 최대 20자까지 입력하세요");
		name.select();
		name.focus();
		return false;
	}

	if (!check(/^20\d\d\/\d\d\/\d\d$/, shippingDate,
			"[배송일]\n2yyy/mm/dd형식으로 입력하세요"))
		return false;

	if (country.value.length < 2 || country.value.length > 20) {
		alert("[국가]\n최소 2자에서 최대 20자까지 입력하세요");
		country.select();
		country.focus();
		return false;
	}

	if (isNaN(zipCode.value) || zipCode.value == "") {
		alert("[우편번호]\n숫자만 입력하세요");
		zipCode.select();
		zipCode.focus();
		return false;
	}

	if (addressName.value.length < 1) {
		alert("[주소]\n주소를 입력하세요");
		addressName.select();
		addressName.focus();
		return false;
	}

	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

	document.shippingProduct.submit()
}