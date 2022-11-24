<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3>Add Theatre</h3>
<form action="addTheatre">
Enter Theatre name: <input type="text" name="theatreName">
<br>
Enter Theatre city: <input type="text" name="theatreCity">
<input type="submit" value="theatre">
</form>
<br>
<br>
<h3>Add Movie</h3>
<form action="addMovie" method="post" enctype="multipart/form-data">
Enter Movie name: <input type="text" name="movieName">
<br>
Upload Movie Image:<input type="file" name="multipartFile" > 
<br>
Enter Movie Language: <input type="text" name="language">
<br>
Enter Movie Description: <input type="text" name="description">
<br>
Enter Movie Rating: <input type="text" name="rating">
<br>
Enter Movie Time Duration: <input type="text" name="timeDuration">
<br>
Enter Movie Genre: <input type="text" name="genre">
<br>
Enter Movie ReleaseDate: <input type="text" name="releaseDate">
<br>
<input type="submit" value="AddMovie">
</form>
<br>
<br>
<h3>Add Show</h3>
<form action="addShow">
Enter City: <input type="text" name="theatreCity">
<br>
Enter Theatre Name: <input type="text" name="theatreName">
<br>
Enter Show Time: <input type="text" name="shTime">
<br>
Enter Movie Name: <input type="text" name="movieName">
<br>
Enter Cost of Show: <input type="text" name="costOfTicket">
<br>
<input type="submit" value="AddShow">
</form>
<br>
<br>

<h3>Movie List</h3>
<form action="">
<input type="submit" value="MovieList">
</form>
<h3>Theatre List</h3>
<form action="">
<input type="submit" value="TheatreList">
</form>
<h3>Show List</h3>
<form action="">
<input type="submit" value="ShowList">
</form>
</body>
</html>