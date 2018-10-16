<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Download Basic</title>
<script src="js/basic.js"></script>
</head>

<body>
	<a href="index.jsp">Return Index</a>
	<br> Download
	<hr>
	<input type="text" id="inputName">
	<button onclick="doExport();">download</button>

	<form id="exportForm" method="post" action="dl2?action=export"
		onSubmit="return false;">
		<input type="hidden" id="fileName" name="fileName" />
	</form>

	<script>
		function doExport() {
			var input = document.getElementById('inputName').value;
			document.getElementById('fileName').value = input;
			
			var xhr = createXHR2();
			xhr.open('GET', '/Javascript-demo/dl2?action=generate&fileName=' + input, true);
			xhr.send(); // urlencoded
			// 超时设置
// 			xhr.timeout = 100;
// 			xhr.ontimeout = function() {
// 				console.log('timeout!');
// 			}
			// 仅xhr level 2 支持
// 			xhr.onload = function() {
// 				if (xhr.status == 200)
// 					console.log('load, %s', xhr.responseText);
// 			}
			// 传统方式
			xhr.onreadystatechange = function(e) {
				if (xhr.readyState === 4 && xhr.status == 200) {
					console.log(xhr.responseText);
					console.log(xhr.getAllResponseHeaders());
					console.log(xhr.getResponseHeader("Content-Type"));
					console.log(xhr.status);
					console.log(xhr.statusText);
					console.log( 'onreadystatechange: readyState:%d, status:%d, responseText:%s', xhr.readyState, xhr.status, xhr.responseText);

					handleResult(xhr.responseText);
				}
			}
		}
		
		function handleResult(ret) {
			ret = JSON.parse(ret);
			if(ret.ERR_CDE == '00') {
				console.log('export excel...');
				document.getElementById('exportForm').submit();
			} else {
				alert(ret.ERR_MSG);
			}
		}
	</script>
</body>

</html>