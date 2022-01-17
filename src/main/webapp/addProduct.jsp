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
	   <p class="page-tiltle">Add New Product</p>
	   <input type="text" id="pnr" placeholder="Enter Product number">
	   <input type="text" id="pname" placeholder="Enter Product name">
	   <input type="text" id="pprice" placeholder="Enter Product price">
	   <button id="add_btn">Add Product</button>
	   <p id="error-label" class="errormsg"></p>
	</div>
</div>

<script>
$('#back2sc').click(function(){parent.location.href='index.jsp';});
$('#plist').click(function(){parent.location.href='dashboard.jsp';});
$('#addproduct').click(function(){parent.location.href='addProduct.jsp';});
$('#add_btn').click(function(){
  	var errLabel= $('#error-label'); errLabel.html('');
	var nr = $.trim($('#pnr').val());
	var name= $.trim($('#pname').val());
	var price = $.trim($('#pprice').val());
	if(nr.length > 0 && !isNaN(nr)){
		if(name.length > 0){
			if(price.length > 0){
				window.location.href=window.location.href+'?nr='+ nr+'&name='+name+'&price='+price;
				<%
				    int nr= 0;
        	    	String name="";
        	    	double price=0.0;
        	    	boolean processServ=false;
	        	    if(request.getParameter("nr") != null){
	        	    	processServ=true;
	        	    	nr=Integer.parseInt(request.getParameter("nr"));
	        	    }else{processServ=false;}
        	    
	        	    if(request.getParameter("name") != null && processServ==true){
	        	    	processServ=true;
	        	    	name=request.getParameter("name");
	        	    }else{processServ=false;}
	        	    
	        	    if(request.getParameter("price") != null && processServ==true){
	        	    	processServ=true;
	        	    	price=Double.parseDouble(request.getParameter("price"));
	        	    }else{processServ=false;}
					
	        	    if(processServ){
	        	    	ProductManagement pm = new ProductManagement();
				    	pm.addProduct(new Product(nr,name,price),session);
	        	    }
	        	%>
		    	
		    	$('#pnr').val(''); $('#pname').val(''); $('#pprice').val('');
		    	errLabel.html('Product has been added successfully');
		    	
				
			}else{errLabel.html('Invalid Product price');}
		}else{errLabel.html('Invalid Product name');}	
	}else{errLabel.html('Invalid Product Number');}
	
});
</script>
</body>
</html>