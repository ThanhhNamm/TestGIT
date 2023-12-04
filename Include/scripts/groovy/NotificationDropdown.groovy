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

import common.DBConnection
import internal.GlobalVariable

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



class NotificationDropdown {
	@Then("{string} popup should be shown up")
	def popup_should_be_shown_up(String name) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/h3_TabTitle',['title':name]), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementPresent(findTestObject('Object Repository/Common/h3_TabTitle',['title':name]), GlobalVariable.MIN_WAIT)
	}

	@When("I click option {string} in the notification")
	def i_click_option_in_the_notification(String option) {
		List<WebElement> list = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/h6_text',['param':option]), GlobalVariable.MIN_WAIT)
		if(list.size() > 0) {
			list.get(0).click()
		}else {
			throw new Exception('No element in the list')
		}
	}

	@Then("The message {string} should be displayed in the notification pop up")
	def the_message_should_be_displayed_in_the_notification_pop_up(String message) {
		List<WebElement> list = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Data Focal/General Data/li_notificationName',['param':'MuiListItem-gutters']), GlobalVariable.MIN_WAIT)
		boolean check = false
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getText().equals(message)) {
				check = true
			}
		}
		Assert.assertTrue(check == true, 'No notification with name in the list')
	}

	@When("I delete equipment class {string} in Equipment Sensitive To Content page")
	def i_delete_equipment_class_in_equipment_sensitive_to_content_page(String data) {
		new DBConnection(GlobalVariable.DB_HOSTNAME, GlobalVariable.DB_PORT, GlobalVariable.DB_INSTANCE_NAME,
				GlobalVariable.DB_USERNAME, GlobalVariable.DB_PASSWORD)
		String query = "delete from dim_equipment_sensitivity_to_content where equipment_class = '"+data+"'"
		DBConnection.executeUpdate(query)
	}
	
	@Then("No notification message should be displayed")
	def no_notification_message_should_be_displayed() {
		WebUI.waitForElementVisible(findTestObject("Object Repository/Common/p_text",['param':'No Notification']), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementVisible(findTestObject("Object Repository/Common/p_text",['param':'No Notification']))
	}
}