<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored="false" %>

<html>
    <head>
        <title>Manage Persons</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="/resources/jqueryscript.js"></script>
		<link rel="stylesheet" type="text/css" href="/resources/style.css"/>
    </head>

    <body>
        <h3>Manage Persons</h3>
        <hr/>
        <c:import url="LanguageSelect.jsp"/>

        <form action="/managePersons.htm" method="GET">
            <input type="text" name="lastNameFilter" placeholder="Filter by last name" value="${param.lastNameFilter}"/>
            <input type="submit" value="FILTER">
            <br/>

                <table border="1" width="100%">
                    <tr bgcolor="#77929b">
                        <th>ID</th>
                        <th><spring:message code="label.name.firstName"/></th>
                        <th><spring:message code="label.name.middleName"/></th>
                        <th><spring:message code="label.name.lastName"/></th>
                        <th><spring:message code="label.dateHired"/></th>
                        <th><spring:message code="label.gwa"/></th>
                        <th><spring:message code="label.roles"/></th>
                        <th><spring:message code="label.update"/></th>
                        <th><spring:message code="label.delete"/></th>
                    </tr>

                    <c:forEach items="${personList}" var="person">
                        <tr>
                            <td>
                                <a href="/fullPersonDetails.htm?personId=${person.id}">${person.id}</a>
                            </td>
                            <td>${person.name.firstName}</td>
                            <td>${person.name.middleName}</td>
                            <td>${person.name.lastName}</td>
                            <td>${person.dateHired}</td>
                            <td>${person.gwa}</td>
                            <td>${person.roles}</td>
                            <td align="center">
                                <a href="/addOrUpdatePerson.htm?personId=${person.id}"><spring:message code="label.update"/></a>
                            </td>
                            <td align="center">
                                <a href="/deletePerson.htm?personId=${person.id}"><spring:message code="label.delete"/></a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <br>

                Sort by:
                <select name="orderBy">
                    <option value="id" ${param.orderBy == "id" ? "selected" : ""}>ID</option>
                    <option value="name.lastName" ${param.orderBy == "name.lastName" ? "selected" : ""}>Last Name</option>
                    <option value="dateHired" ${param.orderBy == "dateHired" ? "selected" : ""}>Date Hired</option>
                    <option value="gwa" ${param.orderBy == "gwa" ? "selected" : ""}>GWA</option>
                </select>
                Order type:
                <select name="orderType">
                    <option value="asc" ${param.orderType == "asc" ? "selected" : ""}>Ascending</option>
                    <option value="desc" ${param.orderType == "desc" ? "selected" : ""}>Descending</option>
                </select>
                <input type="submit" value="SORT"/>
            </form>
            <hr/>
            <a href="/addOrUpdatePerson.htm">Add Person</a> <br>
            <a href="/manageRoles.htm">Manage Roles</a> <br>
            <a href = "/fileUpload.htm">Upload a File</a> <br>
            <a href="/index.jsp">HOME</a>
        </body>
    </html>
