package com.preclaim.dao;

import java.util.List;

import com.preclaim.models.CaseDetailList;
import com.preclaim.models.CaseDetails;

public interface CaseDao {
	
	String addBulkUpload(String filename);
	String addcase(CaseDetails casedetail);
	List<CaseDetailList> getCaseDetailList(String status);
	String deleteCase(int caseId);

}
