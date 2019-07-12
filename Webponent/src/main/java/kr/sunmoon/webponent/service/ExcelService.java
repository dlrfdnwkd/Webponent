package kr.sunmoon.webponent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.sunmoon.webponent.dao.ExcelFileDAO;
import kr.sunmoon.webponent.model.Patent;

@Service
public class ExcelService {
	
	private ExcelFileDAO excelFileDAO;
	
	@Autowired
	public void setExcelFileDAO(ExcelFileDAO excelFileDAO) {
		this.excelFileDAO = excelFileDAO;
	}
	
	public List<Patent> getExcelData(int index){
		return excelFileDAO.getExcelData(index);
	}
}
