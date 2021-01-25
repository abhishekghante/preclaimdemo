package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.CaseDetailList;
import com.preclaim.models.CaseDetails;

public interface CaseDao {
	
	String addBulkUpload(String filename);
	String addcase(CaseDetails casedetail);
	List<CaseDetailList> getCaseDetailList(String caseSubStatus);
	String deleteCase(int caseId);
	String updateCaseSubStatus(int caseid, String caseSubStatus);
	CaseDetails getCaseDetail(int caseID);
	public String updateCaseDetails(CaseDetails case_details);

}
