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
import org.openqa.selenium.interactions.Actions
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



class SPFSubmission {
	@When("I select {string} Plan Code - Plan Name")
	def select_plant_code_plant_name(String plantcode) {
		WebUI.waitForElementVisible(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/div_plantCodeNameTextBox', ['param' : 'plant']), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/div_plantCodeNameTextBox', ['param' : 'plant']))
		WebUI.setText(findTestObject('Object Repository/Common/input_Placeholder',['param':'Please select Plant Code - Plant Name']), plantcode)
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/span_plantCodeNameDropdown', ['param' : plantcode]))
		utils.addGlobalVariable('inputPlantCode', WebUI.getAttribute(findTestObject('Object Repository/Common/Login/button_SignIn', ['param': plantcode]), 'value'))
	}

	//observe the requester name in SPF Submission page
	@When("I observe the requester name")
	def observe_requester_name() {
		WebUI.waitForElementVisible(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/p_requesterName', ['param': 'Requester']), GlobalVariable.MIN_WAIT)
		utils.addGlobalVariable('REQUESTER_SUBMIT', WebUI.getText(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/p_requesterName', ['param': 'Requester'])))
	}

	@When("I input data into fields in SPF Submission")
	def i_input_data_into_fields_in_spf_submission(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		Actions action = new Actions(DriverFactory.getWebDriver())
		for(int i=0; i<dTable.size(); i++) {
			Set<String> keyName = dTable.get(i).keySet()
			String matno = dTable.get(i).get('Material No')
			String leadtime = dTable.get(i).get('Lead Time')
			String unitprice = dTable.get(i).get('Estimated Unit Price')
			for(String key : keyName) {
				switch(key) {
					case 'Material No':
						WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/td_cellInSubmission', ['param': 'cellLeft', 'param1' : i+1]))
						if(matno.contains('Global')) {
							matno = GlobalVariable[matno.split("-",2)[1]]
						}
						action.sendKeys(matno).build().perform()
						break
					case 'Lead Time':
						WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/td_cellInSubmission', ['param': 'cellCenter', 'param1' : i+1]))
						action.sendKeys(leadtime).build().perform()
						break
					case 'Estimated Unit Price':
						WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/td_cellInSubmission', ['param': 'cellRight', 'param1' : i+1]))
						action.sendKeys(unitprice).build().perform()
						break
					default:
						throw new Exception('Invalid input')
				}
			}
		}
	}

	@Then("Field in the website should contain red asterisk")
	def field_in_the_website_should_contain_red_asterisk(DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		for(int i=0; i<dTable.size(); i++) {
			String name = dTable.get(i)
			Assert.assertEquals(WebUI.getCSSValue(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/p_compulsoryField',['param':name]), 'color'), 'rgba(224, 32, 32, 1)', 'Color is not corred')
		}
	}

	@When("I input value {string} into the search box {string} of field {string}")
	def i_input_value_into_search_box_of_field(String value, String placeholder, String fieldName) {
		WebUI.click(findTestObject('Object Repository/Common/Filters/input_SearchTextBox', ['title' : fieldName, 'param':placeholder]))
		WebUI.setText(findTestObject('Object Repository/Common/Filters/input_SearchTextBox', ['title' : fieldName, 'param':placeholder]), value)
	}

	@Then("Table in SPF Submission should contain 3 columns")
	def table_in_spf_submission_should_contain_3_columns(DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		WebUI.delay(5)
		List<WebElement> columns = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/table_htCore',['param':'ht_master']), GlobalVariable.MIN_WAIT).findElements(By.xpath("./thead//th//span[contains(@class,'title')]"))
		Assert.assertEquals(columns.size(), 3, 'Size is not equal')
		for(int i=0; i<columns.size(); i++) {
			Assert.assertEquals(dTable.get(i), columns.get(i).getText(), 'Name is not equal '+dTable.get(i) + ' ' + columns.get(i).getText())
		}
	}

	@Then("Cell of {string} should have data as expected result in SPF Submission")
	def cell_of_should_have_data_as_expected_result_in_spf_submission(String cell, DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		List<String> cells = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/td_allCellInSubmission',['param':cell]), GlobalVariable.MIN_WAIT).collect({x -> x.getText()})
		cells.removeAll(Collections.singleton(''));
		for(int i=0; i<cells.size(); i++) {
			Assert.assertEquals(cells.get(i), dTable.get(i), 'Two data are not equal')
		}
	}

	@Then("The icon in column header {string} should be {string}")
	def the_icon_in_column_header_should_be(String column, String title) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/span_iconInTable',['param':column]), GlobalVariable.MIN_WAIT)
		String text = WebUI.getAttribute(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/span_iconInTable',['param':column]), 'title')
		Assert.assertEquals(text, title, 'Text messages are not match')
	}

	@When("I get the Reference No in the SPF Recommendation and Deliberation Submission")
	def i_get_the_reference_no_in_the_spf_recommendation_and_deliberation_submission() {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Recommend and Deliberation/span_Element Text',['param':'Requester']), GlobalVariable.MAX_WAIT)
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Recommend and Deliberation/span_Element Text',['param':'Reference No']), GlobalVariable.MAX_WAIT)
		utils.addGlobalVariable('REQUESTER', WebUI.getText(findTestObject('Object Repository/Initial Spare Analyzer/SPF Recommend and Deliberation/span_Element Text',['param':'Requester'])))
		utils.addGlobalVariable('REFERENCE_NO', WebUI.getText(findTestObject('Object Repository/Initial Spare Analyzer/SPF Recommend and Deliberation/span_Element Text',['param':'Reference No'])))
	}

	@Then("SPF Recommendation and Deliberation Submission page should contain requester name no and two tabs")
	def spf_recommendation_and_deliberation_submission_page_should_contain_requester_name_no_and_two_tabs() {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Recommend and Deliberation/span_Element Text',['param':'Requester']), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Recommend and Deliberation/span_Element Text',['param':'Requester']), GlobalVariable.MIN_WAIT)
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Recommend and Deliberation/span_Element Text',['param':'Reference No']), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Recommend and Deliberation/span_Element Text',['param':'Reference No']), GlobalVariable.MIN_WAIT)
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':'submission for deliberation']), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':'submission for deliberation']), GlobalVariable.MIN_WAIT)
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':'insufficient data for recommendation']), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':'insufficient data for recommendation']), GlobalVariable.MIN_WAIT)
	}

	@Then("SPF Recommendation and Deliberation Submission page should focus on {string} tab")
	def spf_recommendation_and_deliberation_submission_page_should_focus_on_tab(String tab) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':tab]), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':tab]), GlobalVariable.MIN_WAIT)
		String selected = WebUI.getAttribute(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':tab]), 'class')
		Assert.assertTrue(selected.contains('Mui-selected'), 'Tab is not selected')
	}

	@Then("All matertial no in Submission page should be equal with {string}")
	def all_material_no_in_submission_page_should_be_equal_with(String list) {
		List<String> UI = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/table_htCore',['param':'ht_master']), GlobalVariable.MIN_WAIT).findElements(By.xpath("./tbody/tr/td[2]")).collect({ x->x.getText()})
		List<String> mat_no = GlobalVariable[list]
		Collections.sort(UI)
		Collections.sort(mat_no)
		for(int i=0; i<UI.size(); i++) {
			Assert.assertEquals(UI.get(i), mat_no.get(i), 'Mat no are not the same '+UI.get(i)+' and '+mat_no.get(i))
		}
	}
	
	@Then("Message in pop up SPF Submission should be displayed as {string}")
	def message_in_pop_up_spf_submission_should_be_displayed_as(String text) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/p_alertTextMessage'), GlobalVariable.MIN_WAIT)
		String alert = WebUI.getText(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/p_alertTextMessage'))
		Assert.assertEquals(text, alert, 'Two messages are not equal')
	}
}