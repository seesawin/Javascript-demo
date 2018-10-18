<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Download Basic</title>
<script src="js/basic.js"></script>
<style>
.myloading {
	position: fixed;
	z-index: 1000;
	top: 0;
	left: 0;
	height: 100px;
	width: 100px;
	background: rgba(255, 255, 255, .8)
		url('http://sampsonresume.com/labs/pIkfp.gif') 50% 50% no-repeat;
}

.divBar {
	position: fixed;
	z-index: 1000;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
}
</style>
</head>

<body>
	<div id="loadingDiv" class="divBar" style="display:none">
		<img id="loading" class="" />
	</div>
    <br><br><br><br>
    
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
		function wait(ms){
			var start = new Date().getTime();
			var end = start;
			while(end < start + ms) {
				end = new Date().getTime();
			}
		}
		
		function doExport() {
			console.log('open loading...');
			document.getElementById("loading").className = "myloading";
			document.getElementById("loadingDiv").style.display = "block";
			
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
			
			console.log('close loading...');
			document.getElementById("loading").className = "";
			document.getElementById("loadingDiv").style.display = "none";
		}
	</script>
</body>

</html>