import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject

import com.kms.katalon.core.annotation.Keyword
import com.kms.katalon.core.checkpoint.Checkpoint
import com.kms.katalon.core.checkpoint.CheckpointFactory
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling
import com.kms.katalon.core.testcase.TestCase
import com.kms.katalon.core.testcase.TestCaseFactory
import com.kms.katalon.core.testdata.TestData
import com.kms.katalon.core.testdata.TestDataFactory
import com.kms.katalon.core.testobject.ObjectRepository
import com.kms.katalon.core.testobject.TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI

import common.ExcelKeyword
import common.utils
import internal.GlobalVariable
import io.cucumber.datatable.DataTable

import org.openqa.selenium.WebElement
import org.testng.Assert
import org.openqa.selenium.WebDriver
import org.openqa.selenium.By
import org.openqa.selenium.NoSuchElementException

import com.kms.katalon.core.mobile.keyword.internal.MobileDriverFactory
import com.kms.katalon.core.webui.common.WebUiCommonHelper
import com.kms.katalon.core.webui.driver.DriverFactory

import com.kms.katalon.core.testobject.RequestObject
import com.kms.katalon.core.testobject.ResponseObject
import com.kms.katalon.core.testobject.ConditionType
import com.kms.katalon.core.testobject.TestObjectProperty

import com.kms.katalon.core.mobile.helper.MobileElementCommonHelper
import com.kms.katalon.core.util.KeywordUtil

import com.kms.katalon.core.webui.exception.WebElementNotFoundException

import cucumber.api.java.en.And
import cucumber.api.java.en.Given
import cucumber.api.java.en.Then
import cucumber.api.java.en.When



class SavingsReport {
	@Then("The table should be order {string} in the column {string}")
	def the_table_should_be_order_in_the_column(String order, String column) {
		List<Map<String, WebElement>> UI = utils.extractDataTableWithTheadAndTbody(findTestObject('Object Repository/Common/Table/table_Table'))
		List<String> listOfColumn = UI.collect({ x->
			x.get(column).getText()
		})
		List<String> listBeforeSort = listOfColumn
		switch(order){
			case 'descending':
				Collections.reverse(listOfColumn)
				break
			case 'ascending':
				Collections.sort(listOfColumn)
				break
			default:
				throw new Exception("Invalid input")
		}
		Assert.assertEquals(listBeforeSort, listOfColumn, 'Two lists are not equal')
	}

	@Then("These headers in the table will have sort icon")
	def these_headers_in_the_table_will_have_sort_icon(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		for(int i=0; i<dTable.size(); i++) {
			println('ZXCCZC '+i)
			String header = dTable.get(i).get('Header')
			String sortBtn = dTable.get(i).get('Sort')
			boolean checked;
			try {
				if(WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/span_tableHeaders',['param':header]), GlobalVariable.MIN_WAIT)
				.findElement(By.xpath("./parent::div/following-sibling::*[local-name()='svg' and @data-testid='ArrowDownwardIcon']")).isEnabled()) {
					checked = true
				}
			}catch(NoSuchElementException e) {
				checked = false
			}
			switch(sortBtn) {
				case 'Yes':
					Assert.assertTrue(checked == true, 'Element is not displayed')
					break
				case 'No':
					Assert.assertTrue(checked == false, 'Element is displayed')
					break
				default:
					throw new Exception("Invalid input")
			}
		}
	}

	@Then("The Stock Proposal Value Captured should have {int} decimal point and currency {string}")
	def the_stock_proposal_value_captured_should_have_decimal_point_and_currency(int point, String currency) {
		if(currency.equals('no')) {
			WebUI.waitForElementPresent(findTestObject('Object Repository/Common/h3_TabTitle',['title': 'STOCK PROPOSAL VALUE CAPTURED']), GlobalVariable.MIN_WAIT)
			String text = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/h3_TabTitle',['title': 'STOCK PROPOSAL VALUE CAPTURED']), GlobalVariable.MIN_WAIT).findElement(By.xpath("./following-sibling::div/h3")).getText()
			Assert.assertTrue(text.contains("."), 'Currency is not decimal number')
			Assert.assertTrue(Character.isDigit(text.charAt(text.length()-1)), 'Currency more than 1000!')
		}else {
			WebUI.waitForElementPresent(findTestObject('Object Repository/Common/h3_TabTitle',['title': 'STOCK PROPOSAL VALUE CAPTURED']), GlobalVariable.MIN_WAIT)
			String text = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/h3_TabTitle',['title': 'STOCK PROPOSAL VALUE CAPTURED']), GlobalVariable.MIN_WAIT).findElement(By.xpath("./following-sibling::div/h3")).getText()
			Assert.assertTrue(text.contains("."), 'Currency is not decimal number')
			Assert.assertFalse(Character.isDigit(text.charAt(text.length()-1)), 'Currency does not contain any character')
			Assert.assertEquals(String.valueOf(text.charAt(text.length()-1)), currency, 'Two characters are not equal')
		}
	}

