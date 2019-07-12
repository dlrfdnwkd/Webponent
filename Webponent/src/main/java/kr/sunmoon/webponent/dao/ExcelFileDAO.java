package kr.sunmoon.webponent.dao;

import java.io.FileInputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.sunmoon.webponent.model.ExcelFile;
import kr.sunmoon.webponent.model.Patent;

@Repository
public class ExcelFileDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setJDBCTemplate(DataSource datasources) {
		this.jdbcTemplate = new JdbcTemplate(datasources);
	}
	
	public List<Patent> getExcelData(int index) {
		String query = "select * from excel where file_index ="+index;
		ExcelFile file_excel = jdbcTemplate.queryForObject(query, new RowMapper<ExcelFile>(){
			@Override
			public ExcelFile mapRow(ResultSet rs, int rowNum) throws SQLException{
				ExcelFile sample = new ExcelFile(rs.getString("file_name"),rs.getString("file_path"),rs.getInt("file_index"));
				return sample;
			}
		});
				List<Patent> list = new ArrayList<Patent>();
				try {
					FileInputStream file = new FileInputStream(file_excel.getFilePath());			
					HSSFWorkbook workbook = new HSSFWorkbook(file);
					HSSFSheet sheet = workbook.getSheetAt(0);
					int rows =sheet.getPhysicalNumberOfRows();
					for(int rowIndex = 1; rowIndex < rows; rowIndex++) {
						Patent patent = new Patent();
						HSSFRow row = sheet.getRow(rowIndex);
						if(row != null) {
							int cells = row.getPhysicalNumberOfCells();
							for(int columnIndex = 1; columnIndex < cells; columnIndex++) {
								HSSFCell cell = row.getCell(columnIndex);
								String value ="";
								switch(cell.getCellType()) {
								case HSSFCell.CELL_TYPE_NUMERIC:
									value = cell.getNumericCellValue() + "";
									break;
								case HSSFCell.CELL_TYPE_STRING:
									value = cell.getStringCellValue() + "";
									break;
								case HSSFCell.CELL_TYPE_BLANK:
									value = cell.getBooleanCellValue() + "";
									break;
								case HSSFCell.CELL_TYPE_ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}
								//셀마다 값 가져오기
								//System.out.println(value);
								switch(columnIndex) {
								case 1: patent.setApplicationNumber(value); break;
								case 2: patent.setKoreanName(value); break;
								case 3: patent.setEnglishName(value); break;
								case 4: patent.setState(value); break;
								case 5: patent.setClassification(value); break;
								case 6: patent.setAgent(value); break;
								case 7: patent.setInventor(value); break;
								case 8: patent.setApplicationDate(value); break;
								case 9: patent.setRegistrationNumber(value); break;
								case 10: patent.setRegistrationDate(value); break;
								case 11: patent.setPublicNumber(value); break;
								case 12: patent.setPublicDate(value); break;
								}
							}
						}
						//row 값 가져오기
						//System.out.println(patent);
						list.add(patent);
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				return list;
	}
}
