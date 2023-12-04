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

import common.utils
import internal.GlobalVariable
import io.cucumber.datatable.DataTable

import org.openqa.selenium.WebElement
import org.testng.Assert
import org.openqa.selenium.WebDriver
import org.openqa.selenium.By

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



class UserManagement {
	@When("I get all data from User Management screen with approver")
	def i_get_all_data_from_user_management_screen_with_approver() {
		List<Map<String, String>> UI = utils.extractDataTableWithText(findTestObject('Object Repository/Common/Table/table_Table'))
		List<WebElement> action = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Table/table_Table'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//tr/td//*[local-name()='svg' and @data-testid='EditIcon']"))
		Assert.assertEquals(UI.size(), action.size(), 'Two size are not equal')
		for(int i=0; i<action.size(); i++) {
			Map<String, String> obj = new HashMap<String, String>();
			UI.get(i).remove('Action')
			action.get(i).click()
			WebUI.waitForElementPresent(findTestObject('Object Repository/Common/Pop-Up/span_popup',['param':'User Information']), GlobalVariable.MIN_WAIT)
			String approver = WebUI.getAttribute(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'APPROVED BY']), 'value')
			String approveDate = WebUI.getText(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/p_OptionsWithText',['param':'APPROVED DATE']))
			UI.get(i).put('Approval/Rejected By', approver)
			UI.get(i).put('Approval/Rejected Date', approveDate)
			WebUI.click(findTestObject('Object Repository/Common/button_label', ['title' : 'Cancel']))
		}
		utils.addGlobalVariable('LIST_MAP_FROM_UI', UI)
	}

	@When("I convert excel file {string} with sheet name {string} into list map")
	def i_convert_excel_file_with_sheet_name_into_list_map(String fileName, String sn) {
		if(fileName.equals("MMW User Management")) {
			String now = new Date().format('ddMMyy')
			fileName = fileName + "-" + now
		}
		String dirName = System.getProperty('user.dir') + "/Data/Data Download/" + fileName + '.xlsx'
		List<Map<String, String>> excel = utils.extractExcelFile(dirName, sn)
		utils.addGlobalVariable('LIST_MAP_FROM_EXCEL', excel)
	}
	
	@When("I convert excel file {string} with index {int} into list map")
	def i_convert_excel_file_with_index_into_list_map(String fileName, int index) {
		if(fileName.equals("MMW User Management")) {
			String now = new Date().format('ddMMyy')
			fileName = fileName + "-" + now
		}
		String dirName = System.getProperty('user.dir') + "/Data/Data Download/" + fileName + '.xlsx'
		List<Map<String, String>> excel = utils.extractExcelFileWithIndex(dirName, index)
		utils.addGlobalVariable('LIST_MAP_FROM_EXCEL', excel)
	}

	@Then("I compare two list map {string} and {string} with column below")
	def i_compare_two_list_map_and_with_column_below(String list1, String list2, DataTable dataTable) {
		List<Map> dTable = dataTable.asMaps(String.class, String.class)
		List<Map<String, String>> listMap1 = GlobalVariable[list1]
		List<Map<String, String>> listMap2 = GlobalVariable[list2]
		println 'AAA '+listMap1
		println 'BBB '+listMap2
		for(int i=0; i<dTable.size(); i++) {
			println 'Index '+i
			String table1 = dTable.get(i).get('list1')
			String table2 = dTable.get(i).get('list2')
			println 'list 1 '+table1
			println 'list 2 '+table2
			String format1
			String format2
			for(int j=0; j<listMap1.size(); j++) {
				//check format of time
				if(table1.contains("^")) {
					String[] arr = table1.split("\\^",2)
					table1 = arr[0]
					format1 = arr[1]
				}
				if(table2.contains("^")){
					String[] arr = table2.split("\\^",2)
					table2 = arr[0]
					format2 = arr[1]
				}
				//convert date time to new format
				String fromUI = listMap1.get(j).get(table1).trim()
				String fromEx = listMap2.get(j).get(table2).trim()
				if(format1 != null) {
					fromUI = utils.convertDateTimeFormat(format1, 'dd MMM yyyy', fromUI)
				}
				if(format2 != null) {
					fromEx = utils.convertDateTimeFormat(format2, 'dd MMM yyyy', fromEx)
				}
				Assert.assertEquals(fromUI, fromEx, 'Two data not equal')
			}
		}
	}
}