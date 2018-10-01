<html>
<script>
	(function() {
		function Animal(name) {
			this._name = name;
		}

		Animal.prototype = {
			move : function() {
				console.log('Start moving...');
			}
		}

		window.Animal = Animal;
	}());

	(function() {
		function Cat(name) {
			this._name = name;
		}

		// inherit
		Cat.prototype = new Animal();

		window.Cat = Cat;
	}());

	var cat = new Cat("Andy");
	cat.move();

	// override method
	Cat.prototype.move = function() {
		console.log(this._name + ' starts jumping...');
	};
	cat.move();
</script>
<body>
	<a href="index.jsp">Return Index</a>
</body>
</html>
