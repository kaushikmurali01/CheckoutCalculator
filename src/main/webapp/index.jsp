<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<div><button id=logindb>Login to  Dashboard</button></div>
</div>	
<div class="main-wrapper">
	<div>
		<div class="cart-header">
			<div>Add Items</div>
			<div>&nbsp;</div>
			<div>&nbsp;</div>
		</div>
		<select id="items">
			<option value=0>Select Item</option>
		</select>
		<div class="quantity-wrapper">
			<input id="quantity" type="text" readonly value="1">
			<div>&nbsp;</div>
			<button id="plus">+</button>
			<div>&nbsp;</div>
			<button id="minus">-</button>
		</div>
		<div class="discount-wrapper">
			<input id="discount" type="text" value="0">
			<div>&nbsp;</div>
			<div> Enter discount (max 10%  optional)</div>
		</div>
		<button id="addtocart">Add Item to Cart</button>
		<div id="err-msg" class="errormsg">&nbsp;</div>
	</div>
	
	<div>&nbsp;</div>
	    
	<div>
		<div class="cart-header">
			<div>Cart</div>
			<div><img src="images/cart-32.png"></div>
			<div id="itemscount">0</div>
		</div>
		<div class="selected-item-row">
			<div><b>Name</b></div>
			<div><b>Quantity</b></div>
			<div><b>Price</b></div>
			<div><b>Discount %</b></div>
			<div><b>Total</b></div>
			</div>
		<div id="selected_items_list"></div>
	</div>
   
</div>
	<%  
		ProductManagement pm = new ProductManagement();
	    pm.initList(session);
	    ArrayList<Product> list = pm.getProducts();
	    for(Product p: list){
   %>
       	<script>
       	    var name = '<%=p.getName()%>';
       	    var Id = <%=p.getProductId()%>;
       	    var price = <%=p.getPrice()%>
       	    $('#items').append(new Option(name,Id));
       	    (CALC_TOOLS.ITEMS).push({Id:Id,name:name,price:price});
       	</script>
    <%
    	}
	    session.setAttribute("PRODUCTS", list);
    %>
     
<script>
   //CALC_TOOLS.doFetchItems();
   $('#plus').click(function(){CALC_TOOLS.doIncrementQuantity();});
   $('#minus').click(function(){CALC_TOOLS.doDecrementQuantity();});
   $('#addtocart').click(function(){CALC_TOOLS.doAddItemToCart();});
   $('#logindb').click(function(){parent.location.href='dashboard.jsp';});
</script>
</body>
</html>