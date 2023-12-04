import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject

import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

import javax.swing.table.TableColumn

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
import common.utils
import internal.GlobalVariable
import io.cucumber.datatable.DataTable

import org.openqa.selenium.WebElement
import org.openqa.selenium.interactions.Actions
import org.openqa.selenium.support.ui.ExpectedConditions
import org.openqa.selenium.support.ui.WebDriverWait
import org.testng.Assert
import org.openqa.selenium.WebDriver
import org.checkerframework.checker.units.qual.Length
import org.openqa.selenium.By
import org.openqa.selenium.JavascriptExecutor
import org.openqa.selenium.Keys
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



class StockProposalDeliberation {

	@When("I input {string} number into SRC Seating No")
	def i_input_number_into_src_seating_no(String number) {
		Random generator = new Random();
		if(number.equals('valid')) {
			Boolean check = false;
			while(check == false){
				int num = generator.nextInt(999999)
				WebUI.waitForElementPresent(findTestObject('Object Repository/Common/input_name',['param':'src_no']), GlobalVariable.MIN_WAIT)
				WebUI.setText(findTestObject('Object Repository/Common/input_name',['param':'src_no']), String.valueOf(num))
				if(WebUI.waitForElementNotPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/h6_text',['param':'is already exist.']), GlobalVariable.MIN_WAIT)) {
					check = true
				}
			}
		}
		utils.addGlobalVariable('SRC_NO', WebUI.getAttribute(findTestObject('Object Repository/Common/input_name',['param':'src_no']), 'value'))
	}

	@Then("Message should {string} when a number is input into SRC Seating No")
	def message_should_when_a_number_is_input_into_src_seating_no(String message) {
		switch(message) {
			case 'not display':
				WebUI.waitForElementNotPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/h6_text',['param':'is already exist.']), GlobalVariable.MIN_WAIT)
				WebUI.verifyElementNotPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/h6_text',['param':'is already exist.']), GlobalVariable.MIN_WAIT)
				break
			case 'display':
				WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/h6_text',['param':'is already exist.']), GlobalVariable.MIN_WAIT)
				WebUI.verifyElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/h6_text',['param':'is already exist.']), GlobalVariable.MIN_WAIT)
				break
			default:
				throw new Exception('Invalid input')
		}
	}

