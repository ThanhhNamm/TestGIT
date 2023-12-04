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



class ECAOnlineFormSubmission {
	@When("I wait until the loading icon in {string} page is closed")
	def i_wait_until_the_loading_icon_in_page_is_closed(String page) {
		switch(page) {
			case 'ECA Online Form Submission':
				if(WebUI.waitForElementPresent(findTestObject('Object Repository/Data Focal/ECA/span_progress'), GlobalVariable.MIN_WAIT)) {
					WebUI.waitForElementNotPresent(findTestObject('Object Repository/Data Focal/ECA/span_progress'), GlobalVariable.MIN_WAIT)
				}
				break
			default:
				throw new Exception('Invalid input')
		}
	}

	@When("I close the confirmation pop up after upload new file in ECA Online Form Submission page")
	def i_close_the_confirmation_pop_up_after_upload_new_file_in_eca_online_form_submission_page() {
		if(WebUI.waitForElementPresent(findTestObject('Object Repository/Common/Pop-Up/span_popup',['param':'Error Data']), GlobalVariable.MIN_WAIT)) {
			WebUI.click(findTestObject('Object Repository/Common/button_label', ['title' : 'OK']))
			WebUI.waitForElementPresent(findTestObject('Object Repository/Data Focal/ECA/h2_alertPopup'), GlobalVariable.MIN_WAIT)
			Assert.assertEquals(WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Data Focal/ECA/h2_alertPopup'), GlobalVariable.MIN_WAIT).findElement(By.xpath(".//h3")).getText(), 'Confirmation', 'Title is not correct')
			WebUI.click(findTestObject('Object Repository/Common/button_label', ['title' : 'Ok']))
			WebUI.refresh()
			WebUI.delay(5)
		}
	}
	
	@Then("A pop-up name {string} should be {string} as design in ECA Online Form Submission page")
	def a_pop_up_name_should_be_displayed_as_design_in_eca_online_form_submission_page(String popupName, String status) {
		switch(status) {
			case 'displayed':
				WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/span_filter',['param':popupName]), GlobalVariable.MIN_WAIT)
				WebUI.verifyElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/span_filter',['param':popupName]), GlobalVariable.MIN_WAIT)
				break
			case 'not displayed':
				WebUI.waitForElementNotPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/span_filter',['param':popupName]), GlobalVariable.MIN_WAIT)
				WebUI.verifyElementNotPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/span_filter',['param':popupName]), GlobalVariable.MIN_WAIT)
				break
			default:
				throw new Exception("Invalid Input")
		}
	}
	
	@Then("Pop-up name {string} should have data with error remark")
	def pop_up_name_should_have_data_with_error_remark(String popup, DataTable dataTable) {
		WebElement ele = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Pop-Up/span_popup',['param':popup]), GlobalVariable.MIN_WAIT).findElement(By.xpath("./following::table"))
		List<Map<String, String>> UI = utils.extractDataTableWithAllPagesInPopup(WebUI.convertWebElementToTestObject(ele))
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		for(int i=0; i<UI.size(); i++) {
			String remark = UI.get(i).get('Error Remark')
			String function = UI.get(i).get('Function Location')
			Assert.assertEquals(function, dTable.get(i).get('Function'), 'Issue '+function+' not exist in the list')
			Assert.assertEquals(remark, dTable.get(i).get('Error'), 'Issue '+remark+' not exist in the list')
		}
	}
}