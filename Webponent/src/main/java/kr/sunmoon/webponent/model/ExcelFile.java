package kr.sunmoon.webponent.model;

public class ExcelFile {
	private String fileName;
	private String filePath;
	private int index;
	
	public ExcelFile() {}
	public ExcelFile(String fileName, String filePath, int index) {
		this.fileName = fileName;
		this.filePath = filePath;
		this.index = index;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}
}
