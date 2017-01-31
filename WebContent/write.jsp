<%@ page language="java" contentType="text/html; charset=EUC-KR"

    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title></title>

	<script>

	function formCheck() { 

		var title = document.forms[0].title;       

		var writer = document.forms[0].writer;

		var regdate = document.forms[0].regdate;

		var content = document.forms[0].content; 



		if (title.value == null || title.value == ""){                                   

			alert('insert title.');                                  

			document.forms[0].title.focus();                          

			return false;                                                     

		}

		

		if (writer.value == null ||  writer.value  == ""){           

			alert('insert writer');  

			document.forms[0].writer.focus();                       

			return false;                

		}else if(writer.value.match(/^(\w+)@(\w+)[.](\w+)$/ig) == null){

			alert('wrong fomat. please E-mail format');  

			document.forms[0].writer.focus();                       

			return false;  

		}

		

		if (content.value == null || content.value == ""){                                   

			alert('insert content.');                                  

			document.forms[0].content.focus();                          

			return false;                                                     

		}

		/*

		if (regdate.value == null || regdate.value == "" ){                             

			alert('insert date');    

			document.forms[0].regdate.focus();                       

			return false;             

		}else if(regdate.value.match(/^\d\d\d\d\d\d+$/ig)   == null){

			alert('wrong format. please insert Number(6)');  

			document.forms[0].regdate.focus();                       

			return false;  

		}

		*/

	}

	</script>

</head>

<body>

	<form action="insert.do" method="post" enctype="multipart/form-data" onsubmit="return formCheck();">

		<table style="width: 580px;">							

			<caption>글쓰기</caption>						

			<tr>									

				<th>작성자</th>						

				<td><input type="text" name="writer" size="20" /></td>

			</tr>

			<tr>

				<th>제목</th>

				<td><input type="text" name="title" size="60" /></td>

			</tr>

			<tr>

				<th height="300px">내용</th>

				<td><textarea rows="18" cols="60" name="content"></textarea></td>

			</tr>

			<tr>

				<th>첨부파일</th>

				<td><input type="file" name="file"></td>

			</tr>

		</table>

		<input type="submit" value="글쓰기" style="float: right;"/>

	</form> 



</body> 

</html>   


