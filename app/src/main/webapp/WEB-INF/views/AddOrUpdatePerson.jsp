<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored="false" %>

<html>
	<head>
		<title>Add Person</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="/resources/jqueryscript.js"></script>
		<link rel="stylesheet" type="text/css" href="/resources/style.css"/>
		<link rel="stylesheet" type="text/css" href="/resources/addupdateperson.css"/>	
	</head>

	<body>
		<h3 align="center">${requestType}</h3>
		<hr/>

		<div class="tableForm" align="center">
			<c:import url="LanguageSelect.jsp"/>
			<form:form method="POST" commandName="person">
				<form:hidden path="id"/>

				<table border="0">
					<tbody>

						<%-- =============================================================================== --%>

						<th colspan="2"><spring:message code="header.label.name"/></th>
						<tr>
							<td><spring:message code="label.name.firstName"/></td>
							<td><form:input path="name.firstName"/> <br>
								<form:errors path="name.firstName" cssClass="error"/></td>
						</tr>
						<tr>
							<td><spring:message code="label.name.middleName"/></td>
							<td><form:input path="name.middleName"/> <br>
								<form:errors path="name.middleName" cssClass="error"/></td>
						</tr>
						<tr>
							<td><spring:message code="label.name.lastName"/></td>
							<td><form:input path="name.lastName"/> <br>
								<form:errors path="name.lastName" cssClass="error"/></td>
						</tr>
						<tr>
							<td><spring:message code="label.name.suffix"/></td>
							<td><form:input path="name.suffix"/></td>
						</tr>
						<tr>
							<td><spring:message code="label.name.title"/></td>
							<td><form:input path="name.title"/></td>
						</tr>

						<%-- =============================================================================== --%>

						<th colspan="2"><spring:message code="header.label.address"/></th>
						<tr>
							<td><spring:message code="label.address.streetNumber"/></td>
							<td><form:input path="address.streetNumber"/> <br>
								<form:errors path="address.streetNumber" cssClass="error"/></td>
						</tr>
						<tr>
							<td><spring:message code="label.address.barangay"/></td>
							<td><form:input path="address.barangay"/> <br>
								<form:errors path="address.barangay" cssClass="error"/></td>
						</tr>
						<tr>
							<td><spring:message code="label.address.municipality"/></td>
							<td><form:input path="address.municipality"/> <br>
								<form:errors path="address.municipality" cssClass="error"/></td>
						</tr>
						<tr>
							<td><spring:message code="label.address.zipcode"/></td>
							<td><form:input path="address.zipcode"/> <br>
								<form:errors path="address.zipcode" cssClass="error"/></td>
						</tr>

						<%-- =============================================================================== --%>

						<th colspan="2"><spring:message code="header.label.birthDate"/></th>
						<tr>
							<td><spring:message code="label.birthDate"/></td>
							<td><form:input path="birthDate"/> <br>
								<form:errors path="birthDate" cssClass="error"/></td>
						</tr>

						<%-- =============================================================================== --%>

						<th colspan="2"><spring:message code="header.label.dateHired"/></th>
						<tr>
							<td><spring:message code="label.dateHired"/></td>
							<td><form:input path="dateHired"/> <br>
								<form:errors path="dateHired" cssClass="error"/></td>
						</tr>

						<%-- =============================================================================== --%>

						<th colspan="2"><spring:message code="header.label.employment"/></th>
						<tr>
							<td><spring:message code="label.employment"/></td>
							<td><form:radiobutton path="currentlyEmployed" value="true"/>YES
								<form:radiobutton path="currentlyEmployed" value="false"/>NO</td>
						</tr>

						<%-- =============================================================================== --%>

						<th colspan="2"><spring:message code="header.label.gwa"/></th>
						<tr>
							<td><spring:message code="label.gwa"/></td>
							<td><form:input path="gwa"/> <br>
								<form:errors path="gwa" cssClass="error"/></td>
						</tr>

						<%-- =============================================================================== --%>

						<th colspan="2"><spring:message code="header.label.roles"/></th>
						<tr>
							<td><spring:message code="label.roles"/></td>

							<td>
								<c:forEach items="${existingRoles}" var="role">
									<c:set var="checked" value="${person.roles.contains(role) ? 'checked' : ''}"/>
									<input type="checkbox" name="rolesParam" value="${role.id}" ${checked}/>
									${role.roleName} <br>
								</c:forEach>
							</td>

						</tr>

						<%-- =============================================================================== --%>

						<tbody id="contactsSection">
							<th colspan="2">
								<spring:message code="header.label.contacts"/> <br>
								<input type="button" value="Add Cellphone" id="add-cellphone-button"/>
								<input type="button" value="Add Landline" id="add-landline-button"/>
								<input type="button" value="Add Email" id="add-email-button"/> <br>
								<form:errors path="contacts" cssClass="error"/>
							</th>
							<c:forEach items="${person.contacts}" var="contact">
								<tr>
									<td>${contact.type}</td>
									<td>
										<input type="text" name="${contact.type}" value="${contact.detail}"/>
										<input type="button" id="remove-button" value="X"/>
										<form:errors path="contacts" cssClass="error"/>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						<th colspan="2"><input type="submit" value="${submitLabel}"/></th>
					</tbody>
				</table>
			</form:form>
			<hr/>
            <a href="/managePersons.htm">Manage Persons</a> <br>
            <a href="/manageRoles.htm">Manage Roles</a> <br>
            <a href = "/fileUpload.htm">Upload a File</a> <br>
            <a href="/index.jsp">HOME</a>
		</div>
	</body>

</html>
