package com.exist.ecc.app.roleservlets;

import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.IOException;
import com.exist.ecc.core.service.*;
import com.exist.ecc.core.service.RoleService;
import com.exist.ecc.core.model.*;
import java.sql.Date;
import java.util.*;

public class UpdateRolesServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch ( Exception e ) {
			response.getWriter().println( e.toString() );
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idToBeUpdated = Integer.parseInt( request.getParameter("idToBeUpdated") );
		String newRoleName = request.getParameter( "newRoleName" );

		Role updatedRole = new RoleService().getRole( idToBeUpdated );
		updatedRole.setId( idToBeUpdated );
		updatedRole.setRoleName( newRoleName );

		new RoleService().updateRole( updatedRole );

		response.sendRedirect("/UpdateRoles");
	}

	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String roleId = request.getParameter("roleId");

		if (roleId != null) {
			Role roleToBeUpdated = new RoleService().getRole( Integer.parseInt(roleId) );
			request.setAttribute( "roleToBeUpdated", roleToBeUpdated );
		}

		List<Role> existingRoles = new RoleService().getAllRoles();
		request.setAttribute( "existingRoles", existingRoles );


		RequestDispatcher rd = getServletContext().getRequestDispatcher("/role/UpdateRoleForm.jsp");

		rd.forward( request, response );
	}

}
