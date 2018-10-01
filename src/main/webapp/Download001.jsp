<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Download Basic</title>
</head>

<body>
	<a href="index.jsp">Return Index</a>
	<br> Download
	<hr>
	<input type="text" id="inputName">
	<button onclick="doDownloadFile();">download</button>

	<form id="exportForm" method="post" action="dl1" target="exportFrame"
		onSubmit="return false;">
		<input type="hidden" id="fileName" name="fileName"/>
	</form>
	<iframe id="exportFrame" name="exportFrame" src="" frameborder="0"
		marginwidth="0" marginheight="0" style="display: none;"></iframe>

	<script>
		function doDownloadFile() {
			document.getElementById('fileName').value = document.getElementById('inputName').value;
			document.getElementById('exportForm').submit();
		}
	</script>
</body>

</html>