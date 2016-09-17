<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
    Document   : index
    Author     : your name
--%>

<sql:query var="comp3732_departments" dataSource="jdbc/generico">
    SELECT dept_id, deptName FROM comp3732_departments;
</sql:query>

<sql:query var="comp3732_employees_mega" dataSource="jdbc/megacorp">
    SELECT dept_id, id_name FROM comp3732_departments_mega; 
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <title>Welcome to Generico (and the previous Megacorp)</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("button").click(function () {
                    $(Department).toggle();
                    $(employeename).toggle();
                });
            });
        </script>

    </head>

    <body>
        <img class="centeredImage" alt="Logo"  src="images/Generico.jpg" />
        <h1>Welcome to Payroll Enquiry</h1>
        <div id="Department" style="display:none;">

            <button>To Search by Employee name Click here</button>
            <h1>Display Employees in Generico</h1>
            <p>
            <form action="response.jsp">
                <strong>Select a Department:</strong>
                <select name="dept_id">
                    <c:forEach var="row" items="${comp3732_departments.rows}">
                        <option value="${row.dept_id}">${row.deptName}</option>
                    </c:forEach>
                    <c:forEach var="row" items="${comp3732_employees_mega.rows}">
                        <option value="${row.dept_id}">${row.id_name}</option>
                    </c:forEach>
                    <input type="submit" value="submit" name="submit" />
            </form>
        </p>
    </div>
    <div id="employeename" >
        <button>To Search by Department name Click here</button>
        <h1>Display Employees in chosen Department</h1>
        <p>
        <form action="response1.jsp">
            <strong>Select a Department:</strong>
            <select name="dept_id">
                <c:forEach var="row" items="${comp3732_departments.rows}">
                    <option value="${row.dept_id}">${row.deptName}</option>
                </c:forEach>
                <c:forEach var="row" items="${comp3732_employees_mega.rows}">
                    <option value="${row.dept_id}">${row.id_name}</option>
                </c:forEach>
                <input type="submit" value="submit" name="submit" />
        </form>
    </p>

    <br>
</div>       
</body>
</html>
