import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject

import java.time.Year

import com.kms.katalon.core.annotation.Keyword
import com.kms.katalon.core.checkpoint.Checkpoint
import com.kms.katalon.core.checkpoint.CheckpointFactory
import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
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
import org.openqa.selenium.Keys

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



class StockProposalSummary {
	@Then("Stock Proposal Summary should contain {int} status count")
	def stock_proposal_summary_should_contain_status_count(int status, DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/div_StatusCount'), GlobalVariable.MIN_WAIT)
		List<WebElement> listName = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/div_StatusCount'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//h6"))
		Assert.assertEquals(listName.size(), status, 'Expected '+status+' but get '+listName.size())
		for(int i=0; i<dTable.size(); i++) {
			Assert.assertEquals(dTable.get(i), listName.get(i).getText(), 'Status Count Name is not correct!')
		}
	}

	@Then("The number of Ref No for each status must match with number in status count")
	def the_number_of_ref_no_for_each_status_must_match_with_number_in_status_count() {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/div_StatusCount'), GlobalVariable.MAX_WAIT)
		List<WebElement> listNum = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/div_StatusCount'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//h1"))
		List<WebElement> listName = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/div_StatusCount'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//h6"))
		for(int i=0; i<listName.size(); i++) {
			String status = listName.get(i).getText().trim()
			String numberRefNo = listNum.get(i).getText().trim()
			//Select status
			switch(status) {
				case 'Endorsement Completed':
					status = 'Completed Endorsement';
					break
				case 'Partially Endorsed':
					status = 'Endorsed Partially';
					break
				case 'Pending for Deliberation':
					status = 'Pending for Deliberation';
					break
				case 'SPF Cancelled':
					status = 'SPF Cancelled';
					break
				default:
					throw new Exception('Invalid input')
			}
			WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/span_filter',['param':'Status:']))
			WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/form_DropDownForm'), GlobalVariable.MIN_WAIT)
			WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/input_optionInDropdown',['param':status]))
			WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':'Apply']))
			//Click expand list
			WebUI.waitForElementPresent(findTestObject('Object Repository/Common/input_classParam',['param':'MuiSelect-nativeInput']), GlobalVariable.MIN_WAIT)
			WebUI.scrollToElement(findTestObject('Object Repository/Common/input_classParam',['param':'MuiSelect-nativeInput']), GlobalVariable.MIN_WAIT)
			WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/input_classParam',['param':'MuiSelect-nativeInput']), GlobalVariable.MIN_WAIT).findElement(By.xpath("./parent::div")).click()
			WebUI.waitForElementPresent(findTestObject('Object Repository/Common/ul_listBox'), GlobalVariable.MIN_WAIT)
			WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/ul_listBox'), GlobalVariable.MIN_WAIT).findElement(By.xpath("./li[text()='100']")).click()
			//Check number of status
			List<Map<String, String>> table = utils.extractDataTableWithText(findTestObject('Object Repository/Common/Table/table_Table'))
			Assert.assertEquals(table.size(), Integer.parseInt(numberRefNo), 'The number in table not match with number in status count')
			for(int j=0; j<table.size(); j++) {
				Assert.assertEquals(table.get(j).get('Status').replace("\n", " ").toLowerCase(), status.toLowerCase(), 'Status in index '+j+' not mactch')
			}
			//De-select status
			WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/span_filter',['param':'Status:']))
			WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/form_DropDownForm'), GlobalVariable.MIN_WAIT)
			WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/input_optionInDropdown',['param':status]))
			WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':'Apply']))
		}
	}

	@When("I get a list of all plant code in Stock Proposal Summary")
	def i_get_a_list_of_all_plant_code_in_stock_proposal_summary() {
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/span_filter',['param':'Plant Code - Plant Name:']))
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/form_DropDownForm'), GlobalVariable.MIN_WAIT)
		List<WebElement> list = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/form_DropDownForm'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//p"))
		ArrayList<String> newList = new ArrayList<String>()
		ArrayList<String> newList2 = new ArrayList<String>()
		for(int i=0; i<list.size(); i++) {
			newList.add(list.get(i).getText())
			newList2.add(list.get(i).getText().split("-")[0])
		}
		utils.addGlobalVariable('PLANT_CODE_FULL', newList)
		utils.addGlobalVariable('PLANT_CODE', newList2)
	}

