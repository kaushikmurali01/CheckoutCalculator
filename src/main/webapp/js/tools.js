
var CALC_TOOLS ={
	ITEMS: new Array(),
	SELECTED_ITEMS : new Array(),
	doFetchItems : function(){
		(this.ITEMS).forEach(n => {
			$('#items').append(new Option(n.name,n.Id));
		});
	},
	doIncrementQuantity : function(){
		var e= $('#quantity');
		var prevQ = parseInt(e.val());
		e.val(prevQ+1);
	},
	doDecrementQuantity : function(){
		var e= $('#quantity');
		var prevQ = parseInt(e.val());
		e.val(((prevQ-1) == 0) ? 1 : (prevQ-1));
	},
	doAddItemToCart: function(){
	    var errLabel = $('#err-msg');
		var _itemId = $('#items').val();
		var _quantity = $('#quantity').val();
		var _discount = $.trim($('#discount').val());
		if(_itemId > 0){
			if(_discount.length > 0 && !isNaN(_discount)){
				 errLabel.html('');
				 var myItem = this.doFetchSelectedItem(_itemId);
				 if(myItem != null){
					 this.SELECTED_ITEMS.push({Id:myItem.Id,name:myItem.name,quantity:_quantity,price:myItem.price,discount:_discount});
					 this.doListSelectedItems();
					 
				 }
			}else{errLabel.html('Invalid discount value');}
		}else{errLabel.html('Please select an Item');}
	},
	doFetchSelectedItem : function(itemId){
	    var myItem = null;
		$.each((this.ITEMS),function(i,n){
			if(n.Id == itemId){
			   myItem = n;
			   return false;
			}
		});
		return myItem;
	},
	doListSelectedItems : function(){
		var str='';
		var _total=0.0;
		(this.SELECTED_ITEMS).forEach(n=>{
		    var prId = n.Id;
		   	str +='<div class="selected-item-row">';
			str +='<div>'+n.name+'</div>';
			str +='<div>'+n.quantity+'</div>';
			str +='<div>'+n.price+'</div>';
			str +='<div>'+n.discount+'</div>';
			if(n.discount > 0.0){
			    var t_ = (n.price * n.quantity);
			    var d_= n.discount / 100;
			    var to_= t_ - (t_ * d_);
			    str +='<div>'+parseFloat(to_).toFixed(2)+'</div>';
			    _total += to_
			}else{str +='<div>'+parseFloat(n.price * n.quantity).toFixed(2)+'</div>';  _total += (n.price * n.quantity);}
			str +='<div><a href=javascript:CALC_TOOLS.doDeleteItemFromCart('+prId+')><img src="images/delete-24.png"></a></div>';
			str +='</div>';
		});
		
		str +='<p><b>Total: '+parseFloat(_total).toFixed(2)+'</b></p>';
		$('#selected_items_list').html(str);
		$('#itemscount').html(this.SELECTED_ITEMS.length);
	},
	doDeleteItemFromCart : function(Id){
	  var arr = new Array();
	  (this.SELECTED_ITEMS).forEach(n=>{
	  	  if(n.Id != Id){arr.push(n);}
	  });
	  this.SELECTED_ITEMS = new Array();
	  this.SELECTED_ITEMS = arr;
	  this.doListSelectedItems();
	}
};