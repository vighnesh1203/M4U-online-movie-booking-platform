<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table>  
    <tr>  
        
        <th>Movie Id </th> 
        <th>Movie Name </th>
        <th>Movie Genre </th>
         
        
        <th>Update/Delete </th>
    </tr>  
    <c:forEach var="a" items="${list}"> 
        <tr>  
            <td> <input type="text" value="${a.movieId}"></td>
             <td> <input type="text" value="${a.movieName}"> </td>
            <td> <input type="text" value="${a.genre}"> </td>   
             <form action="updateMovieMapping">  
            <td> <input type="text"  style="display:none" value="${a.movieId}" name="movieId"></td>
            <td> <input type="submit" value="Update"> </td> 
            </form>
            <form action="deleteMovieMapping">  
            <td> <input type="text" style="display:none" value="${a.movieId}" name="movieId"> </td>
            <td> <input type="submit" value="Delete"> </td> 
            </form>
        </tr>  
   </c:forEach>
</table> 
</body>
</html>