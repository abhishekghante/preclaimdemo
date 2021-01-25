package com.preclaim.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.preclaim.models.ScreenDetails;
import com.preclaim.models.UserDetails;

@Controller
@RequestMapping(value = "/regionalManager")
public class RegionalManagerController {

	@RequestMapping(value = "/pending", method = RequestMethod.GET)
    public String pending_message(HttpSession session) {
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../regionalManager/pending_case.jsp");
    	details.setScreen_title("Pending Cases Lists");
    	details.setMain_menu("Regional Manager");
    	details.setSub_menu1("RM Pending Cases");
    	session.setAttribute("ScreenDetails", details);
    	return "common/templatecontent";
    }
  
    @RequestMapping(value = "/assigned", method = RequestMethod.GET)
    public String active_message(HttpSession session) {
    	UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../regionalManager/assigned_case.jsp");
    	details.setScreen_title("Assigned Cases Lists");
    	details.setMain_menu("Regional Manager");
    	details.setSub_menu1("RM Assigned Cases");
    	session.setAttribute("ScreenDetails", details);
    	return "common/templatecontent";
    }
}
