<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>AJAX DEMO</title>
<style>
* {
	font-family: "Microsoft Yahei", serif;
	font-size: 14px;
}

h1 {
	font-size: 16px;
	font-weight: normal;
}

#container {
	text-align: center;
	margin-top: 100px;
}

#searchbox {
	display: inline-block;
	width: 400px;
	position: relative;
}

#hits {
	position: absolute;
	list-style: none;
	margin: 0;
	padding: 0;
	text-align: left;
	border: 1px solid gray;
	border-top: none;
	width: 398px;
}

#hits>li {
	padding: 5px 15px;
}

#hits>li:hover {
	background: lightblue;
	cursor: default;
}

#keyword {
	border: 1px solid gray;
	outline: none;
	padding: 10px 15px;
	margin: 0;
	width: 368px;
}

#searchbtn {
	padding: 8px 15px;
}
</style>
</head>

<body>
	<a href="index.jsp">Return Index</a>
	<br>
	<div id="container">
		<h1>Input the name of lesson</h1>

		<div>
			<div id="searchbox">
				<input type="text" id="keyword" />
				<ul id="hits" style="display: none;">
				</ul>
			</div>
			<button id="searchbtn">search</button>
		</div>
	</div>
	<script>
		// 注意：代码和样式不兼容低版本IE
		// 通过ajax获取命中提示内容
		document.getElementById('keyword').oninput = function() {
			var keyword = this.value;
			// 典型的ajax编程模板
			// 1. 创建XMLHttpReqeust对象
			var xhr = new XMLHttpRequest();
			// 2. open操作初始化请求信息
			xhr.open('GET', '/Javascript-demo/a2?keyword='
					+ encodeURIComponent(keyword), true);
			// 3. 监听事件处理响应结果
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					handleResult(xhr.responseText);
				}
			};
			// 4. send操作发出请求
			xhr.send();
		};
		// 处理响应结果

		function handleResult(ret) {
			ret = JSON.parse(ret);
			var domHits = document.getElementById('hits');
			if (ret.length) {
				var lis = [];
				for (var i = 0, len = ret.length; i < len; ++i) {
					lis.push('<li>' + ret[i] + '</li>');
				}
				domHits.innerHTML = lis.join('');
				domHits.style.display = 'block';
			} else {
				domHits.innerHTML = '';
				domHits.style.display = 'none';
			}
		}
		// 单击提示结果放入输入框
		document.getElementById('hits').onclick = function(event) {
			document.getElementById('keyword').value = event.target.innerHTML;
			this.style.display = 'none';
		}
	</script>
</body>

</html>