	@Then("Data with checkbox in Stock Proposal Deliberation table should {string} to value in data table")
	def data_with_checkbox_in_stock_proposal_deliberation_table_should_to_value_in_data_table(String text, DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		List<Map<String, WebElement>> table = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int j=0; j<table.size(); j++) {
			for(int i=0; i<dTable.size(); i++) {
				String column = dTable.get(i).get('Column')
				String value = dTable.get(i).get('Value')
				try{
					if(table.get(j).get('').findElement(By.xpath(".//input[@type='checkbox']")).isSelected()) {
						String textFromTable
						if(table.get(j).get(column).findElement(By.xpath(".//input")).isDisplayed()) {
							textFromTable = table.get(j).get(column).findElement(By.xpath(".//input")).getAttribute("value")
						}else {
							textFromTable = table.get(j).get(column).getText().trim()
						}
						switch(text) {
							case 'equal':
								Assert.assertTrue(textFromTable.equals(value), 'Two values are not equal')
								break
							case 'not equal':
								Assert.assertFalse(textFromTable.equals(value), 'Two values are the same')
								break
							default:
								throw new Exception('Invalid Input')
						}
					}
				}catch(NoSuchElementException e) {
					continue
				}
			}
		}
	}

	@When("I input data into first row of table with Endorsement {string}")
	def i_input_data_into_first_row_of_table_with_endorsement(String status, DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		List<Map<String, WebElement>> table = utils.extractDataTableWithoutSyntax(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<table.size(); i++) {
			try {
				//check button
				if(table.get(i).get('Endorsement').findElement(By.xpath(".//div[@aria-label='Endorse' or @aria-label='Reject']/button")).isDisplayed()) {
					//input data
					for(int j=0; j<dTable.size(); j++) {
						String column = dTable.get(j).get('Column')
						String value = dTable.get(j).get('Value')
						//input data
						TestObject to = WebUI.convertWebElementToTestObject(table.get(i).get(column).findElement(By.xpath(".//input")))
						//select data in endorsement remark
						if(column.equals('Endorsement remarks')) {
							WebUI.sendKeys(to, Keys.chord(Keys.ARROW_RIGHT, Keys.ARROW_RIGHT))
							WebUI.click(to)
							WebUI.sendKeys(to, Keys.chord(Keys.CONTROL, 'a', Keys.BACK_SPACE))
							WebUI.setText(to, value)
							WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/div_listbox'), GlobalVariable.MIN_WAIT)
							WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/span_columnOptions',['param':value]))
						}else {
							WebUI.click(to)
							WebUI.sendKeys(to, Keys.chord(Keys.CONTROL, 'a', Keys.BACK_SPACE))
							table.get(i).get(column).findElement(By.xpath(".//input")).sendKeys(value)
						}
					}
					table.get(i).get('Endorsement').findElement(By.xpath(".//div[@aria-label='"+status+"']/button")).click()
					WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/h2_alertPopup',['param':'Confirmation']), GlobalVariable.MIN_WAIT)
					WebUI.verifyElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/h2_alertPopup',['param':'Confirmation']), GlobalVariable.MIN_WAIT)
					WebUI.click(findTestObject('Object Repository/Common/button_label', ['title':status]))
					WebUI.verifyElementNotPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/h2_alertPopup',['param':'Confirmation']), GlobalVariable.MIN_WAIT)
					utils.addGlobalVariable('MAT_NO', table.get(i).get('Material No'))
					//select check box
					table.get(i).get('').findElement(By.xpath(".//input[@type='checkbox']")).click()
					WebUI.executeJavaScript("window.scrollBy(0,-500)", null)
					//					utils.addGlobalVariable('INDEX', String.valueOf(i))
					GlobalVariable.INDEX = String.valueOf(i)
					break
				}
			}catch(NoSuchElementException e) {
				continue
			}
		}
	}

	@When("I input data into first row of table with in Stock Proposal Deliberation")
	def i_input_data_into_first_row_of_table_with_in_stock_proposal_deliberation(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		List<Map<String, WebElement>> table = utils.extractDataTableWithoutSyntax(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<table.size(); i++) {
			try {
				//check button
				if(table.get(i).get('Endorsement').findElement(By.xpath(".//div[@aria-label='Endorse' or @aria-label='Reject']/button")).isDisplayed()) {
					//input data
					for(int j=0; j<dTable.size(); j++) {
						String column = dTable.get(j).get('Column')
						String value = dTable.get(j).get('Value')
						//input data
						TestObject to = WebUI.convertWebElementToTestObject(table.get(i).get(column).findElement(By.xpath(".//input")))
						//select data in endorsement remark
						if(column.equals('Endorsement remarks')) {
							WebUI.sendKeys(to, Keys.chord(Keys.ARROW_RIGHT, Keys.ARROW_RIGHT))
							WebUI.click(to)
							WebUI.sendKeys(to, Keys.chord(Keys.CONTROL, 'a', Keys.BACK_SPACE))
							WebUI.setText(to, value)
							WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/div_listbox'), GlobalVariable.MIN_WAIT)
							WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/span_columnOptions',['param':value]))
						}else {
							WebUI.click(to)
							WebUI.sendKeys(to, Keys.chord(Keys.CONTROL, 'a', Keys.BACK_SPACE))
							table.get(i).get(column).findElement(By.xpath(".//input")).sendKeys(value)
						}
					}
					break
				}
			}catch(NoSuchElementException e) {
				continue
			}
		}
	}

	@Then("The Column Option pop up should be displayed with {int} selected")
	def the_column_option_pop_up_should_be_displayed_with_selected(int number, DataTable dataTable) {
		Actions actions = new Actions(DriverFactory.getWebDriver());
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/Column Option/div_columnList'), GlobalVariable.MAX_WAIT)
		int count = 0
		for(int i=0; i<dTable.size(); i++) {
			String option = dTable.get(i).get('Options')
			String status = dTable.get(i).get('Status')
			WebElement to = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Column Option/input_Checkboxes',['param':option]), GlobalVariable.MIN_WAIT)
			actions.moveToElement(to);
			actions.perform();
			switch(status) {
				case 'Selected':
					Assert.assertTrue(to.isSelected(), 'The option '+option+' is not in selected status!')
					count++
					break
				case 'Not Selected':
					Assert.assertTrue(!to.isSelected(), 'The option '+option+' is in selected status!')
					break
				default:
					throw new Exception('Invalid input')
			}
		}
		Assert.assertEquals(number, count, 'The number of selected columns is not correct!')
	}

	@Then("The table should contain columns with selected status in Column Options")
	def the_table_should_contain_columns_with_selected_status_in_column_options(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		List<WebElement> tableHeaders = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Table/table_Table'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//th"))
		List<String> list = new ArrayList()
		for(int i=0; i<tableHeaders.size(); i++) {
			list.add(tableHeaders.get(i).getText())
		}
		for(int i=0; i<dTable.size(); i++) {
			String option = dTable.get(i).get('Options')
			if(dTable.get(i).get('Status').equals('Yes')) {
				Assert.assertTrue(list.contains(option), 'Element not exist in table')
			}else {
				Assert.assertTrue(!list.contains(option), 'Element exist in table')
			}
		}
	}

	@Then("Column in table should have data match with expected result")
	def column_in_table_should_have_data_match_with_expected_result(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		List<Map<String, WebElement>> table = utils.extractDataTableWithoutSyntax(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<dTable.size(); i++) {
			String column = dTable.get(i).get('Column')
			String oper = dTable.get(i).get('Operator')
			String expec = dTable.get(i).get('Expected')
			//Expected
			String newFormat = ""
			if(expec.contains('Date Time')) {
				newFormat = expec.split("-",2)[1]
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern(newFormat)
				LocalDateTime now = LocalDateTime.now()
				expec = dtf.format(now)
			}else if(expec.contains('Global')) {
				expec = GlobalVariable[expec.split("-",2)[1]]
			}
			for(int j=0; j<table.size(); j++) {
				//Operators
				String textUI = table.get(j).get(column).getText().trim().replace("\n", " ")
				if(column.equals('Last Modified Date') || column.equals('SPF Submission Date') || column.equals('Uploaded Date')) {
					textUI = utils.convertDateTimeFormat('dd MMM yyyy HH:mm a', newFormat, textUI)
				}else if(column.equals('Deliberation Submission Date')) {
					textUI = utils.convertDateTimeFormat('dd MMM yyyy HH:mm a', 'dd MMM yyyy', textUI)
				}
				String globalIndex = GlobalVariable.INDEX
				switch(oper.toUpperCase()) {
					case 'CONTAINS':
						if(globalIndex == '') {
							Assert.assertTrue(textUI.contains(expec), 'Data '+textUI+' in column does not contain expected result')
						}else {
							Assert.assertTrue(table.get(Integer.parseInt(globalIndex)).get(column).getText().trim().replace("\n", " ").contains(expec), 'Data '+table.get(Integer.parseInt(globalIndex)).get(column).getText().trim().replace("\n", " ")+' in column does not contain expected result')
						}
						break
					case 'EQUALS':
						if(globalIndex == '') {
							Assert.assertEquals(textUI, expec, 'Two data are not equal')
						}else {
							Assert.assertEquals(table.get(Integer.parseInt(globalIndex)).get(column).getText().trim().replace("\n", " "), expec, 'Two data are not equal')
						}
						break
					case 'CONTAINS AT LEAST':
						int count = 0
						List<WebElement> e = table.get(j).get(column).findElements(By.xpath(".//h6"))
						for(int a=0; a<e.size(); a++) {
							if(e.get(a).getText().contains(expec)) {
								count++
							}
						}
						Assert.assertTrue(count > 0, 'The column '+column+' does not contain any expected data')
						break
					case 'NOT CONTAIN':
						if(globalIndex == '') {
							Assert.assertFalse(textUI.contains(expec), 'Data '+textUI+' in column contain expected result')
						}else {
							Assert.assertFalse(table.get(Integer.parseInt(globalIndex)).get(column).getText().trim().replace("\n", " ").contains(expec), 'Data '+table.get(Integer.parseInt(globalIndex)).get(column).getText().trim().replace("\n", " ")+' in column contain expected result')
						}
						break
					case 'NOT EQUAL':
						if(globalIndex == '') {
							Assert.assertNotEquals(textUI, expec, 'Two datas are equal')
						}else {
							Assert.assertNotEquals(table.get(Integer.parseInt(globalIndex)).get(column).getText().trim().replace("\n", " "), expec, 'Two data are equal')
						}
						break
					case 'EQUALS OR LARGER':
						int fromUI = Integer.parseInt(table.get(j).get(column).getText())
						int fromTable = Integer.parseInt(expec)
						Assert.assertTrue(fromUI >= fromTable, 'Wrong expected')
						break
					case 'EQUALS OR SMALLER':
						int fromUI = Integer.parseInt(table.get(j).get(column).getText())
						int fromTable = Integer.parseInt(expec)
						Assert.assertTrue(fromUI <= fromTable, 'Wrong expected')
						break
					case 'BETWEEN RANGE':
						int num1 = Integer.parseInt(expec.split("-",2)[0])
						int num2 = Integer.parseInt(expec.split("-",2)[1])
						int fromUI = Integer.parseInt(table.get(j).get(column).getText())
						break
					default:
						throw new Exception('Invalid input')
				}
			}
		}
	}

	@When("I click on {string} button pop up in Stock Proposal Deliberation")
	def i_click_on_button_pop_up_in_stock_proposal_deliberation(String button) {
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/button_Popup', ['param' : button]))
	}

	@When("I delete data in the column")
	def i_delete_data_in_the_column(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		List<Map<String, WebElement>> table = utils.extractDataTableWithoutSyntax(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<dTable.size(); i++) {
			String column = dTable.get(i).get('Column')
			String keyword = dTable.get(i).get('Keyword')
			String data = dTable.get(i).get('Data')
			for(int j=0; j<table.size(); j++) {
				if(keyword.equals('h6 to X')) {
					List<WebElement> e = table.get(j).get(column).findElements(By.xpath(".//h6"))
					for(int count=0; count<e.size(); count++) {
						if(e.get(count).getText().contains(data)) {
							TestObject to = WebUI.convertWebElementToTestObject(e.get(count).findElement(By.xpath("./following-sibling::div/button")))
							e.get(count).findElement(By.xpath("./following-sibling::div/button")).click()
							WebUI.waitForElementPresent(findTestObject('Object Repository/Common/button_label', ['title' : 'Ok']), GlobalVariable.MIN_WAIT)
							WebUI.click(findTestObject('Object Repository/Common/button_label', ['title' :'Ok']))
							WebUI.waitForElementNotPresent(to, GlobalVariable.MIN_WAIT)
							WebUI.refresh()
							WebUI.delay(3)
						}
					}
				}
			}
		}
	}

	@Then("User able to input random data into column of Stock Proposal Deliberation")
	def user_able_to_input_random_data_into_column_of_stock_proposal_deliberation(DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		List<Map<String, WebElement>> table = utils.extractDataTableWithoutSyntax(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<table.size(); i++) {
			try {
				if(table.get(i).get('Endorsement').findElement(By.xpath(".//div[@aria-label='Endorse' or @aria-label='Reject']/button")).isDisplayed()) {
					for(int j=0; j<dTable.size(); j++) {
						Assert.assertTrue(!(table.get(i).get(dTable.get(j)).findElement(By.xpath(".//input")).getAttribute('disabled')), 'Element is disabled')
					}
				}
			}catch(NoSuchElementException e) {
				continue
			}
		}
	}

	@Then("User not able to input random data into column of Rejected Stock Proposal Deliberation")
	def user_not_able_to_input_random_data_into_column_of_rejected_stock_proposal_deliberation(DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		List<Map<String, WebElement>> table = utils.extractDataTableWithoutSyntax(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<table.size(); i++) {
			try {
				if(table.get(i).get('Endorsement').findElement(By.xpath(".//div/p[text()='Rejected']")).isDisplayed()) {
					for(int j=0; j<dTable.size(); j++) {
						Assert.assertTrue(!(table.get(i).get(dTable.get(j)).findElement(By.xpath(".//input")).isEnabled()), 'Element is enabled')
					}
				}
			}catch(NoSuchElementException e) {
				continue
			}
		}
	}

	@Then("{string} button in Endorsement column should have color as design")
	def button_in_endorsement_column_should_change_color_as_design(String button) {
		List<Map<String, WebElement>> table = utils.extractDataTableWithoutSyntax(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<table.size(); i++) {
			try {
				if(table.get(i).get('Endorsement').findElement(By.xpath(".//div[@aria-label='Endorse' or @aria-label='Reject']/button")).isDisplayed()) {
					String btnColor = table.get(i).get('Endorsement').findElement(By.xpath(".//div[@aria-label='"+button+"']/button/*[local-name()='svg']")).getCssValue('color')
					switch(button) {
						case 'Reject':
							Assert.assertEquals(btnColor, 'rgba(224, 32, 32, 1)', 'Two colors are not the same')
							break
						case 'Endorse':
							Assert.assertEquals(btnColor, 'rgba(0, 161, 156, 1)', 'Two colors are not the same')
							break
						default:
							throw new Exception('Invalid button')
					}
				}
			}catch(NoSuchElementException e) {
				continue
			}
		}
	}

	@Then("The data in SRC No should be {string}")
	def the_data_in_src_no_should_be(String data) {
		if(data.contains('Global')) {
			data = GlobalVariable[data.split("-",2)[1]]
		}
		Assert.assertEquals(data, WebUI.getAttribute(findTestObject('Object Repository/Common/input_name',['param':'src_no']), 'value'))
	}

	@Then("The Material No in the pop up should contain five highest records")
	def the_material_no_in_the_pop_up_should_contain_five_highest_records() {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/h2_alertPopup',['param':'Material Commonality']), GlobalVariable.MIN_WAIT)
		if(WebUI.waitForElementPresent(findTestObject('Object Repository/Common/p_statusDropdown',['param':'No data to show.']), GlobalVariable.MIN_WAIT)) {
			WebUI.waitForElementNotPresent(findTestObject('Object Repository/Common/p_statusDropdown',['param':'No data to show.']), GlobalVariable.MIN_WAIT)
		}
		String mat_no = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/h2_alertPopup',['param':'Material Commonality']), GlobalVariable.MIN_WAIT).findElement(By.xpath("./following-sibling::div/p/span")).getText()
		//get data from DB
		List<Map<String, String>> dataDB = utils.getDataFromDatabase(mat_no)
		WebElement tableInPopup = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/h2_alertPopup',['param':'Material Commonality']), GlobalVariable.MIN_WAIT).findElement(By.xpath("./following-sibling::div//table"))
		TestObject to = WebUI.convertWebElementToTestObject(tableInPopup)
		//get data from table UI
		List<Map<String, String>> UI = utils.extractDataTableWithText(to)
		Set<String> allKey = UI.get(0).keySet()
		for(int i=0; i<UI.size(); i++) {
			for(int j=0; j<allKey.size(); j++) {
				String valueUI = UI.get(i).get(allKey[j])
				String valueDB = dataDB.get(i).get(allKey[j].replaceAll(" ", "_").toLowerCase())
				Assert.assertEquals(valueUI, valueDB, 'Two values are not equal')
			}
		}
	}

	@Then("Table in Stock Proposal Deliberation should contain buttons Reject and Endorse with items in Pending status")
	def table_in_stock_proposal_deliberation_should_contain_buttons_reject_and_endorse_with_items_in_pending_status() {
		List<Map<String, WebElement>> table = utils.extractDataTableWithoutSyntax(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i>table.size(); i++) {
			try {
				WebElement reject = table.get(i).get('Endorsement').findElement(By.xpath(".//div[@aria-label='Reject']/button"))
				WebElement endorse = table.get(i).get('Endorsement').findElement(By.xpath(".//div[@aria-label='Endorse']/button"))
				Assert.assertTrue(reject.isDisplayed(), 'Button reject is not displayed in row '+i+1)
				Assert.assertTrue(endorse.isDisplayed(), 'Button endorse is not displayed in row '+i+1)
			}catch(NoSuchElementException e) {
				continue
			}
		}
	}

	@Then("SRC Seating No field and Endorsement remarks column should contain error message when data is null")
	def src_seating_no_field_and_endorsement_remarks_column_should_contain_error_message_when_data_is_null() {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/p_textAndClass',['param1':'Mui-error','param2':'This field is required.']), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/p_textAndClass',['param1':'Mui-error','param2':'This field is required.']), GlobalVariable.MIN_WAIT)
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/h6_text',['param':'This field is required.']), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/h6_text',['param':'This field is required.']), GlobalVariable.MIN_WAIT)
	}

	@Then("Columns which have been endorsed or rejected should not contain checkbox")
	def columns_which_have_been_endorsed_or_rejected_should_not_contain_checkbox() {
		List<Map<String, WebElement>> table = utils.extractDataTableWithoutSyntax(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<table.size(); i++) {
			try {
				if(table.get(i).get('Endorsement').findElement(By.xpath(".//div/p[text()='Endorsed' or text()='Rejected']")).isDisplayed()) {
					List<WebElement> checkbox = table.get(i).get('').findElements(By.xpath(".//input[@type='checkbox']"))
					Assert.assertTrue(checkbox.size() == 0, 'Checkbox is displayed')
					println 'XCXC'
				}
			}catch(NoSuchElementException e) {
				continue
			}
		}
	}

	@When("I input data {string} into field {string} in pop up Stock Proposal Deliberation")
	def i_input_data_into_field_in_pop_up_stock_proposal_deliberation(String value, String field) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/input_fieldInPopup',['param':field]), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/input_fieldInPopup',['param':field]))
		WebElement clear = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/input_fieldInPopup',['param':field]), GlobalVariable.MIN_WAIT).findElement(By.xpath("./following-sibling::div/button[@aria-label='Clear']")).click()
		WebUI.setText(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/input_fieldInPopup',['param':field]), value)
		WebUI.sendKeys(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/input_fieldInPopup',['param':field]), Keys.chord(Keys.TAB))
	}

	@Then("The {string} column in Stock Proposal Deliberation should be {string}")
	def the_column_in_stock_proposal_deliberation_should_be(String column, String status) {
		List<Map<String, WebElement>> table = utils.extractDataTableWithoutSyntax(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<table.size(); i++) {
			try {
				if(table.get(i).get('Endorsement').findElement(By.xpath(".//*[@data-testid='CancelIcon' or @data-testid='CheckCircleIcon']")).isDisplayed()) {
					TestObject to = WebUI.convertWebElementToTestObject(table.get(i).get(column).findElement(By.xpath(".//input[not(@disabled)]")))
					WebUI.click(to)
					WebUI.sendKeys(to, Keys.chord(Keys.CONTROL, 'a', Keys.BACK_SPACE))
					WebUI.delay(5)
					switch(status) {
						case 'mandatory':
							Assert.assertTrue(table.get(i).get(column).findElement(By.xpath(".//p[contains(@class,'Mui-error')]")).isDisplayed(), 'Message is not displayed')
							String text = table.get(i).get(column).findElement(By.xpath(".//p[contains(@class,'Mui-error')]")).getText()
							Assert.assertEquals(text, 'This field is required.', 'Two messages are not equal')
							break
						case 'not mandatory':
							List<WebElement> text = table.get(i).get(column).findElements(By.xpath(".//p[contains(@class,'Mui-error')]"))
							Assert.assertEquals(text.size(), 0, 'Message is not displayed')
							break
						default:
							throw new Exception('Invalid input')
					}
				}
			}catch(NoSuchElementException e) {
				println 'ZXc'
				continue
			}
		}
	}

	@Then("Column which is not endorsed or rejected will contain 2 buttons in Endorsement field")
	def column_which_is_not_endorsed_or_rejected_will_contain_2_buttons_in_endorsement_field() {
		List<Map<String, WebElement>> table = utils.extractDataTableWithoutSyntax(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<table.size(); i++) {
			try {
				if(table.get(i).get('Endorsement').findElement(By.xpath(".//div/p[text()='Endorsed' or text()='Rejected']")).isDisplayed()) {
					continue
				}
			}catch(NoSuchElementException e) {
				boolean endorse = table.get(i).get('Endorsement').findElement(By.xpath(".//*[local-name()='svg' and @data-testid='CheckCircleIcon']")).isDisplayed()
				boolean reject = table.get(i).get('Endorsement').findElement(By.xpath(".//*[local-name()='svg' and @data-testid='CancelIcon']")).isDisplayed()
				Assert.assertTrue(endorse, 'Endorse button is not displayed')
				Assert.assertTrue(reject, 'Reject button is not displayed')
			}
		}
	}

	@Then("The value of Endorsed Total value column should be Estimated Unit Price multiple Endorsed")
	def the_value_of_endorsed_total_value_column_should_be_estimated_unit_price_multiple_endorsed() {
		List<Map<String, WebElement>> table = utils.extractDataTableWithoutSyntax(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<table.size(); i++) {
			println 'zxczxc'
			WebElement endorsement = table.get(i).get('Endorsement')
			try {
				if(endorsement.findElement(By.xpath(".//p[text()='Endorsed']")).isDisplayed()) {
					int min = Integer.parseInt(table.get(i).get('Endorsed Min').findElement(By.xpath(".//input")).getAttribute('value'))
					int max = Integer.parseInt(table.get(i).get('Endorsed Max').findElement(By.xpath(".//input")).getAttribute('value'))
					int estimated = Integer.parseInt(table.get(i).get('Estimated Unit Price(RM)').getText())
					int total = Integer.parseInt(table.get(i).get('Endorsed Total Value (RM)').getText().replace(".00", ""))
					if(min > max) {
						max = min
					}
					Assert.assertEquals(estimated * max, total, 'Two values are not equal')
				}
			}catch(NoSuchElementException e) {
				try {
					if(endorsement.findElement(By.xpath(".//*[local-name()='svg' and @data-testid='CheckCircleIcon']")).getCssValue('color').equals('rgba(0, 161, 156, 1)')) {
						int min = Integer.parseInt(table.get(i).get('Endorsed Min').findElement(By.xpath(".//input")).getAttribute('value'))
						int max = Integer.parseInt(table.get(i).get('Endorsed Max').findElement(By.xpath(".//input")).getAttribute('value'))
						int estimated = Integer.parseInt(table.get(i).get('Estimated Unit Price(RM)').getText())
						int total = Integer.parseInt(table.get(i).get('Endorsed Total Value (RM)').getText().replace(".00", ""))
						if(min > max) {
							max = min
						}
						Assert.assertEquals(estimated * max, total, 'Two values are not equal')
					}
				}catch(Exception) {
					continue
				}
			}

		}
	}

	@When("I select random data in the Endorsement remark column")
	def i_select_random_data_in_the_endorsement_remark_column() {
		List<Map<String, WebElement>> table = utils.extractDataTableWithoutSyntax(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<table.size(); i++) {
			WebElement endorsement = table.get(i).get('Endorsement remarks').findElement(By.xpath(".//input"))
			WebUI.sendKeys(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/input_selectAll'), Keys.chord(Keys.ARROW_RIGHT, Keys.ARROW_RIGHT))
			WebUI.delay(2)
			if(!endorsement.getAttribute('class').contains('Mui-disabled')) {
				endorsement.click()
				WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/div_classListBox'), GlobalVariable.MIN_WAIT)
				List<WebElement> list = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/div_classListBox'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//li"))
				Random rand = new Random();
				int randNum = rand.nextInt(list.size())
				list.get(randNum).click()
			}
		}
	}

	@When("I delete all data in Endorsement remark column")
	def i_delete_all_data_in_endorsement_remark_column() {
		List<Map<String, WebElement>> table = utils.extractDataTableWithoutSyntax(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<table.size(); i++) {
			WebElement endorsement = table.get(i).get('Endorsement remarks').findElement(By.xpath(".//input"))
			WebUI.sendKeys(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/input_selectAll'), Keys.chord(Keys.ARROW_RIGHT, Keys.ARROW_RIGHT))
			if(!endorsement.getAttribute('class').contains('Mui-disabled')) {
				((JavascriptExecutor) DriverFactory.getWebDriver()).executeScript("arguments[0].scrollIntoView(false);", endorsement);
				endorsement.click()
				table.get(i).get('Endorsement remarks').findElement(By.xpath(".//*[local-name()='svg' and @data-testid='CloseIcon']")).click()
			}
		}
	}

	@Then("All data in Endorsement remark column should be {string}")
	def all_data_in_endorsement_remark_column_should_be(String value) {
		List<Map<String, WebElement>> table = utils.extractDataTableWithoutSyntax(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<table.size(); i++) {
			WebElement endorsement = table.get(i).get('Endorsement remarks').findElement(By.xpath(".//input"))
			WebUI.sendKeys(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/input_selectAll'), Keys.chord(Keys.ARROW_RIGHT, Keys.ARROW_RIGHT))
			if(!endorsement.getAttribute('class').contains('Mui-disabled')) {
				String attValue = endorsement.getAttribute('value')
				Assert.assertEquals(attValue, value, 'Two values are not equal')
			}
		}
	}

	@Then("Data in the remark list should be sorted by alphabet ascending")
	def data_in_the_remark_list_should_be_sorted_by_alphabet_ascending() {
		List<Map<String, WebElement>> table = utils.extractDataTableWithoutSyntax(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<table.size(); i++) {
			WebElement endorsement = table.get(i).get('Endorsement remarks').findElement(By.xpath(".//input"))
			WebUI.sendKeys(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/input_selectAll'), Keys.chord(Keys.ARROW_RIGHT, Keys.ARROW_RIGHT))
			WebUI.delay(2)
			if(!endorsement.getAttribute('class').contains('Mui-disabled')) {
				endorsement.click()
				WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/div_classListBox'), GlobalVariable.MIN_WAIT)
				List<String> list = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/div_classListBox'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//li//span")).collect({x -> x.getText()})
				List<String> listBeforeSort = list
				Collections.sort(list)
				Assert.assertEquals(listBeforeSort, list, 'Two lists are not equal')
			}
		}
	}

	@When("I get all mat no from table with status")
	def i_get_all_mat_no_from_table_with_status() {
		List<Map<String, String>> dTable = utils.extractDataTableWithText(findTestObject('Object Repository/Common/Table/table_Table'))
		List<Map<String, String>> columnList = new ArrayList<>()
		for(int i=0; i<dTable.size(); i++) {
			Map<String, String> obj = new HashMap<String, String>();
			obj.put('Mat No', dTable.get(i).get('Material No').replace("\n", " "))
			obj.put('Status', dTable.get(i).get('Endorsement').replace("\n", " "))
			columnList.add(obj)
		}
		utils.addGlobalVariable("LIST_MAP", columnList)
	}

	@Then("I check all mat no from all tab with other tabs in stock proposal deliberation")
	def i_check_all_mat_no_from_all_tab_with_other_tabs_in_stock_proposal_deliberation() {
		List<Map<String, String>> columnList = GlobalVariable['LIST_MAP']
		List<WebElement> tabList = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Common/button_class param',['param':'MuiTab-labelIcon']), GlobalVariable.MIN_WAIT)
		//		tabList.remove(0)
		//check all tabs
		for(int i=1; i<tabList.size(); i++) {
			int number = Integer.parseInt(tabList.get(i).findElement(By.xpath("./span[contains(@class,'MuiTab-iconWrapper')]")).getText())
			println 'ZXCZXC '+number
			if(number > 0) {
				tabList.get(i).click()
				WebUI.delay(5)
				List<Map<String, String>> listMap = new ArrayList<>()
				List<Map<String, String>> dTable = utils.extractDataTableWithText(findTestObject('Object Repository/Common/Table/table_Table'))
				//check each matno in each tab
				for(int j=0; j<dTable.size(); j++) {
					for(int k=0; k<columnList.size(); k++) {
						if(columnList.get(k).get('Mat No').equals(dTable.get(j).get('Material No'))) {
							String status = columnList.get(k).get('Status')
							Assert.assertEquals(status, dTable.get(j).get('Endorsement'))
							break
						}
					}
				}
			}
		}
	}

	@When("I verify random Endorsement Remark dropdown")
	def I_verify_random_Endorsement_Remark_dropdown() {
		List<Map<String, WebElement>> table = utils.extractDataTableWithoutSyntax(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<table.size(); i++) {
			try{
				if(table.get(i).get('Endorsement').findElement(By.xpath(".//div[@aria-label='Endorse' or @aria-label='Reject']/button")).isDisplayed()) {
					WebUI.sendKeys(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/input_selectAll'), Keys.chord(Keys.ARROW_RIGHT, Keys.ARROW_RIGHT))
					TestObject to = WebUI.convertWebElementToTestObject(table.get(i).get('Endorsement remarks').findElement(By.xpath(".//input")))
					WebUI.click(to)
					WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/div_listbox'), GlobalVariable.MIN_WAIT)
					List<WebElement> list = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/div_listbox'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//ul//li"))
					Random rand = new Random()
					int randomNumber = rand.nextInt(list.size())
					String textFromDropdown = list.get(randomNumber).getText()
					list.get(randomNumber).click()
					String textFromTable = table.get(i).get('Endorsement remarks').findElement(By.xpath(".//input")).getAttribute("value")
					Assert.assertEquals(textFromTable, textFromDropdown, 'Two values are not equal')
				}
			}catch(NoSuchElementException e) {
				continue
			}
		}
	}

	@Then("The first {string} row should have user name is {string}")
	def the_first_row_should_have_user_name_is(String status, String userName) {
		List<Map<String, String>> table = utils.extractDataTableWithText(findTestObject('Object Repository/Common/Table/table_Table'))
		int index = Integer.parseInt(GlobalVariable['INDEX'])
		String[] refNo = WebUI.getUrl().split("=")
		String rnId = refNo[refNo.length - 1]
		String matNo = table.get(index).get('Material No')
		List<Map<String, String>> DBdata = utils.getDataFromDatabase(matNo, rnId)
		Assert.assertEquals(userName, DBdata.get(0).get('endorsed_by'), 'Two names are not equal with '+userName+' and '+DBdata.get(0).get('endorsed_by'))
		Assert.assertEquals(status, DBdata.get(0).get('endorsement'), 'Wrong status')
	}

	@When("I get total value of all endorse and reject records")
	def i_get_total_value_of_all_endorse_and_reject_records() {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/span_ParamDropDown',['param':'Status:']), GlobalVariable.MAX_WAIT)
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/span_ParamDropDown',['param':'Status:']))
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/form_DropDownForm'), GlobalVariable.MIN_WAIT)
		List<WebElement> options = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/form_DropDownForm'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//input"))
		for(int i=0; i<options.size(); i++) {
			if(options.get(i).getAttribute('aria-labelledby').equals('endorsed') || options.get(i).getAttribute('aria-labelledby').equals('rejected')) {
				options.get(i).click()
			}
		}
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':'Apply']))
		List<Map<String, WebElement>> table = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))
		List<Integer> total = new ArrayList<>()
		for(int i=0; i<table.size(); i++) {
			double estUnit = Double.parseDouble(table.get(i).get('Estimated Unit Price(RM)').getText())
			int minUser = Integer.parseInt(table.get(i).get('Min(User)').findElement(By.xpath(".//input")).getAttribute('value'))
			int maxUser = Integer.parseInt(table.get(i).get('Max(User)').findElement(By.xpath(".//input")).getAttribute('value'))
			int erbsMin = Integer.parseInt(table.get(i).get('ERBS Min').getText())
			int erbsMax = Integer.parseInt(table.get(i).get('ERBS Max').getText())
			int max
			if(erbsMin == 0 && erbsMax == 0) {
				max = Math.max(minUser, maxUser)
			}else {
				max = Math.max(erbsMin, erbsMax)
			}
			int totalValue = estUnit * max
			try {
				if(table.get(i).get('Endorsement').findElement(By.xpath(".//button/*[local-name()='svg' and @data-testid='CheckCircleIcon']")).isDisplayed()) {
					continue
				}
			}catch(NoSuchElementException) {
				String endorsement = table.get(i).get('Endorsement').findElement(By.xpath(".//p")).getText()
				if(endorsement.equals('Endorsed') || endorsement.equals('Rejected')) {
					total.add(totalValue)
				}
			}
		}
		utils.addGlobalVariable('TOTAL_VALUE', total.sum())
	}

	@When("I calculate value of all endorse records")
	def i_calculate_value_of_all_endorse_records() {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/span_ParamDropDown',['param':'Status:']), GlobalVariable.MAX_WAIT)
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/span_ParamDropDown',['param':'Status:']))
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/form_DropDownForm'), GlobalVariable.MIN_WAIT)
		List<WebElement> options = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/form_DropDownForm'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//input"))
		for(int i=0; i<options.size(); i++) {
			if(options.get(i).getAttribute('aria-labelledby').equals('endorsed')) {
				options.get(i).click()
			}
		}
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':'Apply']))
		List<Map<String, WebElement>> table = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))
		List<Integer> endorsedList = new ArrayList<>()
		for(int i=0; i<table.size(); i++) {
			double estUnit = Double.parseDouble(table.get(i).get('Estimated Unit Price(RM)').getText())
			int endorMin = Integer.parseInt(table.get(i).get('Endorsed Min').findElement(By.xpath(".//input")).getAttribute('value'))
			int endorMax = Integer.parseInt(table.get(i).get('Endorsed Max').findElement(By.xpath(".//input")).getAttribute('value'))
			int max = Math.max(endorMin, endorMax)
			int totalValue = estUnit * max
			try {
				if(table.get(i).get('Endorsement').findElement(By.xpath(".//button/*[local-name()='svg' and @data-testid='CheckCircleIcon']")).isDisplayed()) {
					continue
				}
			}catch(NoSuchElementException) {
				if(table.get(i).get('Endorsement').findElement(By.xpath(".//p")).getText().equals('Endorsed')) {
					endorsedList.add(totalValue)
				}
			}
		}
		String endorse
		if(endorsedList.size() == 0) {
			endorse = ''
		}else if(endorsedList.sum() == 0){
			endorse = ''
		}else {
			endorse = String.valueOf(endorsedList.sum())
		}
		utils.addGlobalVariable('ENDORSE_VALUE', endorse)
	}

	@When("I calculate value of all reject records")
	def i_calculate_value_of_all_reject_records() {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/span_ParamDropDown',['param':'Status:']), GlobalVariable.MAX_WAIT)
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/span_ParamDropDown',['param':'Status:']))
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/form_DropDownForm'), GlobalVariable.MIN_WAIT)
		List<WebElement> options = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/form_DropDownForm'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//input"))
		for(int i=0; i<options.size(); i++) {
			if(options.get(i).getAttribute('aria-labelledby').equals('rejected')) {
				options.get(i).click()
			}
		}
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':'Apply']))
		List<Map<String, WebElement>> table = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))
		List<Integer> rejectedList = new ArrayList<>()
		for(int i=0; i<table.size(); i++) {
			double estUnit = Double.parseDouble(table.get(i).get('Estimated Unit Price(RM)').getText())
			int minUser = Integer.parseInt(table.get(i).get('Min(User)').findElement(By.xpath(".//input")).getAttribute('value'))
			int maxUser = Integer.parseInt(table.get(i).get('Max(User)').findElement(By.xpath(".//input")).getAttribute('value'))
			int erbsMin = Integer.parseInt(table.get(i).get('ERBS Min').getText())
			int erbsMax = Integer.parseInt(table.get(i).get('ERBS Max').getText())
			int max
			if(erbsMin == 0 && erbsMax == 0) {
				max = Math.max(minUser, maxUser)
			}else {
				max = Math.max(erbsMin, erbsMax)
			}
			int totalValue = estUnit * max
			try {
				if(table.get(i).get('Endorsement').findElement(By.xpath(".//button/*[local-name()='svg' and @data-testid='CheckCircleIcon']")).isDisplayed()) {
					continue
				}
			}catch(NoSuchElementException) {
				if(table.get(i).get('Endorsement').findElement(By.xpath(".//p")).getText().equals('Rejected')) {
					rejectedList.add(totalValue)
				}
			}
		}
		String reject
		if(rejectedList.size() == 0) {
			reject = ''
		}else if(rejectedList.sum() == 0){
			reject = ''
		}else {
			reject = String.valueOf(rejectedList.sum())
		}
		utils.addGlobalVariable('REJECT_VALUE', reject)
	}
}