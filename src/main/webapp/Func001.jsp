<html>
<script>
	// Literals and properties
	var bird = {
		name : "Bill",
		age : 3,
		move : function() {
			var _name = this.name;
			console.log(_name + ' starts flying...');
		}
	}

	bird.move();

	// function
	function Dog() {

	}

	Dog.prototype = {
		name : "Steven",
		age : 5,
		move : function() {
			var _name = this.name;
			console.log(_name + ' starts running...');
		}
	}

	var dog = new Dog();
	dog.move();
</script>
<body>
	<a href="index.jsp">Return Index</a>
</body>
</html>
