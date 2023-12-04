import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject

import java.text.SimpleDateFormat

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
import org.openqa.selenium.NoSuchElementException
import org.openqa.selenium.StaleElementReferenceException

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



class ERBSInputDataUpload {
	@Then("The table in ERBS Input Data should contain columns as design")
	def the_table_in_erbs_input_data_should_contain_columns_as_design(DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		List<WebElement> UI = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Table/table_Table'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//th"))
		for(int i=0; i<dTable.size(); i++) {
			Assert.assertEquals(dTable.get(i), UI.get(i).getText().trim(), 'Data is not the same')
		}
	}

	@When("I click on button in column of table in ERBS Input")
	def i_click_on_button_in_column_of_table_in_erbs_input(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		List<Map<String, WebElement>> UI = utils.extractDataTableWithoutSyntax(findTestObject('Object Repository/Common/Table/table_Table'))
		uploadFile:
		for(int i=0; i<UI.size(); i++) {
			for(int j=0; j<dTable.size(); j++) {
				String column = dTable.get(j).get('Column')
				String btn = dTable.get(j).get('Name')
				if(btn.equals('Upload File')) {
					UI.get(i).get(column).findElement(By.xpath(".//span[@aria-label='Upload File']")).click()
					break uploadFile;
				}else if(btn.equals('Download')) {
					UI.get(i).get(column).findElement(By.xpath(".//*[local-name()='svg' and @data-testid='DownloadIcon']")).click()
					utils.addGlobalVariable('FILE_NAME', UI.get(i).get('File Name').getText().trim())
					break uploadFile;
				}else if(btn.equals('Edit General Data')) {
					UI.get(i).get(column).findElement(By.xpath(".//*[local-name()='svg' and @data-testid='EditIcon']")).click()
					break uploadFile;
				}else if(btn.equals('Delete General Data')){
					utils.addGlobalVariable('MAT_NO_DELTE', UI.get(i).get('Material No.').getText().trim())
					UI.get(i).get(column).findElement(By.xpath(".//*[local-name()='svg' and @data-testid='DeleteIcon']")).click()
					break uploadFile;
				}else if(btn.equals('Delete ECA')) {
					UI.get(i).get(column).findElement(By.xpath(".//*[local-name()='svg' and @data-testid='DeleteIcon']")).click()
					break uploadFile;
				}else if(btn.equals('Info icon')) {
					UI.get(i).get(column).findElement(By.xpath(".//*[local-name()='svg' and @data-testid='InfoIcon']")).click()
					break uploadFile;
				}else if(btn.equals('Endorse')) {
					try {
						UI.get(i).get(column).findElement(By.xpath(".//*[local-name()='svg' and @data-testid='CheckCircleIcon']")).click()
						break uploadFile;
					}catch(NoSuchElementException) {
						continue
					}
				}else if(btn.equals('Reject')) {
					try {
						UI.get(i).get(column).findElement(By.xpath(".//*[local-name()='svg' and @data-testid='CancelIcon']")).click()
						break uploadFile;
					}catch(NoSuchElementException) {
						continue
					}
				}
			}
		}
	}

