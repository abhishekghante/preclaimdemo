package com.preclaim.dao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.sql.DataSource;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ParameterizedPreparedStatementSetter;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.preclaim.config.Config;
import com.preclaim.models.CaseDetailList;
import com.preclaim.models.CaseDetails;
import com.preclaim.models.UserDetails;

public class CaseDaoImpl implements CaseDao {

	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public String addBulkUpload(String filename) {
		
		String extension = StringUtils.getFilenameExtension(filename).toLowerCase();
		String error ="";
		if(extension.equals("xlsx"))
			error = readCaseXlsx(filename);
		return error;
	}
	
	@Override
	public String addcase(CaseDetails casedetail) 
	{
		try 
		{
			String query = "INSERT INTO case_lists (policyNumber, investigationCategory, insuredName, insuredDOD, insuredDOB, sumAssured, intimationType, claimantCity,"
							+ " claimantZone, claimantState, caseStatus, caseSubStatus, nominee_name, nomineeContactNumber, nominee_address, insured_address, supervisor,"
							+ "supervisor2managerRemarks,supervisor2investigatorRemarks,regionalManager2supervisorRemarks,investigator, investigator2supervisorRemarks,underwriter,"
							+ "underwriter2regionalManagerRemarks, talicManager, talicManager2underwriteRemarks, createdBy, createdDate, updatedDate, updatedBy) "
							+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'open', 'PA', ?, ?, ?, ?, '', '', '', '', '', '', '', '', '', '', ?, now(), now(), '')";    
			this.template.update(query, casedetail.getPolicyNumber(), casedetail.getInvestigationCategory(), casedetail.getInsuredName(), casedetail.getInsuredDOD(),
					casedetail.getInsuredDOB(), casedetail.getSumAssured(), casedetail.getIntimationType(), casedetail.getClaimantCity(), casedetail.getClaimantZone(), 
					casedetail.getClaimantState(), casedetail.getNominee_name(), casedetail.getNomineeContactNumber(), casedetail.getNominee_address(),
					casedetail.getInsured_address(), casedetail.getCreatedBy());				    	
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "Error adding case. Kindly contact system administrator";
		}
		return "****";
	}

	
	
	@Override
	public List<CaseDetailList> getCaseDetailList(String caseSubStatus) {
		try
		{
			String sql="";
			 if(caseSubStatus.equals("PA")) 
				 sql ="SELECT * FROM case_lists where caseSubStatus ='" + caseSubStatus+"'"; 
			   else 
				 sql ="SELECT * FROM case_lists WHERE caseSubStatus='ARM'";
			List<CaseDetailList> casedetailList = template.query(sql,(ResultSet rs, int rowCount) -> {
						CaseDetailList casedetail=new CaseDetailList();
						casedetail.setSrNo(rowCount+1);
						casedetail.setCaseId(rs.getInt("caseId"));
						casedetail.setPolicyNumber(rs.getString("policyNumber"));
						casedetail.setInsuredName(rs.getString("insuredName"));
						casedetail.setInvestigationCategory(rs.getString("investigationCategory"));
						casedetail.setClaimantZone(rs.getString("claimantZone"));
						casedetail.setSumAssured(rs.getInt("sumAssured"));
						casedetail.setCaseStatus(rs.getString("caseStatus"));
						casedetail.setCaseSubstatus(rs.getString("caseSubStatus"));
						casedetail.setIntimationType(rs.getString("intimationType"));	
						return casedetail;
					});
			return casedetailList;
		}
		catch(Exception ex)
		{
			System.out.println(ex.getMessage());
			ex.printStackTrace();
			return null;
		}
	}
	
	
	@Override
	public CaseDetails getCaseDetail(int caseID) {
		try
		{
			String sql = "SELECT * FROM case_lists where caseID = ?";
			     List<CaseDetails> caseDetail= this.template.query(sql, new Object[] {caseID}, 
					(ResultSet rs, int rowCount) -> 
					{
						CaseDetails detail = new CaseDetails();
						detail.setCaseId(rs.getInt("caseID"));
						detail.setPolicyNumber(rs.getString("policyNumber"));
						detail.setInvestigationCategory(rs.getString("investigationCategory"));
						detail.setInsuredName(rs.getString("insuredName"));
						detail.setInsuredDOD(rs.getString("insuredDOD"));
						detail.setInsuredDOB(rs.getString("insuredDOB"));
						detail.setSumAssured(rs.getInt("sumAssured"));
						detail.setIntimationType(rs.getString("intimationType"));
						detail.setClaimantCity(rs.getString("claimantCity"));
						detail.setClaimantState(rs.getString("claimantState"));
						detail.setClaimantZone(rs.getString("claimantZone"));
						detail.setNominee_name(rs.getString("nominee_name"));
						detail.setNomineeContactNumber(rs.getString("nomineeContactNumber"));
						detail.setNominee_address(rs.getString("nominee_address"));
						detail.setInsured_address(rs.getString("insured_address"));
						return detail;
					}
					);
			     return caseDetail.get(0);
		          
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}


	@Override
	public String updateCaseSubStatus(int caseid, String caseSubStatus) {
	try {
		
	      String sql="update case_lists set caseSubStatus =? where caseId=? ";
		  this.template.update(sql,caseSubStatus,caseid);
		  
	   }
	catch(Exception e) 
	{
		return "Error updating region status. Kindly contact system administrator";	
    }
	return "****";	  
	}
	
	@Override
	public String updateCaseDetails(CaseDetails casedetail) {
		try
		{
			String sql = "UPDATE case_lists SET policyNumber = ?, investigationCategory = ?, insuredName = ?, insuredDOD = ?, insuredDOB = ?, sumAssured = ?, intimationType = ?, claimantCity = ?,"
					+ "claimantZone = ?, claimantState = ?,nominee_name = ?, nomineeContactNumber = ?, nominee_address = ?, "
					+ "insured_address = ?";
			template.update(sql, casedetail.getPolicyNumber(), casedetail.getInvestigationCategory(), casedetail.getInsuredName(), casedetail.getInsuredDOD(),
					casedetail.getInsuredDOB(), casedetail.getSumAssured(), casedetail.getIntimationType(), casedetail.getClaimantCity(), casedetail.getClaimantZone(), 
					casedetail.getClaimantState(), casedetail.getNominee_name(), casedetail.getNomineeContactNumber(), casedetail.getNominee_address(),
					casedetail.getInsured_address());
					
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "Failed updating Case ID. Kindly contact system administrator";
		}
		return "****";
	}
	
	@Override
	public List<String> getActiveZone(String role_name)
	{
		try
		{
			String sql = "SELECT DISTINCT zone FROM admin_user where status = 1 and role_name = ?";
			return template.query(sql, new Object[] {role_name}, 
					(ResultSet rs, int rowCount) -> {return rs.getString("zone");});
		}
		catch(Exception e)
		{
			return null;
		}
	}
	
	@Override
	public List<String> getActiveState(String role_name, String zone)
	{
		try
		{
			String sql = "SELECT DISTINCT state FROM admin_user where status = 1 and role_name = ?,"
					+ "zone = ?";
			return template.query(sql, new Object[] {role_name, zone}, 
					(ResultSet rs, int rowCount) -> {return rs.getString("zone");});
		}
		catch(Exception e)
		{
			return null;
		}
	}
	
	@Override
	public List<String> getActiveCity(String role_name, String zone, String state)
	{
		try
		{
			String sql = "SELECT DISTINCT city FROM admin_user where status = 1 and role_name = ?, "
					+ "zone = ?, state = ?";
			return template.query(sql, new Object[] {role_name, zone, state}, 
					(ResultSet rs, int rowCount) -> {return rs.getString("zone");});
		}
		catch(Exception e)
		{
			return null;
		}
	}
	
	@Override
	public List<UserDetails> getActiveUser(String role_name, String zone, String state, String city)
	{
		try
		{
			String sql = "SELECT * FROM admin_user where status = 1 and role_name = ?, zone = ?, "
					+ "state = ?, city = ?";
			return template.query(sql, new Object[] {role_name, zone, state, city}, 
					(ResultSet rs, int rowCount) -> 
						{
							UserDetails user = new UserDetails();
							user.setUsername(rs.getString("username"));
							user.setFull_name(rs.getString("full_name"));
							return user;
						});
		}
		catch(Exception e)
		{
			return null;
		}
	}
	@Transactional
	public String readCaseXlsx(String filename) {
		try {
			File file = new File(Config.upload_directory + filename);
			//File not found error won't occur
			List<CaseDetails> caseList = new ArrayList<CaseDetails>();
			FileInputStream fis = new FileInputStream(file);
			XSSFWorkbook wb = new XSSFWorkbook(fis);   
			XSSFSheet sheet = wb.getSheetAt(0);
			Iterator<Row> itr = sheet.iterator();    //iterating over excel file  		
			itr.hasNext();
			itr.next();
//			String error_message = sanityCheck(itr.next());
//			if(!error_message.equals("****"))
//			{
//				wb.close();
//				return error_message;
//			}
			while (itr.hasNext())                 
			{  
				//Skipping Header String
				Row row = itr.next();
				Iterator<Cell> cellIterator = row.cellIterator();   //iterating over each column  
				CaseDetails caseDetails = new CaseDetails();
				Cell cell;
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					caseDetails.setPolicyNumber(readCellStringValue(cell));
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();
					caseDetails.setInvestigationCategory(readCellStringValue(cell));
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					caseDetails.setInsuredName(readCellStringValue(cell));
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					caseDetails.setInsuredDOD(readCellStringValue(cell));
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					caseDetails.setInsuredDOB(readCellStringValue(cell));
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();
					caseDetails.setSumAssured(readCellIntValue(cell));
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();
					caseDetails.setIntimationType(readCellStringValue(cell));
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					caseDetails.setClaimantCity(readCellStringValue(cell));
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					caseDetails.setNominee_name(readCellStringValue(cell));;
				}				
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					caseDetails.setNomineeContactNumber(readCellStringValue(cell));
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					caseDetails.setNominee_address(readCellStringValue(cell));
				}
				if(cellIterator.hasNext())
				{
					cell = cellIterator.next();  					
					caseDetails.setInsured_address(readCellStringValue(cell));
				}
				caseList.add(caseDetails);
			}
			wb.close();
			String sql = "INSERT INTO case_lists(policyNumber, investigationCategory, insuredName, insuredDOD, insuredDOB, "
					+ "sumAssured, intimationType, claimantCity, claimantZone, claimantState, caseStatus, caseSubStatus, "
					+ "nominee_name, nomineeContactNumber, nominee_address, insured_address, "
					+ "supervisor, supervisor2managerRemarks, supervisor2investigatorRemarks, regionalManager2supervisorRemarks, "
					+ "investigator, investigator2supervisorRemarks, underwriter, underwriter2regionalManagerRemarks, "
					+ "talicManager, talicManager2underwriteRemarks, createdBy, createdDate, updatedDate, updatedBy) "
					+ "VALUES(?, ?, ?, ?, ?, 1, 1, ?, ?, ?, now(), '0000-00-00 00:00:00', 0)";
			
			template.batchUpdate(sql,caseList,5,
	                new ParameterizedPreparedStatementSetter<CaseDetails>() {
	                    public void setValues(PreparedStatement ps, CaseDetails caseDetails) throws SQLException          
	                    {
	                    	ps.setString(1, caseDetails.getPolicyNumber());
	                    	ps.setString(2, caseDetails.getInvestigationCategory());
	                    	ps.setString(3, caseDetails.getInsuredName());
	                    	ps.setString(4, caseDetails.getInsuredDOD());
	                    	ps.setString(5, caseDetails.getInsuredDOB());
	                    	ps.setInt(6, (int)caseDetails.getSumAssured());
	                    	ps.setString(7, caseDetails.getIntimationType());
	                    	ps.setString(8,caseDetails.getClaimantCity());
	                    	ps.setString(9, caseDetails.getClaimantState());
	                    	ps.setString(10, caseDetails.getClaimantZone());
	                    	ps.setString(11, "Open");
	                    	ps.setString(12,"PA");
	                    	ps.setString(13, caseDetails.getNominee_name());
	                    	ps.setString(14, caseDetails.getNomineeContactNumber());
	                    	ps.setString(15,  caseDetails.getNominee_address());
	                    	ps.setString(16, caseDetails.getInsured_address());
	                    }
	                });
			return "****";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}

	public String readCellStringValue(Cell cell)
	{
		switch (cell.getCellType())               
		{  
			case STRING:  
				return cell.getStringCellValue();  
			case NUMERIC:    //field that represents number cell type  
				return String.valueOf(cell.getNumericCellValue());
			default:
				return "";
		}
	}
	
	public String readCellDateValue(Cell cell)
	{
		try
		{
			Date date = (Date) cell.getDateCellValue();
			return date.toString();
		}
		catch(Exception ex)
		{
			return "";
		}
	}
	
	public int readCellIntValue(Cell cell)
	{
		switch (cell.getCellType())               
		{  
			case STRING:  
				return Integer.parseInt(cell.getStringCellValue());  
			case NUMERIC:    //field that represents number cell type  
				return (int)cell.getNumericCellValue();
			default:
				return 0;
		}
	}
	
	public String sanityCheck(Row row)
	{
		Iterator<Cell> cellIterator = row.cellIterator();   //iterating over each column 
		Cell cell;
		if(cellIterator.hasNext())
		{
			cell = cellIterator.next();
			//if(readCellStringValue(cell).equals(""))
		}
		return "****";
	}

	@Override
	public String deleteCase(int caseId) {
		try
		
		 {
			String sql="DELETE FROM case_lists where caseId=?";	
			this.template.update(sql,caseId);	
		 }
		catch(Exception e) 
		 {
			e.printStackTrace();
			return "Error Deleting User";
			
		 }
	
		return "****";
	}
	
}