	@Then("All ref no in the table must follow format {string} in Stock Proposal Summary")
	def all_ref_no_in_the_table_must_follow_format_in_stock_proposal_summary(String format) {
		List<String> plantCode = GlobalVariable['PLANT_CODE']
		if(format.equals('SPF/year/code')) {
			List<Map<String, WebElement>> dTable = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))
			for(int i=0; i<dTable.size(); i++) {
				WebElement refNo = dTable.get(i).get('Stock Proposal Ref No')
				String refNoText = refNo.getText()
				//First part is SPF
				Assert.assertEquals(refNoText.split("/")[0], 'SPF', 'The ref no is not started with SPF')
				//Second part is year
				int year = Integer.parseInt(refNoText.split("/")[1])
				int currentYear = Year.now().getValue()
				Assert.assertTrue(year <= currentYear, 'Year larger than current year')
				//Third part is plant code
				Assert.assertTrue(plantCode.contains(refNoText.split("/")[2]), 'The plant code '+refNoText.split("/")[2]+' not in the list')
				//Verify ref no with hyperlink
				Assert.assertTrue(refNo.findElement(By.xpath("./a[@href]")).isDisplayed(), 'The ref no is NOT displayed')
			}
		}else {
			throw new Exception('No matching format')
		}
	}

	@Then("Ref No in Stock Proposal Summary should follow rule of status {string}")
	def ref_no_in_stock_proposal_summary_should_follow_rule_of_status(String status) {
		Actions actions = new Actions(DriverFactory.getWebDriver())
		if(status.equals('Pending Deliberation Cancel')) {
			List<Map<String, WebElement>> dTable = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))
			for(int i=0; i<dTable.size(); i++) {
				Assert.assertEquals(dTable.get(i).get('Status').getText().replace("\n", " "), 'PENDING FOR DELIBERATION', 'Status is not matched!')
				String RefNo = dTable.get(i).get('Stock Proposal Ref No').getText()
				//TC431705
				actions.moveToElement(dTable.get(i).get('Action').findElement(By.xpath(".//button"))).perform();
				WebUI.verifyElementPresent(findTestObject('Object Repository/Common/div_text',['param':'Cancel SPF']), GlobalVariable.MIN_WAIT)
				dTable.get(i).get('Action').findElement(By.xpath(".//button")).click()
				WebUI.waitForElementPresent(findTestObject('Object Repository/Common/div_dialog'), GlobalVariable.MIN_WAIT)
				//pop up
				String message = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/div_dialog'), GlobalVariable.MIN_WAIT).findElement(By.xpath(".//p/span")).getText()
				Assert.assertEquals(message, 'Are you sure that you want to cancel this ('+RefNo+')?', 'Message is not matched!')
				WebUI.verifyElementVisible(findTestObject('Object Repository/Common/button_label', ['title' : 'Cancel']))
				WebUI.verifyElementVisible(findTestObject('Object Repository/Common/button_label', ['title' : 'Ok']))
				WebUI.click(findTestObject('Object Repository/Common/button_label', ['title' : 'Cancel']))
			}
		}else if(status.equals('Pending Deliberation')) {
			List<Map<String, String>> dTable = utils.extractDataTableWithText(findTestObject('Object Repository/Common/Table/table_Table'))
			for(int i=0; i<dTable.size(); i++) {
				String EndorseItem = dTable.get(i).get('Total/Pending Endorse Item')
				String statusTable = dTable.get(i).get('Status')
				Assert.assertEquals(EndorseItem.split("/")[0], EndorseItem.split("/")[1], 'Number of Endorse Items are not the same')
				Assert.assertEquals(dTable.get(i).get('Status').replace("\n", " "), 'PENDING FOR DELIBERATION', 'Status is not correct!')
			}
		}else if(status.equals('Completed Endorsement')) {
			List<Map<String, String>> dTable = utils.extractDataTableWithText(findTestObject('Object Repository/Common/Table/table_Table'))
			for(int i=0; i<dTable.size(); i++) {
				String EndorseItem = dTable.get(i).get('Total/Pending Endorse Item')
				String statusTable = dTable.get(i).get('Status')
				Assert.assertEquals(Integer.parseInt(EndorseItem.split("/")[1]), 0, 'The Ref No still have item need to be endorsed!')
				Assert.assertEquals(dTable.get(i).get('Status').replace("\n", " "), 'COMPLETED ENDORSEMENT', 'Status is not correct!')
			}

		}else if(status.equals('Endorsed Partially')){
			List<Map<String, String>> dTable = utils.extractDataTableWithText(findTestObject('Object Repository/Common/Table/table_Table'))
			for(int i=0; i<dTable.size(); i++) {
				String EndorseItem = dTable.get(i).get('Total/Pending Endorse Item')
				String statusTable = dTable.get(i).get('Status')
				Assert.assertTrue(Integer.parseInt(EndorseItem.split("/")[0]) > Integer.parseInt(EndorseItem.split("/")[1]), 'Number of Endorse Items are not the same')
				Assert.assertTrue(Integer.parseInt(EndorseItem.split("/")[1]) > 0, 'Number of Endorse Items are not the same')
				Assert.assertEquals(dTable.get(i).get('Status').replace("\n", " "), 'ENDORSED PARTIALLY', 'Status is not correct!')
			}
		}else if(status.equals('All status')) {
			List<Map<String, WebElement>> dTable = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))
			for(int i=0; i<dTable.size(); i++) {
				String tableStatus = dTable.get(i).get('Status').getText().replace("\n", " ")
				if(!tableStatus.equals('COMPLETED ENDORSEMENT') && !tableStatus.equals('ENDORSED PARTIALLY') && !tableStatus.equals('SPF CANCELLED')) {
					Assert.assertTrue(dTable.get(i).get('Action').findElement(By.xpath(".//button")).isDisplayed(), 'Cancel button not displayed in pending deliberation status!')
				}
			}
		}else {
			throw new Exception("Invalid input")
		}
	}

	@Then("Stock Proposal Summary column still be displayed when scroll in Stock Proposal Summary")
	def stock_proposal_summary_column_still_be_displayed_when_scroll_in_stock_proposal_summary() {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/input_selectAll'), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/input_selectAll'))
		for(int i=0; i<5; i++) {
			WebUI.sendKeys(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/input_selectAll'), Keys.chord(Keys.ARROW_RIGHT))
		}
		WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Table/table_Table'), GlobalVariable.MIN_WAIT).findElement(By.xpath(".//tr/th//span[text()='Stock Proposal Ref No']")).isDisplayed()
	}


	@When("I verify {string} in Stock Proposal Summary with Ref No")
	def I_verify_field_in_stock_proposal_summary_with_ref_no(String field) {

		List<Map<String, WebElement>> dTable = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))
		Random rand = new Random();
		int i = rand.nextInt(dTable.size())
		String refNoText = dTable.get(i).get('Stock Proposal Ref No').getText().replace("\n", " ")
		String compareText = dTable.get(i).get(field).getText().replace("\n", " ")
		utils.addGlobalVariable('REF_NO_TEXT', refNoText)
		utils.addGlobalVariable('COMPARE_TEXT', compareText)
	}

	@When("I click on Cancel action in Stock Proposal Summary")
	def I_click_on_cancel_action_in_stock_proposal_summary() {
		Actions actions = new Actions(DriverFactory.getWebDriver())
		List<Map<String, WebElement>> dTable = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))
		Random rand = new Random();
		int i = rand.nextInt(dTable.size())
		String RefNo = dTable.get(i).get('Stock Proposal Ref No').getText()
		actions.moveToElement(dTable.get(i).get('Action').findElement(By.xpath(".//button"))).perform();
		WebUI.verifyElementPresent(findTestObject('Object Repository/Common/div_text',['param':'Cancel SPF']), GlobalVariable.MIN_WAIT)
		dTable.get(0).get('Action').findElement(By.xpath(".//button")).click()
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/div_dialog'), GlobalVariable.MIN_WAIT)
		String message = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/div_dialog'), GlobalVariable.MIN_WAIT).findElement(By.xpath(".//p/span")).getText()
		Assert.assertEquals(message, 'Are you sure that you want to cancel this ('+RefNo+')?', 'Message is not matched!')
		WebUI.verifyElementVisible(findTestObject('Object Repository/Common/button_label', ['title' : 'Cancel']))
		WebUI.verifyElementVisible(findTestObject('Object Repository/Common/button_label', ['title' : 'Ok']))
		WebUI.click(findTestObject('Object Repository/Common/button_label', ['title' : 'Ok']))

		utils.addGlobalVariable('REF_NO', RefNo)
	}

	@Then("Endorsed Rejected Line Item field should be displayed")
	def endorsed_rejected_line_item_field_should_be_displayed() {
		String endorsedItem = WebUI.getText(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/h6_text_second_node',['param':'Endorsed Item']))
		String rejectedItem = WebUI.getText(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/h6_text_second_node',['param':'Rejected Item']))
		String compare = GlobalVariable.COMPARE_TEXT
		Assert.assertTrue(endorsedItem.split(" ")[0].equals(compare.split("/")[0]), 'Endorsed item does not match')
		Assert.assertTrue(rejectedItem.split(" ")[0].equals(compare.split("/")[1]), 'Rejected item does not match')

	}

	@Then("All Ref No with status SPF Cancelled should not contain checkbox and are disabled")
	def all_ref_no_with_status_spf_cancelled_should_not_contain_checkbox_and_are_disabled() {
		List<Map<String, WebElement>> UI = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<UI.size(); i++) {
			List<WebElement> checkbox = UI.get(i).get('').findElements(By.xpath(".//input[@type='checkbox']"))
			Assert.assertEquals(checkbox.size(), 0, 'Checkbox is displayed with Ref No Cancelled')
			List<WebElement> url = UI.get(i).get('Stock Proposal Ref No').findElements(By.xpath("./a/h6"))
			Assert.assertEquals(url.size(), 0, 'Stock proposal ref no is not disabled')
		}
	}
}