<html>
<script>
	function Animal(name) {
		this._name = name;
	}

	Animal.prototype = {
		move : function() {
			console.log('Start moving...');
		}
	}

	function Cat(name) {
		this._name = name;
	}

	// inherit
	Cat.prototype = new Animal();

	var cat = new Cat("Amy");
	cat.move();

	// override method
	Cat.prototype.move = function() {
		console.log(this._name + ' starts jumping...');
	};
	cat.move();

	// call super
	var superMove = Animal.prototype.move;
	Cat.prototype.move = function() {
		superMove.call(this);
		console.log(this._name + ' starts jumping...');
	};
	cat.move();
</script>
<body>
	<a href="index.jsp">Return Index</a>
</body>
</html>
