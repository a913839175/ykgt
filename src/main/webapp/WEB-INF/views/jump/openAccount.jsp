<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<script type="text/javascript">
	var OP_CONFIG = {"page":""};
</script>
<%@ include file="../common/header.jsp"%>
    <div id="content">
        <div class="bscg-loading"></div>
	</div>
<script type="text/javascript">
    var params = {
        frontRetUrl:DomainURL+'/user/account'
    };
    G.post(Service.admininfo,params,function(data){
        if(data.returnCode == 1){
        	location.replace(data.requestUrl);
        }else{
            // $('.bscg-loading').addClass('error');
            G.$alert("进入包商存管账户失败!",false,function(){
            	window.location = '/index';
            },true);
        }               
    },function(data){
    	window.location = '/index';
    });
</script>	
<%@ include file="../common/footer.jsp"%>