	@When("I get value from {string} record in the table")
	def i_get_value_from_record_in_the_table(String index, DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		if(index.equals('random')) {
			Random rand = new Random();
			List<Map<String, WebElement>> UI = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))
			int randomNumber = rand.nextInt(UI.size())
			for(int i=0; i<dTable.size(); i++) {
				String dTableText = dTable.get(i)
				if(dTableText.contains('Input')) {
					utils.addGlobalVariable(dTableText.split("-",2)[1].toUpperCase().replaceAll("\\s", "_"), UI.get(randomNumber).get(dTableText.split("-",2)[1]).findElement(By.xpath(".//input")).getAttribute('value'))
				}else {
					utils.addGlobalVariable(dTableText.toUpperCase().replaceAll("\\s", "_"), UI.get(randomNumber).get(dTableText).getText())
				}
			}
		}
	}

	@Then("Column in the Saving Report page which have same Material No and Ref No should have same OEM")
	def column_in_the_saving_report_page_which_have_same_material_no_and_ref_no_should_have_same_oem() {
		String refno = GlobalVariable['RANDOM_REF_NO']
		String matno = GlobalVariable['MATERIAL_NO']
		String min = GlobalVariable['OEM_MIN']
		String max = GlobalVariable['OEM_MAX']
		List<Map<String, String>> UI = utils.extractDataTableWithText(findTestObject('Object Repository/Common/Table/table_Table'))
		int count = 0
		for(int i=0; i<UI.size(); i++) {
			if(matno.equals(UI.get(i).get('Material No'))) {
				Assert.assertEquals(refno, UI.get(i).get('Stock Proposal Ref No'), 'Stock proposal ref no is not correct')
				Assert.assertEquals(min, UI.get(i).get('OEM Min'), 'OEM Min is not correct')
				Assert.assertEquals(max, UI.get(i).get('OEM Max'), 'OEM Max is not correct')
				count++
			}
		}
		Assert.assertTrue(count > 0, 'Mat no did not display in the table')
	}

	@Then("The file name {string} in {string} folder should have column as expected")
	def the_file_name_in_folder_should_have_column_as_expected(String fileName, String directory, DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		if(fileName.equals('Stock Proposal Savings Report')) {
			String now = new Date().format('ddMMyyyy')
			fileName = fileName + '_' + now + '.xlsx'
		}
		String dirName = System.getProperty('user.dir') + directory + fileName
		def workbook = ExcelKeyword.getWorkbook(dirName)
		def sheet = workbook.getSheetAt(0)
		for(int i=0; i<sheet.getRow(0).getLastCellNum(); i++) {
			Assert.assertEquals(dTable.get(i), sheet.getRow(0).getCell(i).toString(), 'Two values are not equal')
		}
	}

	@Then("Number of record in file name {string} in {string} should be {string}")
	def number_of_record_in_file_name_in_should_be(String fileName, String directory, String records) {
		if(fileName.equals('Stock Proposal Savings Report')) {
			String now = new Date().format('ddMMyyyy')
			fileName = fileName + '_' + now + '.xlsx'
		}
		String dirName = System.getProperty('user.dir') + directory + fileName
		def workbook = ExcelKeyword.getWorkbook(dirName)
		def sheet = workbook.getSheetAt(0)
		int rowNum = sheet.getLastRowNum()
		Assert.assertEquals(Integer.valueOf(records), rowNum-1 , 'Number of records are not match')
	}
	
	@When("I get all value from the table")
	def i_get_all_value_from_the_table() {
		List<Map<String, String>> UI = utils.extractDataTableWithText(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<UI.size(); i++) {
			UI.get(i).remove('')
		}
		utils.addGlobalVariable('ALL_VALUE_FROM_TABLE', UI)
	}
	
	@When("I delete the data file {string} in the directory {string}")
	def i_delete_the_data_file_in_the_directory(String fileName, String directory) {
		if(fileName.equals("MMW User Management")) {
			String now = new Date().format('ddMMyy')
			fileName = fileName + "-" + now + ".xlsx"
		}
		String dirName = System.getProperty('user.dir') + directory + fileName
		File file = new File(dirName)
		if(file.exists()) {
			file.delete()
		}
		Assert.assertFalse(file.exists(), 'File still exist!')
	}
}