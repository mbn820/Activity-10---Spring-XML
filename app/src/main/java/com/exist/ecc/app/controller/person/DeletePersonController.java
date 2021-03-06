package com.exist.ecc.app.controller.person;

import com.exist.ecc.core.service.PersonService;
import com.exist.ecc.core.model.dto.PersonDto;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public class DeletePersonController extends AbstractController {
	private PersonService personService;

	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String personIdParam = request.getParameter("personId");
		personService.deletePerson( Integer.parseInt(personIdParam) );

		ModelAndView mav = new ModelAndView("redirect:/managePersons.htm");

		return mav;
	}
}
