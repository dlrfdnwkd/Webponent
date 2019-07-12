package kr.sunmoon.webponent.model;

public class Patent {
	private String applicationNumber;
	private String koreanName;
	private String englishName;
	private String state;
	private String classification;
	private String agent;
	private String inventor;
	private String applicationDate;
	private String registrationNumber;
	private String registrationDate;
	private String publicNumber;
	private String publicDate;
	
	public Patent() {}
	public Patent(String applicationNumber, String koreanName, String englishName, String state, String classification,
			String agent, String inventor, String applicationDate, String registrationNumber, String registrationDate,
			String publicNumber, String publicDate) {
		this.applicationNumber = applicationNumber;
		this.koreanName = koreanName;
		this.englishName = englishName;
		this.state = state;
		this.classification = classification;
		this.agent = agent;
		this.inventor = inventor;
		this.applicationDate = applicationDate;
		this.registrationNumber = registrationNumber;
		this.registrationDate = registrationDate;
		this.publicNumber = publicNumber;
		this.publicDate = publicDate;
	}
	public String getApplicationNumber() {
		return applicationNumber;
	}
	public void setApplicationNumber(String applicationNumber) {
		this.applicationNumber = applicationNumber;
	}
	public String getKoreanName() {
		return koreanName;
	}
	public void setKoreanName(String koreanName) {
		this.koreanName = koreanName;
	}
	public String getEnglishName() {
		return englishName;
	}
	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public String getAgent() {
		return agent;
	}
	public void setAgent(String agent) {
		this.agent = agent;
	}
	public String getInventor() {
		return inventor;
	}
	public void setInventor(String inventor) {
		this.inventor = inventor;
	}
	public String getApplicationDate() {
		return applicationDate;
	}
	public void setApplicationDate(String applicationDate) {
		this.applicationDate = applicationDate;
	}
	public String getRegistrationNumber() {
		return registrationNumber;
	}
	public void setRegistrationNumber(String registrationNumber) {
		this.registrationNumber = registrationNumber;
	}
	public String getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}
	public String getPublicNumber() {
		return publicNumber;
	}
	public void setPublicNumber(String publicNumber) {
		this.publicNumber = publicNumber;
	}
	public String getPublicDate() {
		return publicDate;
	}
	public void setPublicDate(String publicDate) {
		this.publicDate = publicDate;
	}
}