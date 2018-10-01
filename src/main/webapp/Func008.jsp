<html>
<script>
	function Animal() {
		this.name;
		this.age;
		this.move = function() {
			console.log(this.name + ' starts moving...');
		}
	}
	
	console.log('----------------------------------------------------------------');

	Animal.prototype = {
		setName : function(name) {
			this.name = name;
		},
		setAge : function(age) {
			this.age = age;
		},
		setMove : function(action) {
			this.move = function() {
				console.log(this.name + ' starts ' + action + '...');
			}
		}
	}

	var a = new Animal();
	a.setName('Joe');
	a.setAge(8);
	a.setMove('running');
	console.log(a);
	a.move();

	console.log('----------------------------------------------------------------');
	
	Animal.prototype = {
		setName : function(name) {
			this.name = name;
			return this;
		},
		setAge : function(age) {
			this.age = age;
			return this;
		},
		setMove : function(action) {
			this.move = function() {
				console.log(this.name + ' starts ' + action + '...');
			}
			return this;
		}
	}
	
	var b = new Animal();
	b.setName('Ben').setAge(13).setMove('sleeping');
	console.log(b);
	b.move();
</script>
<body>
	<a href="index.jsp">Return Index</a>
</body>
</html>
