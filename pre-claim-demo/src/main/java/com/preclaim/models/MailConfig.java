package com.preclaim.models;

public class MailConfig {

	private String host;
	private String port;
	private String username;
	private String password;
	private String receipent;
	private String subject;
	private String messageBody;
	
	public MailConfig()
	{
		host = "";
		port = "";
		username = "";
		password = "";
		receipent = "";
		subject = "";
		messageBody = "";
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getReceipent() {
		return receipent;
	}
	public void setReceipent(String receipent) {
		this.receipent = receipent;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessageBody() {
		return messageBody;
	}
	public void setMesssageBody(String messageBody) {
		this.messageBody = messageBody;
	}
	
}
