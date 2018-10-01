<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Ajax Basic</title>
<script src="js/basic.js"></script>
</head>

<body>
	<a href="index.jsp">Return Index</a>
	<br>
	Ajax Basic Demo
	<hr>
	<button onclick="testCreateXhr();">Create XHR Object</button>

	<script>
		function testCreateXhr() {
			var xhr = createXHR2();
			xhr.open('POST', '/Javascript-demo/a1', true);
			xhr.setRequestHeader("Content-Type", "application/json");
			xhr.setRequestHeader('test', 'value');
			xhr.send(JSON.stringify({
				keyword : 'c',
				other : 'test'
			})); // urlencoded
			// 超时设置
			xhr.timeout = 100;
			xhr.ontimeout = function() {
				console.log('timeout!');
			}
			// 仅xhr level 2 支持
			xhr.onload = function() {
				if (xhr.status == 200)
					console.log('load, %s', xhr.responseText);
			}
			// 传统方式
			xhr.onreadystatechange = function(e) {
				if (xhr.readyState === 4 && xhr.status == 200) {

					console.log(xhr.responseText);

					// console.log(xhr.responseXML);
					console.log(xhr.getAllResponseHeaders());
					console.log(xhr.getResponseHeader("Content-Type"));
					console.log(xhr.status);
					console.log(xhr.statusText);
				}
				// readyState 5种状态
				// 0: 未初始化
				// 1： 连接建立、请求发出
				// 2: 服务器返回响应
				// 3: 交互（处理响应数据）
				// 4: 完成，数据可交付客户端使用 
				console.log( 'onreadystatechange: readyState:%d, status:%d, responseText:%s', xhr.readyState, xhr.status, xhr.responseText);
			}
		}
	</script>
</body>

</html>