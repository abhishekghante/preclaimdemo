package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.CaseDetailList;
import com.preclaim.models.CaseDetails;
import com.preclaim.models.UserDetails;

public interface CaseDao {
	
	String addBulkUpload(String filename);
	String addcase(CaseDetails casedetail);
	List<CaseDetailList> getCaseDetailList(String caseSubStatus);
	String deleteCase(int caseId);
	String updateCaseSubStatus(int caseid, String caseSubStatus);
	CaseDetails getCaseDetail(int caseID);
	String updateCaseDetails(CaseDetails case_details);
	
	List<String> getActiveZone(String role_name);
	List<String> getActiveState(String role_name, String zone);
	List<String> getActiveCity(String role_name, String zone, String state);
	List<UserDetails> getActiveUser(String role_name, String zone, String state, String city);

}
