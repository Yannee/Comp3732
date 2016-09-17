<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%-- 
    Document   : response
    Author     : your name
--%>

<sql:query var="comp3732_employees" dataSource="jdbc/generico">
    SELECT * FROM comp3732_departments, comp3732_employees 
    WHERE comp3732_employees.emp_id = comp3732_departments.emp_idfk 
    AND comp3732_departments.dept_id = ? <sql:param value="${param.dept_id}"/>
</sql:query>
<sql:query var="comp3732_employees_mega" dataSource="jdbc/megacorp">
 SELECT * FROM comp3732_departments_mega, comp3732_employees_mega 
    WHERE comp3732_employees_mega.dept_id = comp3732_departments_mega.manager 
    AND comp3732_departments_mega.dept_id = ? <sql:param value="${param.dept_id}"/>
</sql:query>
<c:set var="comp3732_employeesDetails" value="${comp3732_employees.rows[0]}"/>
<c:set var="comp3732_employeesMegaDetails" value="${comp3732_employees_mega.rows[0]}"/>
<c:set var="resultSet"  value="${comp3732_employees}"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Employee Details</title></head>
    <body>
        <img class="centeredImage" alt="Logo"  src="images/Generico.jpg" />
        
        <table border="1" cellpadding="5">
            
        <caption><h2>List of users in Department</h2></caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Profession</th>
            </tr>
            <c:forEach var="user" items="${comp3732_employees.rows}">
                <tr>
                    <td><c:out value="${user.firstname}" /></td>
                    <td><c:out value="${user.lastname}" /></td>
                    <td><c:out value="${user.email}" /></td>
                    <td><c:out value="${user.deptname}" /></td>
                </tr>
            </c:forEach>
        </table>
         
        
    </body>
</html>