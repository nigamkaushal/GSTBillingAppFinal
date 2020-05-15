<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Billing Page</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.9/angular-resource.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.9/angular.min.js"></script>
	<script>
	    var app=angular.module('billingPage',[]);
	    app.controller('myctrl',function($scope,$http){
	    	$scope.reload = function()
			{
			   location.reload(); 
			}
	    	$scope.products=[];
	        $scope.totalprice=0;
	    	$scope.refreshdata=function(){
	    	 	$http.get("/getAllProducts").then(function(response)
	    		{
	    			$scope.products=response.data;
	    		});
	    	 }
	    	 
	    	$scope.product = {
		        productForm: [{
		            product_code: 0,
		            product_name:"",
		            product_price:0,
		            product_gst:0
	        	}]
	      	};
	      	$scope.add = function(product){
        		$scope.product.productForm.push(product);
	      	},
	        $scope.total = function(){
		        var total = 0;
		        angular.forEach($scope.product.productForm,function(product){
		             if(product.product_code!=0 )
		            total += (product.product_price * product.quantity) + (product.product_price * product.product_gst /100 * product.quantity);
		        })
	        	return total;
	      	}
		    $scope.showTable = function () {
		    	$('#table').fadeIn()
		    }
	      	$scope.showTotal = function () {
	        	$('#total').fadeIn()
	     	} 
	    });
	</script>
</head>
<body ng-app="billingPage" ng-controller="myctrl">

	<h3>Search Products and Add to Cart</h3>
		<table class="table table-dark">
				<tr>
					<td><b>Product Code/Name : &nbsp;</b></td>
					<td><input type="text" name="product_code" ng-model="code" ng-focus="refreshdata()" /></td>
				</tr>
				
				<tr ng-repeat="product in products" ng-show="product.product_code==code || product.product_name==code">
					<td><input type="submit" value="Search By Code" ng-click="add(product);showTable();showTotal()" /></td>
					<td><input type="submit" value="Reset" ng-click="reload()" /></td>
				</tr>
		</table>
		<h3>Cart</h3>
		<table class="table table-bordered table-dark" id="table" border="1" style="display:none">
				<th>Product Code</th>
				<th>Product Name</th>
				<th>Product Price</th>
				<th>Product GST%</th>
				<th>Quantity</th>
				<th>Gross Total</th>
				<th>Total with GST</th>
			    <tr ng-repeat="product in product.productForm" ng-show="product.product_code!=0">
				    <td>{{product.product_code}}</td>
				    <td>{{product.product_name}}</td>
                    <td>{{product.product_price}}</td>
                    <td>{{product.product_gst}}</td>
					<td>
						<input type="number" min=1 name="qty" value="1" ng-model="product.quantity" ng-init="product.quantity=1" />
					</td>
					<td>{{ product.product_price * product.quantity | currency: '&#8377;'}}</td>
					<td>{{ (product.product_price * product.quantity)+(product.product_price * product.quantity * product.product_gst /100)  | currency: '&#8377;'}}</td>
			    </tr>
			    <tr id="total" style="display:none">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><b>Grand Total:</b></td>
                    <td>{{ total() | currency: '&#8377;'}}</td>
                </tr>
		</table>
		<a href="/productEntry"><button class="btn btn-primary"> Go to Product Entry Page</button></a> 
</body>
</html>