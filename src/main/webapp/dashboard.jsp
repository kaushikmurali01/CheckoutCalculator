<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.ArrayList,org.ProductManagement,org.Product" %>
<!DOCTYPE html>
<html>
<head>
<title>Checkout Calculator</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
<meta charset="utf-8"/>
<script src="js/jquery.js"></script>
<script src="js/tools.js"></script>
<link rel="stylesheet" href="css/formate.css"></link>
<script> var pListAsStr='';</script>
</head>
<body>
<div class="login-wrapper">
    <div class="app-title">Checkout Calculator</div>
	<div><button id=back2sc>Back to  Shopping Cart</button></div>
</div>
<hr>
<div class="dboard-wrapper">
	<div>
		<ul>
			<li><a id="plist">Products List</a></li>
			<li><a id="addproduct">Add Product</a></li>
		</ul>
	</div>
	<div>&nbsp;</div>
	<div>
	   <p class="page-tiltle">Products List</p>
	   <div class="list-row">
	   		<div><b>No.</b></div>
	   		<div><b>Name</b></div>
	   		<div><b>Price</b></div>
	   </div>
	   <div style="width:100%" id="productslist">
	   </div>
	   
	   
	</div>
</div>

<%
	ProductManagement pm = new ProductManagement();
	pm.initList(session);
	ArrayList<Product> list = pm.getProducts();
	for(Product p: list){
%>
    	<script>
    	pListAsStr+='<%=p.getProductId()%>';
    	pListAsStr+='@';
    	pListAsStr+='<%=p.getName()%>';
    	pListAsStr+='@';
    	pListAsStr+='<%=p.getPrice()%>';
    	pListAsStr+='|';
    	</script>
 <%}%>
 
<script>

var pListAsStr = pListAsStr.substring(0,pListAsStr.length-1);
var products = pListAsStr.split('|');
var str='';
for(var i=0; i < products.length; i++){
	var product = products[i].split('@');
	str +='<div class="list-row">';
	str +='<div>'+product[0]+'</div>';
	str +='<div>'+product[1]+'</div>';
	str +='<div>'+product[2]+'</div>';
	str +='</div>';
	//(this.ITEMS).push({Id:product[0],name:product[1],price:product[2]});
}

$('#productslist').html(str);
$('#back2sc').click(function(){parent.location.href='index.jsp';});
$('#plist').click(function(){parent.location.href='dashboard.jsp';});
$('#addproduct').click(function(){parent.location.href='addProduct.jsp';});
</script>

  

1.  
</body>
</html>