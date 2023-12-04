package common

import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import static com.kms.katalon.core.testobject.ObjectRepository.findWindowsObject

import org.apache.poi.hssf.usermodel.HSSFWorkbook
import org.apache.poi.ss.usermodel.Row
import org.apache.poi.ss.usermodel.Sheet
import org.apache.poi.ss.usermodel.Workbook
import org.apache.poi.xssf.usermodel.XSSFWorkbook

import com.google.common.io.Files
import com.kms.katalon.core.annotation.Keyword
import com.kms.katalon.core.checkpoint.Checkpoint
import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling
import com.kms.katalon.core.testcase.TestCase
import com.kms.katalon.core.testdata.TestData
import com.kms.katalon.core.testobject.TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import com.kms.katalon.core.windows.keyword.WindowsBuiltinKeywords as Windows

import internal.GlobalVariable

public class ExcelKeyword {
	@Keyword
	static Workbook getWorkbook(String filePath) throws IOException {
		File xlFile = new File(filePath)
		FileInputStream fis = new FileInputStream(xlFile)
		return Files.getFileExtension(filePath).equalsIgnoreCase("xlsx") ?
				new XSSFWorkbook(fis) : new HSSFWorkbook(fis)
	}

	@Keyword
	public static void deleteRow(Sheet sheet, Row row) {
		int lastRowNum = sheet.getLastRowNum();
		if(lastRowNum !=0 && lastRowNum >0){
			int rowIndex = row.getRowNum();
			Row removingRow = sheet.getRow(rowIndex);
			if(removingRow != null){
				sheet.removeRow(removingRow);
			}
		}
	}
}