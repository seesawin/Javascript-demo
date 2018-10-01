<html>
<script>
	if(false){
// 		var i = 100;
	}

	function test1() {
		var j = 200;
		console.log('i : ' + i);

		function test2() {
			var k = 300;
			console.log('j : ' + j);
			window.k = k;
		}

		test2();
		window.j = j;
		window.k = k;
	}
	test1();
	console.log(i);
	console.log(j);
	console.log(k);
</script>
<body>
	<a href="index.jsp">Return Index</a>
</body>
</html>
