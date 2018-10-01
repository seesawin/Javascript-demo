<html>
<script>
	function test1(num) {
		// create a copy num
		var num = num + 100;
		return num;
	}
	
	var num = 1;
	console.log(test1(num));
	console.log(num);
	
	console.log('----------------------------------------------------------------');
	
	function test2(obj) {
		// point to the same objùÄ
		obj.name = 'Alec';
		console.log('inner : ', obj);
	}
	
	var obj = {
		name:'Frank'	
	};
	test2(obj);
	console.log('outter : ', obj);
</script>
<body>
	<a href="index.jsp">Return Index</a>
</body>
</html>
