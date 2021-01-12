function daumPost(){
	new daum.Postcode({
		oncomplete:function(data){
			//도로 명일 경우 R, 지번일 경우 J 의 값을 가지고 있다.
			console.log("data.userSelectedType : "+data.userSelectedType)
			console.log("data.roadAddress : "+data.roadAddress)
			console.log("data.jibunAddress : "+data.jibunAddress)
			console.log("data.zonecode(우편번호) : "+data.zonecode)
			var addr = "";
			if(data.userSelectedType === "R"){//도로명 주소일 경우( R )
				addr = data.roadAddress;
			}else{//지번일 경우( J )
				addr = data.jibunAddress;
			}
			//document.getElementById("addr1").value = data.zonecode;
			//document.getElementById("addr2").value = addr;
			//document.getElementById("addr3").focus();
			$("#addr1").val(data.zonecode);
			$("#addr2").val(addr);
			$("#addr3").focus();
		}
	}).open()
}