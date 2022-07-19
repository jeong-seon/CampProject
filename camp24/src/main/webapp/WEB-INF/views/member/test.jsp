<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="/camp24/test/test.cmp" id="frm" name="frm">
		<div>
			<label for="id">id : </label>
			<input type="text" name="id" required>
		</div>
		<div>
			<input type="checkbox" name="ck"> jennie
		</div>
		<div>
			<input type="checkbox" name="ck"> lisa
		</div>
		<div>
			<input type="checkbox" name="ck"> rose
		</div>
		<div>
			<input type="checkbox" name="ck"> jisoo
		</div>
		
		<input type="submit" value="submit">
	</form>
</body>
</html>