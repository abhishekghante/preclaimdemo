package com.preclaim.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.preclaim.dao.AgencySupervisorDao;
import com.preclaim.dao.IntimationTypeDao;
import com.preclaim.dao.InvestigationTypeDao;
import com.preclaim.models.ScreenDetails;
import com.preclaim.models.UserDetails;

@Controller
@RequestMapping(value = "/supervisor")
public class AgencySupervisorController {

	@Autowired
	AgencySupervisorDao supervisorDao;
	
	@Autowired
	InvestigationTypeDao investigationDao;
	
	@Autowired
	IntimationTypeDao intimationTypeDao;
	
	@RequestMapping(value = "/pending", method = RequestMethod.GET)
    public String pending_message(HttpSession session) {
		UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
		session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../supervisor/pending_case.jsp");
    	details.setScreen_title("Pending Cases Lists");
    	details.setMain_menu("Agency Supervisor");
    	details.setSub_menu1("AS Pending Cases");
    	session.setAttribute("ScreenDetails", details);
    	
    	session.setAttribute("pendingCaseList", supervisorDao.getPendingCaseList());
    	session.setAttribute("investigation_list", investigationDao.getActiveInvestigationList());
    	session.setAttribute("intimation_list", intimationTypeDao.getActiveIntimationType());
    	
    	return "common/templatecontent";
    }
  
    @RequestMapping(value = "/assigned", method = RequestMethod.GET)
    public String active_message(HttpSession session) {
    	UserDetails user = (UserDetails) session.getAttribute("User_Login");
		if(user == null)
			return "common/login";
    	session.removeAttribute("ScreenDetails");
    	ScreenDetails details=new ScreenDetails();
    	details.setScreen_name("../supervisor/assigned_case.jsp");
    	details.setScreen_title("Assigned Cases Lists");
    	details.setMain_menu("Agency Supervisor");
    	details.setSub_menu1("AS Assigned Cases");
    	session.setAttribute("ScreenDetails", details);
    	
    	session.setAttribute("assignCaseDetailList", supervisorDao.getAssignedCaseList());
    	session.setAttribute("investigation_list", investigationDao.getActiveInvestigationList());
    	session.setAttribute("intimation_list", intimationTypeDao.getActiveIntimationType());
    	
    	return "common/templatecontent";
    }
    
    @RequestMapping(value = "/getActiveZone",method = RequestMethod.POST)
    public @ResponseBody List<String> getActiveZone(HttpServletRequest request,HttpSession session) 
    {
		return supervisorDao.getActiveZone(request.getParameter("role_name"));
    }
    
    @RequestMapping(value = "/getActiveState",method = RequestMethod.POST)
    public @ResponseBody List<String> getActiveState(HttpServletRequest request,HttpSession session) 
    {
		return supervisorDao.getActiveState(request.getParameter("role_name"), request.getParameter("zone"));
    }
    
    @RequestMapping(value = "/getActiveCity",method = RequestMethod.POST)
    public @ResponseBody List<String> getActiveCity(HttpServletRequest request,HttpSession session) 
    {
		return supervisorDao.getActiveCity(request.getParameter("role_name"), request.getParameter("zone"),
				request.getParameter("state"));
    }
    
    @RequestMapping(value = "/getActiveUser",method = RequestMethod.POST)
    public @ResponseBody List<UserDetails> getActiveUser(HttpServletRequest request,HttpSession session) 
    {
		return supervisorDao.getActiveUser(request.getParameter("role_name"), request.getParameter("zone"),
				request.getParameter("state"), request.getParameter("city"));
    }
}
