<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

</head>

<body>
<c:forEach items="c" varStatus="${sessionScope.all}">
    ${c.id}========${c.name}
</c:forEach>
</body>
</html>