	@When("I upload {string} file to the website")
	def i_upload_file_to_website(String fileName) {
		if(fileName.contains('Download')) {
			String userDir = System.getProperty('user.dir') + "/Data/Data Download/"
			String filePath = userDir + fileName.split("-",2)[1]
			println 'ZXCZXC '+filePath
			WebUI.uploadFile(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/input_searchBar',['param':'file']), filePath)
			File file = new File(filePath)
			file.delete()
			Assert.assertFalse(file.exists(), 'File still exist!')
		}else {
			String userDir = System.getProperty('user.dir')
			String filePath = userDir + "/Data/Data Input/" + fileName
			WebUI.uploadFile(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/input_searchBar',['param':'file']), filePath)
		}
	}

	@Then("The {string} table in ERBS Input Data page")
	def the_table_in_erbs_input_data_page(String table, DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		List<Map<String, WebElement>> UI = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Data Focal/ERBS Input Data/table_tableWithText',['param':table]))
		for(int i=0; i<dTable.size(); i++) {
			println 'AAA '+dTable.get(i).get('File Name')
			println 'BBB '+UI.get(i).get('File Name').getText().trim()
			Assert.assertEquals(dTable.get(i).get('File Name'), UI.get(i).get('File Name').getText().trim(), 'Two files name are not equal')
			Assert.assertEquals(dTable.get(i).get('File Source'), UI.get(i).get('File Source').getText().trim(), 'Two files source are not equal')
			if(WebUI.waitForElementNotPresent(WebUI.convertWebElementToTestObject(UI.get(i).get('File Name').findElement(By.xpath(".//*[local-name()='svg' and @data-testid='CheckCircleIcon']"))), GlobalVariable.MIN_WAIT)) {
				WebUI.waitForElementPresent(WebUI.convertWebElementToTestObject(UI.get(i).get('File Name').findElement(By.xpath(".//*[local-name()='svg' and @data-testid='CheckCircleIcon']"))), GlobalVariable.MIN_WAIT)
			}
		}
	}

	@Then("The {string} should only contain following file name")
	def the_column_should_only_contain_following_file_name(String list, DataTable dataTable) {
		List<String> global = GlobalVariable[list.split("-",2)[1]]
		List<String> dTable = dataTable.asList()

		for(int i=0; i<global.size(); i++) {
			int count = 0
			for(int j=0; j<dTable.size(); j++) {

				if(global.get(i).contains(dTable.get(i))) {
					count++
				}
			}
			Assert.assertTrue(count > 0, 'The column do not contain keyword in the list!')
		}
	}

	@When("I delete all uploaded file in ERBS Input Data")
	def i_delete_all_uploaded_file_in_erbs_input_data() {
		boolean check = true
		while(check) {
			if(WebUI.waitForElementPresent(findTestObject('Object Repository/Data Focal/ERBS Input Data/button_deleteUploadedFile'), GlobalVariable.MIN_WAIT)) {
				WebUI.click(findTestObject('Object Repository/Data Focal/ERBS Input Data/button_deleteUploadedFile'))
				WebUI.waitForElementPresent(findTestObject('Object Repository/Common/h3_TabTitle',['title':'Confirmation']), GlobalVariable.MIN_WAIT)
				WebUI.click(findTestObject('Object Repository/Common/button_label', ['title' : 'Ok']))
				WebUI.refresh()
				WebUI.delay(5)
			}else {
				check = false
			}
		}
	}

	@Then("All data from list {string} should be displayed in the {string} filter")
	def all_data_from_list_should_be_displayed_in_the_filter(String list, String filter) {
		List<String> globalList = GlobalVariable[list]
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/span_ParamDropDown',['param':filter]))
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/form_DropDownForm'), GlobalVariable.MIN_WAIT)
		List<String> listE = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/form_DropDownForm'), GlobalVariable.MAX_WAIT).findElements(By.xpath(".//input")).collect{x -> x.getAttribute('aria-labelledby')}
		for(int i=0; i<globalList.size(); i++) {
			Assert.assertTrue(listE.contains(globalList.get(i)), 'Element from table not display in the filter')
		}
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':'Apply']))
		WebUI.waitForElementNotPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/form_DropDownForm'), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementNotPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/form_DropDownForm'), GlobalVariable.MIN_WAIT)
	}

	@Then("Radio button should be displayed as design")
	def radio_button_should_be_displayed_as_design(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		for(int i=0; i<dTable.size(); i++) {
			String name = dTable.get(i).get('Name')
			String status = dTable.get(i).get('Status')
			WebUI.waitForElementPresent(findTestObject('Object Repository/Data Focal/ERBS Input Data/input_radioButton',['param':name]), GlobalVariable.MIN_WAIT)
			WebUI.verifyElementPresent(findTestObject('Object Repository/Data Focal/ERBS Input Data/input_radioButton',['param':name]), GlobalVariable.MIN_WAIT)
			switch(status) {
				case 'Unselect':
					WebUI.verifyElementNotChecked(findTestObject('Object Repository/Data Focal/ERBS Input Data/input_radioButton',['param':name]), GlobalVariable.MIN_WAIT)
					break
				case 'Selected':
					WebUI.verifyElementChecked(findTestObject('Object Repository/Data Focal/ERBS Input Data/input_radioButton',['param':name]), GlobalVariable.MIN_WAIT)
					break
				default:
					throw new Exception('Invalid input')
			}
		}
	}

	@Then("An error message {string} in radio {string} should be displayed")
	def an_error_message_should_be_displayed_when_no_radio_button_is_selected(String message, String radio) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Data Focal/ERBS Input Data/span_InvalidFeedback',['param':radio]), GlobalVariable.MIN_WAIT)
		String text = WebUI.getText(findTestObject('Object Repository/Data Focal/ERBS Input Data/span_InvalidFeedback',['param':radio]))
		Assert.assertEquals(message, text, 'Message is not correct')
	}

	@Then("Message should be displayed when uploaded duplicate file in Input Data")
	def message_should_be_displayed_when_uploaded_duplicate_file_in_input_data() {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/span_class',['param':'MuiTypography-subtitle2']), GlobalVariable.MIN_WAIT)
		String text = 'Already having a file with the same name, please rename file and re-upload it'
		Assert.assertEquals(text, WebUI.getText(findTestObject('Object Repository/Common/span_class',['param':'MuiTypography-subtitle2'])), 'Message is not correct')
	}

	@Then("Data in column {string} should have format as {string}")
	def data_in_column_should_have_format_as(String column, String format) {
		List<Map<String, String>> UI = utils.extractDataTableWithText(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<UI.size(); i++) {
			String data = UI.get(i).get(column).replace("\n", " ")
			println 'ZXCXZ '+data
			println 'AAAAA '+format
			Assert.assertTrue(utils.isValid(data, format), 'Incorrect date format '+data)
		}
	}
}