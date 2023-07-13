/**
 * 
 */
 
$(function(){

	$("button#orderBtn").click(function(){
		var chk = confirm("상품을 주문하시겠습니까?");
		if(chk) {
			$("form#orderFrm").attr("action","/orderProc");
			$("form#orderFrm").submit();
		}
	});

});