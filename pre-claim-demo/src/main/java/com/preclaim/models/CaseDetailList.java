package com.preclaim.models;

public class CaseDetailList {

	private int srNo;
	private long caseId;
	private String policyNumber;
	private String insuredName;
	private String claimantCity;
	private String claimantZone;
	private String claimantState;
	private int status;
	private int substatus;
	private String investigationCategory;
	private double sumAssured;
	
	public CaseDetailList() {
		
		srNo=0;
		caseId = 0;
		policyNumber = "";
		insuredName = "";
		claimantCity = "";
		claimantState = "";
		claimantZone = "";
		status = 0;
		substatus = 0;
		investigationCategory = "";
		sumAssured = 0;
		
	}

	
	public int getSrNo() {
		return srNo;
	}
	
	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}
	
	public long getCaseId() {
		return caseId;
	}

	public void setCaseId(long caseId) {
		this.caseId = caseId;
	}

	public String getPolicyNumber() {
		return policyNumber;
	}

	public void setPolicyNumber(String policyNumber) {
		this.policyNumber = policyNumber;
	}

	public String getInsuredName() {
		return insuredName;
	}

	public void setInsuredName(String insuredName) {
		this.insuredName = insuredName;
	}

	public String getClaimantCity() {
		return claimantCity;
	}

	public void setClaimantCity(String claimantCity) {
		this.claimantCity = claimantCity;
	}

	public String getClaimantZone() {
		return claimantZone;
	}

	public void setClaimantZone(String claimantZone) {
		this.claimantZone = claimantZone;
	}

	public String getClaimantState() {
		return claimantState;
	}

	public void setClaimantState(String claimantState) {
		this.claimantState = claimantState;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getSubstatus() {
		return substatus;
	}

	public void setSubstatus(int substatus) {
		this.substatus = substatus;
	}

	public String getInvestigationCategory() {
		return investigationCategory;
	}

	public void setInvestigationCategory(String investigationCategory) {
		this.investigationCategory = investigationCategory;
	}

	public double getSumAssured() {
		return sumAssured;
	}

	public void setSumAssured(double sumAssured) {
		this.sumAssured = sumAssured;
	}
	
	
}
