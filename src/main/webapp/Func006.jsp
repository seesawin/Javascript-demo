<html>
<script>
	this.m = 100;
	function test() {
		var m = 50;
		console.log(m);
		console.log(this.m);
		console.log(window.m);
	}
	window.test();
	
	console.log('----------------------------------------------------------------');
	
	this.m = 200;
	var obj1 = {
		m : 100,
		test : function() {
			var m = 150;
			console.log(m);
			console.log(this.m);
			console.log(window.m);
		}
	}
	obj1.test();
	
	console.log('----------------------------------------------------------------');
	
	this.m = 300;
	var obj2 = {
		m : 100,
		test : function() {
			return function() {
				var m = 250;
				console.log(m);
				console.log(this.m);
				console.log(window.m);
			}
		}
	}
	obj2.test()();
// 	var o = obj2.test();
// 	window.obj2.test()();

</script>
<body>
	<a href="index.jsp">Return Index</a>
</body>
</html>
