package com.preclaim.models;

public class CaseDetails {

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
	private int createdBy;
	private int updatedBy;

	public CaseDetails() {
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
		this.createdBy = 0;
		this.updatedBy = 0;
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

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public int getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(int updatedBy) {
		this.updatedBy = updatedBy;
	}

	@Override
	public String toString() {
		return "CaseDetails [caseId=" + caseId + ", policyNumber=" + policyNumber + ", insuredName=" + insuredName
				+ ", claimantCity=" + claimantCity + ", claimantZone=" + claimantZone + ", claimantState="
				+ claimantState + ", status=" + status + ", substatus=" + substatus + ", investigationCategory="
				+ investigationCategory + ", sumAssured=" + sumAssured + ", createdBy=" + createdBy + ", updatedBy="
				+ updatedBy + "]";
	}

	
}
