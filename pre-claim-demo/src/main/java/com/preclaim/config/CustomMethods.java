package com.preclaim.config;

import java.util.ArrayList;

public class CustomMethods {
	
	public static ArrayList<String> importCaseHeader()
	{
		ArrayList<String> header_list = new ArrayList<String>();
		header_list.add("Policy Number");
		header_list.add("Investigation Category");
		header_list.add("Insured Name");
		header_list.add("Insured DOD");
		header_list.add("Insured DOB");
		header_list.add("Sum Assured");
		header_list.add("Intimation Type");
		header_list.add("Claimant City");
		header_list.add("Nominee Name");
		header_list.add("Nominee Mob");
		header_list.add("Nominee Address");
		header_list.add("Insured Address");
		return header_list;
	}

}
