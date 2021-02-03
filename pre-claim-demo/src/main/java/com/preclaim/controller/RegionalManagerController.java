package com.preclaim.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.preclaim.dao.IntimationTypeDao;
import com.preclaim.dao.InvestigationTypeDao;
import com.preclaim.dao.LoginDAO;
import com.preclaim.dao.MailConfigDao;
import com.preclaim.dao.RegionalManagerDao;
import com.preclaim.dao.UserDAO;
import com.preclaim.models.MailConfig;
import com.preclaim.models.ScreenDetails;
import com.preclaim.models.UserDetails;

@Controller
@RequestMapping(value = "/regionalManager")
public class RegionalManagerController {

	@Autowired
	RegionalManagerDao regionalManagerDao;
	
	@Autowired
	InvestigationTypeDao investigationDao;
	
	@Autowired
	IntimationTypeDao intimationTypeDao;
	
	@Autowired
	UserDAO userDao;
	
	@Autowired
	LoginDAO loginDao;
	
	@Autowired
	MailConfigDao mailConfigDao;
	
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
    	
    	session.setAttribute("pendingCaseList", regionalManagerDao.getPendingCaseList(user.getZone()));
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
    	details.setScreen_name("../regionalManager/assigned_case.jsp");
    	details.setScreen_title("Assigned Cases Lists");
    	details.setMain_menu("Regional Manager");
    	details.setSub_menu1("RM Assigned Cases");
    	session.setAttribute("ScreenDetails", details);
    	
    	session.setAttribute("assignCaseDetailList", regionalManagerDao.getAssignedCaseList(user.getZone()));
    	session.setAttribute("investigation_list", investigationDao.getActiveInvestigationList());
    	session.setAttribute("intimation_list", intimationTypeDao.getActiveIntimationType());
    	
    	return "common/templatecontent";
    }
    
    @RequestMapping(value = "/getActiveZone",method = RequestMethod.POST)
    public @ResponseBody List<String> getActiveZone(HttpServletRequest request,HttpSession session) 
    {
		return regionalManagerDao.getActiveZone(request.getParameter("role_name"));
    }
    
    @RequestMapping(value = "/getActiveState",method = RequestMethod.POST)
    public @ResponseBody List<String> getActiveState(HttpServletRequest request,HttpSession session) 
    {
		return regionalManagerDao.getActiveState(request.getParameter("role_name"), request.getParameter("zone"));
    }
    
    @RequestMapping(value = "/getActiveCity",method = RequestMethod.POST)
    public @ResponseBody List<String> getActiveCity(HttpServletRequest request,HttpSession session) 
    {
		return regionalManagerDao.getActiveCity(request.getParameter("role_name"), request.getParameter("zone"),
				request.getParameter("state"));
    }
    
    @RequestMapping(value = "/getActiveUser",method = RequestMethod.POST)
    public @ResponseBody List<UserDetails> getActiveUser(HttpServletRequest request,HttpSession session) 
    {
		return regionalManagerDao.getActiveUser(request.getParameter("role_name"), request.getParameter("zone"),
				request.getParameter("state"), request.getParameter("city"));
    }

    @SuppressWarnings("null")
	@RequestMapping(value = "/assignToSupervisor",method = RequestMethod.POST)
    public @ResponseBody String assignToSupervisor(HttpServletRequest request,HttpSession session) 
    {
    	UserDetails user = (UserDetails) session.getAttribute("User_Login");
		
    	String[] paramValues = request.getParameterValues("caseList[]");
    	String supervisorName=request.getParameter("assigneeName");
		int caseLen = paramValues.length;
		String caseList = "";
		for (int i = 0; i < caseLen; i++)
			caseList += "'" + paramValues[i] + "',";                               
		caseList = caseList.substring(0, caseList.length() - 1);
		System.out.println(supervisorName);
		userDao.activity_log("CASE HISTORY","", "ASSIGN CASE", user.getUsername());
		String message = regionalManagerDao.assignToSupervisor(caseList, "AAS",supervisorName,user.getUsername());
		
		//Mail Config
		UserDetails assignee = loginDao.checkUser(supervisorName);
		MailConfig mail = mailConfigDao.getActiveConfig();
    	if(mail != null && !assignee.getUser_email().equals(""))
    	{	
	    	mail.setReceipent(assignee.getUser_email());
	    	mail.setSubject("Investigation Cases");
	        String messageBody = "Dear <Assignee>,\n New Cases has been added in claims portal. "
	        		+ "Kindly action it immediately\n\n\n"
	        		+ "Thanks & Regards,\n"
	        		+ "<CompanyName>\n"
	        		+ "<CompanyAddress>\n";
	        messageBody.replaceAll("<Assignee>", assignee.getFull_name());
	        messageBody.replaceAll("<CompanyName>", "Xangars Solutions Pvt Ltd");
	        messageBody.replaceAll("<CompanyAddress>", "");
	    	mail.setMessageBody(messageBody);
	    	mailConfigDao.sendMail(mail);
    	}
    	
		return message;
    }


}
