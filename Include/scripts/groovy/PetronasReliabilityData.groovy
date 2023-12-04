import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import static org.junit.Assert.assertEquals

import org.openqa.selenium.By
import org.openqa.selenium.WebElement
import org.testng.Assert

import com.kms.katalon.core.testdata.TestData
import com.kms.katalon.core.testobject.TestObject
import com.kms.katalon.core.webui.common.WebUiCommonHelper
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI

import common.customKW
import common.utils
import cucumber.api.java.en.Then
import cucumber.api.java.en.When
import internal.GlobalVariable
import io.cucumber.datatable.DataTable

class PetronasReliabilityData {
	@When("I click on {string} search box in PREDA")
	def click_on_searchbox(String boxname) {
		WebUI.click(findTestObject('Object Repository/Common/Filters/div_SearchBox', [title : boxname]))
	}

	@When("I click on {string} search arrow in PREDA")
	def click_on_searcharrow(String boxname) {
		WebUI.click(findTestObject('Object Repository/Common/Filters/button_SearchArrow', [title : boxname]))
	}

	@When("I select {string} option in {string} field in PREDA")
	def select_option_in_field(String option, String fields) {
		WebUI.click(findTestObject('Object Repository/Common/Filters/input_SearchTextBox', [title : fields]))
		WebUI.sendKeys(findTestObject('Object Repository/Common/Filters/input_SearchTextBox', [title : fields]), option)
		//		WebUI.verifyElementVisible(findTestObject('Object Repository/Common/Filters/input_CheckBox', [option : option]), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Common/Filters/input_CheckBox', [option : option]))
		WebUI.verifyElementVisible(findTestObject('Object Repository/Common/Filters/div_SeletedOption', [option : option]), GlobalVariable.MIN_WAIT)
	}

	@Then("Table should display correct data based on selected {string} in PREDA")
	def verify_PREDA_searchresult(String option) {
		//		String Filter = WebUI.getText(findTestObject('Object Repository/Common/Filters/div_SearchBox', [title : title]))
		//		Assert.assertEquals( , , 'false')
	}

	@Then("Number of search boxes should be displayed correctly in PREDA")
	def verify_searchboxes_display(DataTable fields) {
		List<String> boxnames = fields.asList()
		List<String> elmText = customKW.getTextElements(findTestObject('Object Repository/Common/Filters/p_BoxNameLists'))
		customKW.verifyLists(elmText, boxnames)
		assertEquals(elmText.size(), boxnames.size())
	}

	@When("I input {string} into {string} search box in PREDA")
	def input_key_into_searchbox(String text, String fields) {
		WebUI.click(findTestObject('Object Repository/Common/Filters/input_SearchTextBox', ['title' : fields, 'param':'Search and Select']))
		WebUI.setText(findTestObject('Object Repository/Common/Filters/input_SearchTextBox', ['title' : fields, 'param':'Search and Select']), text)
	}

	@Then("{string} should be contained in search results in PREDA")
	def verify_key_with_result(String text) {
		List<String> results = customKW.getTextElements(findTestObject('Object Repository/Common/Filters/p_SearchResults'))
		for (String i : results) {
			Assert.assertTrue(i.contains(text.toUpperCase()), 'Search word is not the same as in results')
		}
	}

	@Then("All records in the table should have data match with value in search box")
	def all_records_in_the_table_should_have_data_match_with_value_in_search_box(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		List<Map<String, String>> UI = utils.extractDataTableWithAllPages(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<UI.size(); i++) {
			for(int j=0; j<dTable.size(); j++) {
				String column = dTable.get(j).get('Column')
				String operator = dTable.get(j).get('Operator')
				String value = dTable.get(j).get('Value')
				switch(operator.toUpperCase()) {
					case 'EQUAL':
						Assert.assertEquals(UI.get(i).get(column), value, 'Value in index '+i+' is not correct')
						break
					default:
						throw new Exception('Invalid operator')
				}
			}
		}
	}

	@Then("All icon in Failure Probability column should contain data as in excel file")
	def all_icon_in_failure_probability_column_should_contain_data_as_in_excel_file() {
		TestData file = findTestData('Data Files/US 17/Preda Materials')
		List<String> column = Arrays.asList(file.getColumnNames())
		List<Map<String, WebElement>> table = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<table.size(); i++) {
			table.get(i).get('Failure Probability (Years)').findElement(By.xpath(".//*[local-name()='svg' and @data-testid='InfoIcon']")).click()
			WebUI.waitForElementPresent(findTestObject('Object Repository/Common/div_dialog'), GlobalVariable.MIN_WAIT)
			TestObject newTable = WebUI.convertWebElementToTestObject(WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/div_dialog'), GlobalVariable.MIN_WAIT).findElement(By.xpath(".//table")))
			List<Map<String, String>> table2 = utils.extractDataTableWithText(newTable)
			List<String> newColumnList = column.subList(column.size() - table2.size(), column.size())
			for(int j=0; j<table2.size(); j++) {
				Assert.assertEquals(table2.get(j).get('Years'), newColumnList.get(j))
			}
			WebUI.click(findTestObject('Object Repository/Avatar/Role Management/svg_param',['param':'CloseIcon']))
		}
	}
}