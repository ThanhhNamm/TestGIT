import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject

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



class testing {
	@When("I get all list of current page")
	def i_get_all_list_of_current_page() {
		List<Map<String, String>> UI = utils.extractDataTableWithText(findTestObject('Object Repository/Common/Table/table_Table'))
		List<String> column = new ArrayList<String>()
		for(int i=0; i<UI.size(); i++) {
			String text = UI.get(i).get('Stock Proposal Ref No')
			column.add(text)
		}
		utils.addGlobalVariable('LIST', column)
	}

	@When("I input data to deliberation and submit")
	def i_input_data_to_deliberation_and_submit() {
		Actions actions = new Actions(DriverFactory.getWebDriver())
		List<String> list = GlobalVariable['LIST']
		for(int i=0; i<1; i++) {
			WebUI.waitForElementPresent(findTestObject('Object Repository/Common/input_Placeholder',['param':'Search by keyword']), GlobalVariable.MIN_WAIT)
			WebUI.sendKeys(findTestObject('Object Repository/Common/input_Placeholder',['param':'Search by keyword']), Keys.chord(Keys.CONTROL, 'a', Keys.BACK_SPACE))
			WebUI.sendKeys(findTestObject('Object Repository/Common/input_Placeholder',['param':'Search by keyword']), list.get(i))
			List<Map<String, WebElement>> table = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/table_SpfTracking'))
			for(int j=0; j<table.size(); j++) {
				if(table.get(j).get('Stock Proposal Ref No').findElement(By.xpath(".//a/h6")).getText().trim().equalsIgnoreCase(list.get(i))) {
					table.get(j).get('Stock Proposal Ref No').findElement(By.xpath(".//a/h6[normalize-space(text())='"+ list.get(i) + "']")).click()
				}
			}
			WebUI.waitForElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'SPF Recommendation and Deliberation Submission']), GlobalVariable.MIN_WAIT)
			WebUI.delay(5)
			//			for(int k=0; k<ele.size(); k++) {
			//				ele.get(k).findElement(By.xpath(".//input/parent::td")).click()
			//				actions.sendKeys(Keys.TAB)
			//			}
		}
	}
	
	@When("I want to write a step")
	def i_input_data_to_deliberation_and_submit(DataTable table) {
		List<Map> abc = table.asMaps()
		abc.each { 
			println it.get('TABLE').split("_",2)
			println it.get('TABLE').split("_",2)[0]
			println it.get('TABLE').split("_",2)[1]
		}
	}
	
}