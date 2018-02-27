<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<body>
<h2>Spring MVC</h2>

<h3>Revenue Report</h3>

<table border="1px" cellpadding="8px">
<tr>
<td>Month</td><td>Revenue</td>
</tr>

<c:forEach items="${logs}" var="log">
<tr>
   <td><c:out value="${log.method}" /></td>
   <td><c:out value="${log.url}" /></td>
   <td><c:out value="${log.request}" /></td>
   <td><c:out value="${log.dateCreate}" /></td>
</tr>
</c:forEach>
</table>

</body>
</html>