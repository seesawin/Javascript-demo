<html>
<script>
	(function() {
		function Animal(name) {
			var _this = {};
			_this._name = name;
			_this.move = function() {
				console.log('Start moving...');
			};
			return _this;
		}

		window.Animal = Animal;
	}());

	function Cat(name) {
		var _this = Animal(name);
		_this.move = function() {
			console.log(_this._name + ' starts moving...');
		};
		return _this;
	}

	var cat = new Cat("Bluce");
	cat.move();
</script>
<body>
	<a href="index.jsp">Return Index</a>
</body>
</html>
