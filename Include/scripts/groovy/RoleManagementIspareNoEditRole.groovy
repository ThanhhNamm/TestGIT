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
import org.openqa.selenium.interactions.Actions
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



class RoleManagementIspareNoEditRole {
	@When("Check full access to each page of account {string}")
	def check_full_access_to_each_page_of_account(String account, DataTable dataTable) {
		Actions actions = new Actions(DriverFactory.getWebDriver());
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		List<WebElement> dropdown = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Role Management/svg_param',['param':'KeyboardArrowDownIcon']), GlobalVariable.MIN_WAIT)
		//Click dropdown icon
		for(WebElement e : dropdown) {
			e.click()
		}
		//Delete null row
		List<Map<String, WebElement>> table = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/table_SpfTracking'))
		for(int i=0; i<table.size(); i++) {
			try {
				if(table.get(i).get('High Level Functionality').findElement(By.xpath(".//h4")).isDisplayed()) {
					table.remove(i)
				}
			}catch(NoSuchElementException e) {
				try {
					if(table.get(i).get('High Level Functionality').findElement(By.xpath(".//h5")).getText().trim().equals('General Input Data Maintenance')) {
						table.remove(i)
					}
				}catch(Exception) {
					continue
				}
			}
		}
		//Check access
		for(int j=0; j<table.size(); j++) {
			WebElement toogle = table.get(j).get(account).findElement(By.xpath(".//span[text()='Full access']/preceding-sibling::*[local-name()='svg']"))
			actions.moveToElement(toogle);
			actions.perform();
			String check = dTable.get(j).get('Status')
			Assert.assertEquals(dTable.get(j).get('Page'), table.get(j).get('High Level Functionality').getText(), 'Wrong page')
			switch(check) {
				case 'On':
					Assert.assertEquals(toogle.getAttribute('data-testid'), 'CheckCircleIcon', 'Element is not on')
					break
				case 'Off':
					Assert.assertEquals(toogle.getAttribute('data-testid'), 'HighlightOffIcon', 'Element is not off')
					break
				default:
					throw new Exception('Invalid input')
			}
		}
	}

	@Then("Current account should be able to access to all page below")
	def current_account_should_be_able_to_access_to_all_page_below(DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		for(int i=0; i<dTable.size(); i++) {
			String page = dTable.get(i)
			switch(page) {
				case 'Landing Page':
					WebUI.navigateToUrl('https://uat.mmworkspace.petronas.com/home')
					WebUI.waitForElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'Material Management Workspace']), GlobalVariable.MIN_WAIT)
					WebUI.verifyElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'Material Management Workspace']))
					break
				case 'User Management':
					WebUI.navigateToUrl('https://uat.mmworkspace.petronas.com/admin/user-management')
					WebUI.waitForElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'User Management']), GlobalVariable.MIN_WAIT)
					WebUI.verifyElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'User Management']))
					break
				case 'Role Management':
					WebUI.navigateToUrl('https://uat.mmworkspace.petronas.com/admin/role-management')
					WebUI.waitForElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'Role Management']), GlobalVariable.MIN_WAIT)
					WebUI.verifyElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'Role Management']))
					break
				case 'Contact Setup':
					WebUI.navigateToUrl('https://uat.mmworkspace.petronas.com/admin/contact-setup')
					WebUI.waitForElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'Contact Setup']), GlobalVariable.MIN_WAIT)
					WebUI.verifyElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'Contact Setup']))
					break
				case 'Contact Us':
					WebUI.navigateToUrl('https://uat.mmworkspace.petronas.com/contact-us')
					WebUI.waitForElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'Contact Us']), GlobalVariable.MIN_WAIT)
					WebUI.verifyElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'Contact Us']))
					break
				case 'Data Input':
					WebUI.navigateToUrl('https://uat.mmworkspace.petronas.com/input-data')
					SimpleDateFormat formatter = new SimpleDateFormat('MMM yyyy')
					Date date = new Date()
					String newDate = formatter.format(date)
					WebUI.waitForElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'ERBS Input Data - '+ newDate]), GlobalVariable.MIN_WAIT)
					WebUI.verifyElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'ERBS Input Data - '+ newDate]))
					break
				case 'ECA Online Form Submission':
					WebUI.navigateToUrl('https://uat.mmworkspace.petronas.com/eca/online-form-submission')
					WebUI.waitForElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'ECA Online Form Submission']), GlobalVariable.MIN_WAIT)
					WebUI.verifyElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'ECA Online Form Submission']))
					break
				case 'ECA View/Amendment':
					WebUI.navigateToUrl('')
					break
				case 'Company & Plant Code List P30 & P64':
					WebUI.navigateToUrl('')
					break
				case 'Catalogue Profile - P30 &P64':
					WebUI.navigateToUrl('')
					break
				case 'PMMS Equipment Criticality Catalogue Profile':
					WebUI.navigateToUrl('')
					break
				case 'Petronas Business Nature':
					WebUI.navigateToUrl('')
					break
				case 'Failure Words':
					WebUI.navigateToUrl('')
					break
				case 'Compiled Words Check':
					WebUI.navigateToUrl('')
					break
				case 'Abbreviations':
					WebUI.navigateToUrl('')
					break
				case 'Valve Assemblies':
					WebUI.navigateToUrl('')
					break
				case 'Msel Assemblies':
					WebUI.navigateToUrl('')
					break
				case 'Chemicals Affecting Equipment':
					WebUI.navigateToUrl('')
					break
				case 'Equipment Sensitivity To Content':
					WebUI.navigateToUrl('')
					break
				case 'Contract Catalog Report':
					WebUI.navigateToUrl('')
					break
				case 'OPU View':
					WebUI.navigateToUrl('')
					break
				case 'SRC Secretary View':
					WebUI.navigateToUrl('')
					break
				case 'Landing Page For Material Forecast':
					WebUI.navigateToUrl('')
					break
				case 'Material Forecast Report':
					WebUI.navigateToUrl('https://uat.mmworkspace.petronas.com/material-forecast-analyzer/report')
					WebUI.waitForElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'Material Forecast Report']), GlobalVariable.MIN_WAIT)
					WebUI.verifyElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'Material Forecast Report']))
					break
				case 'Petronas Reliability Data (PREDA)':
					WebUI.navigateToUrl('https://uat.mmworkspace.petronas.com/material-forecast-analyzer/petronas-reliability-data/materials')
					WebUI.waitForElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'Petronas Reliability Data (PREDA)']), GlobalVariable.MIN_WAIT)
					WebUI.verifyElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'Petronas Reliability Data (PREDA)']))
					break
				default:
					throw new Exception('Invalid page')
			}
		}
	}
	
	@When("I hover the mouse to {string} button")
	def i_hover_the_mouse_to_button(String btn) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':btn]), GlobalVariable.MIN_WAIT)
		Actions actions = new Actions(DriverFactory.getWebDriver())
		actions.moveToElement(WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':btn]), GlobalVariable.MIN_WAIT)).perform()
	}
	
	@Then("A tooltip with message {string} should be display")
	def a_tooltip_with_message_should_be_display(String mess) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/div_class',['param':'MuiTooltip-tooltip']), GlobalVariable.MIN_WAIT)
		String text = WebUI.getText(findTestObject('Object Repository/Common/div_class',['param':'MuiTooltip-tooltip']))
		Assert.assertEquals(mess, text, 'Two messages are not equal')
	}
}