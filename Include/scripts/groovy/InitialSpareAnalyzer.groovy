import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject

import java.text.SimpleDateFormat
import java.time.LocalDateTime
import java.time.Year
import java.time.format.DateTimeFormatter

import javax.xml.bind.annotation.XmlElementDecl.GLOBAL

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
import org.openqa.selenium.JavascriptExecutor
import org.openqa.selenium.Keys
import org.openqa.selenium.NoSuchElementException

import com.kms.katalon.core.webui.common.WebUiCommonHelper
import com.kms.katalon.core.webui.driver.DriverFactory
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI

import common.utils
import cucumber.api.java.en.Then
import cucumber.api.java.en.When
import internal.GlobalVariable
import io.cucumber.datatable.DataTable

class InitialSpareAnalyzer {
	/*
	 *  Steps for working with SPF Tracking Summary table 
	 */

	@When("I select {string} option of {string} dropdown field")
	def select_option_in_filter_dropdown(String fieldName, String optionName) {
		WebUI.click(findTestObject('Object Repository/Common/Pop-Up/h3_Name',['name' : fieldName]))
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/p_FilterDropdownOptionList',[optionName:optionName]))
		WebUI.click(findTestObject('Object Repository/Common/button_label',['title':'Apply']))
	}

	@When("I click on {string} sub Menu")
	def click_on_subMenu_in_iSpare_Analyzer_page(String subMenu) {
		WebUI.waitForElementVisible(findTestObject('Object Repository/Common/Pop-Up/h3_Name', ['name': subMenu]), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Common/Pop-Up/h3_Name', ['name': subMenu]))
	}

	@When("I select {string} in SPF Tracking Summary")
	def i_select_in_spd_tracking_summary(String name, DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/span_ParamDropDown',['param':name]), GlobalVariable.MAX_WAIT)
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/span_ParamDropDown',['param':name]))
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/form_DropDownForm'), GlobalVariable.MIN_WAIT)
		for(int i=0; i<dTable.size(); i++) {
			String option = dTable.get(i)
			if(option.equals('random')) {
				List<WebElement> listE = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Data Focal/General Data/span_selectedFilter'), GlobalVariable.MAX_WAIT)
				Random rand = new Random();
				int randomNumber = rand.nextInt(listE.size())
				utils.addGlobalVariable('RANDOM_VALUE', listE.get(randomNumber).findElement(By.xpath("./input")).getAttribute('aria-labelledby'))
				Actions actions = new Actions(DriverFactory.getWebDriver())
				actions.moveToElement(listE.get(randomNumber).findElement(By.xpath("./input")))
				listE.get(randomNumber).click()
			}else {
				if(WebUI.waitForElementNotVisible(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/input_optionInDropdown',['param':option]), GlobalVariable.MIN_WAIT)) {
					WebUI.scrollToElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/input_optionInDropdown',['param':option]), GlobalVariable.MIN_WAIT)
				}
				WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/input_optionInDropdown',['param':option]))
			}
		}
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':'Apply']))
	}

	@When("I select {string} in {string} filter in SPF Tracking Summary")
	def i_select_in_filter_in_spf_tracking_summary(String date, String filter) {
		JavascriptExecutor js = (JavascriptExecutor) DriverFactory.getWebDriver();
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/span_ParamDropDown',['param':filter]), GlobalVariable.MAX_WAIT)
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/span_ParamDropDown',['param':filter]))
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/form_DropDownForm'), GlobalVariable.MIN_WAIT)
		if(date.equals('current date')) {
			WebUI.waitForElementVisible(findTestObject('Object Repository/Common/button_class param',['param':'MuiPickersDay-today']), GlobalVariable.MIN_WAIT)
			//			WebUI.scrollToElement(findTestObject('Object Repository/Common/button_class param',['param':'MuiPickersDay-today']), GlobalVariable.MIN_WAIT)
			WebElement ele = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/button_class param',['param':'MuiPickersDay-today']), GlobalVariable.MIN_WAIT)
			js.executeScript("arguments[0].scrollIntoView(true);", ele);
			WebUI.click(findTestObject('Object Repository/Common/button_class param',['param':'MuiPickersDay-today']))
		}else {
			String year = date.split(",", 2)[1]
			//select year
			WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/button_dropdownInCalendar'), GlobalVariable.MIN_WAIT)
			WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/button_dropdownInCalendar'))
			WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':year]), GlobalVariable.MIN_WAIT)
			//			WebUI.scrollToElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':year]), GlobalVariable.MIN_WAIT)
			WebElement selectYear = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':year]), GlobalVariable.MIN_WAIT)
			js.executeScript("arguments[0].scrollIntoView(true);", selectYear);
			WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':year]))
			//select date
			WebUI.waitForElementVisible(findTestObject('Object Repository/Common/button_ariaLabel',['param':date]), GlobalVariable.MIN_WAIT)
			//			WebUI.scrollToElement(findTestObject('Object Repository/Common/button_ariaLabel',['param':date]), GlobalVariable.MIN_WAIT)
			WebElement selectDate = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/button_ariaLabel',['param':date]), GlobalVariable.MIN_WAIT)
			js.executeScript("arguments[0].scrollIntoView(true);", selectDate);
			WebUI.click(findTestObject('Object Repository/Common/button_ariaLabel',['param':date]))
		}
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':'Apply']))
	}

	@When("I click to SPF Ref No {string} in the SPF Tracking Summary table")
	def i_click_to_spf_ref_no_in_the_spf_tracking_summary_table(String refNo) {
		List<Map<String, WebElement>> table = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/table_SpfTracking'))
		if(refNo.contains('Global')) {
			refNo = GlobalVariable[refNo.split("-",2)[1]]
			WebUI.sendKeys(findTestObject('Object Repository/Common/input_Placeholder',['param':'Search by keyword']), refNo)
		}
		if(refNo.equals("random")) {
			List<WebElement> listE = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/table_SpfTracking'), GlobalVariable.MAX_WAIT).findElements(By.xpath('.//td//a/h6'))
			Random rand = new Random();
			int randomNumber = rand.nextInt(listE.size())
			utils.addGlobalVariable('RANDOM_REF_NO', listE.get(randomNumber).getText())
			listE.get(randomNumber).click()
		}else if(refNo.contains('General Data')){
			refNo = refNo.split("-", 2)[1]
			for(int i=0; i<table.size(); i++) {
				if(table.get(i).get('Dataset Name').findElement(By.xpath(".//a")).getText().trim().equals(refNo)) {
					table.get(i).get('Dataset Name').findElement(By.xpath(".//a[normalize-space(text())='"+ refNo + "']")).click()
				}
			}
		}else if(refNo.contains("ECA")){
			refNo = refNo.split("_", 2)[1]
			for(int i=0; i<table.size(); i++) {
				if(table.get(i).get('File Name').findElement(By.xpath(".//a/h6")).getText().trim().equals(refNo)) {
					table.get(i).get('File Name').findElement(By.xpath(".//a/h6[normalize-space(text())='"+ refNo + "']")).click()
				}
			}
		}else {
			for(int i=0; i<table.size(); i++) {
				if(table.get(i).get('Stock Proposal Ref No').findElement(By.xpath(".//a/h6")).getText().trim().equalsIgnoreCase(refNo)) {
					table.get(i).get('Stock Proposal Ref No').findElement(By.xpath(".//a/h6[normalize-space(text())='"+ refNo + "']")).click()
				}
			}
		}
	}

	@When("I put data into {string} field in SPF Submission")
	def i_put_data_into_field_in_spf_submission(String column, DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		Actions action = new Actions(DriverFactory.getWebDriver())
		for(int i=0; i<dTable.size(); i++) {
			switch(column) {
				case 'Material No':
					WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/td_cellInSubmission', ['param': 'cellLeft', 'param1' : i+1]))
					action.sendKeys(dTable.get(i)).build().perform()
					action.sendKeys(Keys.TAB).build().perform()
					break
				case 'Lead Time':
					WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/td_cellInSubmission', ['param': 'cellCenter', 'param1' : i+1]))
					action.sendKeys(dTable.get(i)).build().perform()
					action.sendKeys(Keys.TAB).build().perform()
					break
				case 'Estimated Unit Price':
					WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/td_cellInSubmission', ['param': 'cellRight', 'param1' : i+1]))
					action.sendKeys(dTable.get(i)).build().perform()
					action.sendKeys(Keys.TAB).build().perform()
					break
				default:
					throw new Exception('Invalid input')
			}
		}
	}

	@When("I wait and get the Ref No of new SPF Submission")
	def i_wait_and_get_the_ref_no_of_new_spf_submission() {
		WebUI.waitForElementVisible(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/div_sucessMessage'), GlobalVariable.MAX_WAIT)
		String refNo = WebUI.getText(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/div_sucessMessage'))
		String [] arr = refNo.split("\\.")[0].split("\\s")
		utils.addGlobalVariable('NEWREFNO', arr[arr.length -1])
	}

	@Then("The data of table in SPF Tracking Summary should be matched with expected result")
	def the_data_of_table_in_spf_tracking_summary_should_be_matched_with_expected_result(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		List<Map<String, String>> table = utils.extractDataTableWithText(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/table_SpfTracking'))
		for(int i=0; i<dTable.size(); i++) {
			for(int j=0; j<table.size(); j++) {
				if(dTable.get(i).get('Ref No').equals(table.get(j).get('Stock Proposal Ref No'))) {
					Assert.assertEquals(dTable.get(i).get('Plant Code Name'), table.get(j).get('Plant Code - Plant Name'))
					Assert.assertEquals(dTable.get(i).get('Requester Name'), table.get(j).get('Requester Name'))
					Assert.assertEquals(dTable.get(i).get('Status'), table.get(j).get('Status'))
				}
			}
		}
	}

	@When("I click on expand button of {string} Ref No in SPF Tracking Summary")
	def i_click_on_expand_button_of_ref_no_in_spf_tracking_summary(String RefNo) {
		WebUI.delay(5)
		Actions actions = new Actions(DriverFactory.getWebDriver());
		Random rand = new Random();
		List<Map<String, WebElement>> table = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/table_SpfTracking'))
		if(RefNo.contains("Global-")) {
			RefNo = GlobalVariable[RefNo.split("-")[1]]
		}
		if(RefNo.equals("any")) {
			List<WebElement> listE = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/table_SpfTracking'), GlobalVariable.MAX_WAIT).findElements(By.xpath('.//td//button'))
			int i = rand.nextInt(listE.size())
			actions.moveToElement(listE.get(i)).build().perform()
			listE.get(i).click()
		}else {
			for(int i=0; i<table.size(); i++) {
				if(table.get(i).get('Stock Proposal Ref No').findElement(By.xpath(".//a/h6")).getText().trim().equalsIgnoreCase(RefNo)) {
					actions.moveToElement(table.get(i).get('Stock Proposal Ref No').findElement(By.xpath(".//a/h6[normalize-space(text())='"+ RefNo + "']/../preceding-sibling::button/*[local-name()='svg']"))).build().perform()
					table.get(i).get('Stock Proposal Ref No').findElement(By.xpath(".//a/h6[normalize-space(text())='"+ RefNo + "']/../preceding-sibling::button/*[local-name()='svg']")).click()
				}
			}
		}
	}

	@When("I click on {string} child ref no displaying in SPF Tracking Summary")
	def i_click_on_child_ref_no_displaying_in_spf_tracking_summary(String RefNo) {
		WebUI.delay(5)
		Actions actions = new Actions(DriverFactory.getWebDriver());
		Random rand = new Random();
		List<Map<String, WebElement>> table = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/table_SpfTracking'))
		if(RefNo.contains("Global-")) {
			RefNo = GlobalVariable[RefNo.split("-")[1]]
		}
		if(RefNo.equals("any")) {
			List<WebElement> listE = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/table_SpfTracking'), GlobalVariable.MAX_WAIT).findElements(By.xpath(".//td//a[contains(@href,'recommendation')]"))
			int i = rand.nextInt(listE.size())
			actions.moveToElement(listE.get(i)).build().perform()
			listE.get(i).click()
		}else {
			for(int i=0; i<table.size(); i++) {
				if(table.get(i).get('Stock Proposal Ref No').findElement(By.xpath(".//a/h6")).getText().trim().equalsIgnoreCase(RefNo)) {
					actions.moveToElement(table.get(i).get('Stock Proposal Ref No').findElement(By.xpath(".//a/h6[normalize-space(text())='"+ RefNo + "']/parent::a[contains(@href,'recommendation')]"))).build().perform()
					table.get(i).get('Stock Proposal Ref No').findElement(By.xpath(".//a/h6[normalize-space(text())='"+ RefNo + "']/parent::a[contains(@href,'recommendation')]")).click()
				}
			}
		}
	}

	@Then("The Ref No should contain data match with expected result")
	def the_ref_no_should_contain_data_match_with_expected_result(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		List<Map<String, String>> table = utils.extractDataTableWithText(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/table_SpfTracking'))
		for(int i=0; i<dTable.size(); i++) {
			String refNo = dTable.get(i).get('Ref No')
			String column = dTable.get(i).get('Column')
			String expectedResult = dTable.get(i).get('Expected Result')
			if(refNo.contains('Global-')) {
				refNo = GlobalVariable[refNo.split("-")[1]]
			}
			if(expectedResult.contains('Global-')) {
				expectedResult = GlobalVariable[expectedResult.split("-")[1]]
			}else if(expectedResult.contains('Current Date')) {
				String newFormat = expectedResult.split("-",2)[1]
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern(newFormat)
				LocalDateTime now = LocalDateTime.now()
				expectedResult = dtf.format(now)
			}
			for(int j=0; j<table.size(); j++) {
				if(refNo.equals(table.get(j).get('Stock Proposal Ref No'))) {
					String data = table.get(j).get(column)
					println 'ZXCZXC ' +data
					if(!data.isEmpty()) {
						data = data.replace("\n", " ")
					}
					if(column.equals('SPF Submission Date')) {
						data = utils.convertDateTimeFormat('dd MMM yyyy HH:mm a', 'dd MMM yyyy', data)
					}
					Assert.assertEquals(data, expectedResult, 'Data '+data+' not match with data '+expectedResult)
				}
			}
		}
	}

	@When("The Ref No shoud contain download icon in SPF Tracking Summary")
	def the_ref_no_should_contain_download_icon_in_spf_tracking_summary(DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		List<Map<String, WebElement>> table = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/table_SpfTracking'))
		for(int i=0; i<dTable.size(); i++) {
			String valueFromList = dTable.get(i)
			if(valueFromList.toUpperCase().equals('ALL ROWS')) {
				WebElement downloadIcon = table.get(i).get('Action').findElement(By.xpath(".//span/*[local-name()='svg']"))
				Assert.assertTrue(downloadIcon.isDisplayed(), 'Download icon is not displayed')
			}else {
				for(int j=0; j<table.size(); j++) {
					String refNo = table.get(j).get('Stock Proposal Ref No').findElement(By.xpath(".//a/h6")).getText()
					WebElement downloadIcon = table.get(j).get('Action').findElement(By.xpath(".//span/*[local-name()='svg']"))
					if(valueFromList.equals(refNo)) {
						Assert.assertTrue(downloadIcon.isDisplayed(), 'Download icon is not displayed')
					}
				}
			}
		}
	}

	@Then("The re submit button of child Ref No should be displayed as design")
	def the_re_submit_button_of_child_ref_no_should_be_displayed_as_design(DataTable dataTable) {
		WebUI.delay(5)
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		List<Map<String, WebElement>> table = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/table_SpfTracking'))
		for(int i=0; i<dTable.size(); i++) {
			String refNo = dTable.get(i).get('Child Ref No')
			String status = dTable.get(i).get('Resubmit')
			for(int j=0; j<table.size(); j++) {
				String refNoFromTable = table.get(j).get('Stock Proposal Ref No').findElement(By.xpath(".//a/h6")).getText()
				if(refNo.equals(refNoFromTable)) {
					if(status.toUpperCase().equals('YES')) {
						Assert.assertTrue(table.get(j).get('Action').findElement(By.xpath(".//img[@alt='Re-submission']")).isDisplayed(), 'The ref no '+refNo+' does not contain re-submit button')
					}else if(status.toUpperCase().equals('NO')) {
						Assert.assertFalse(table.get(j).get('Action').findElement(By.xpath(".//img[@alt='Re-submission']")).isDisplayed(), 'The ref no '+refNo+' contain re-submit button')
					}else {
						throw new Exception('Invalid re-submit button status')
					}
				}
			}
		}
	}

	@Then("The pop up should be displayed as design after submit new submission in SPF Submission")
	def the_pop_up_should_be_displayed_as_design_after_submit_new_submission_in_spf_submission() {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/span_ConfirmationPopUp',['param':'mui']), GlobalVariable.MAX_WAIT)
		WebUI.verifyElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/span_ConfirmationPopUp',['param':'mui']), GlobalVariable.MAX_WAIT)
		//Title
		Assert.assertEquals(WebUI.getText(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/span_ConfirmationPopUp',['param':'mui'])), 'Confirmation', 'The title of the pop up is not correct')
		//X button
		Assert.assertTrue(WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/span_ConfirmationPopUp',['param':'mui']), GlobalVariable.MIN_WAIT).findElement(By.xpath("./following-sibling::button[@data-testid='dialog-close-button']")).isDisplayed(), 'X button is not displayed!')
		//Description
		String description = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/span_ConfirmationPopUp',['param':'mui']), GlobalVariable.MIN_WAIT).findElement(By.xpath("./parent::h2/following-sibling::div/p")).getText()
		Assert.assertEquals(description, 'Are you sure you want to submit it?', 'The descriptions are not equal')
		//Button
		Assert.assertTrue(WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/span_ConfirmationPopUp',['param':'mui']), GlobalVariable.MIN_WAIT).findElement(By.xpath("./parent::h2/following-sibling::div//button[text()='Cancel']")).isDisplayed(), 'Button Cancel is not displayed')
		Assert.assertTrue(WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/span_ConfirmationPopUp',['param':'mui']), GlobalVariable.MIN_WAIT).findElement(By.xpath("./parent::h2/following-sibling::div//button[text()='OK']")).isDisplayed(), 'Button OK is not displayed')
	}

	@Then("All Ref No in SPF Tracking Summary should have data match with expected result")
	def all_ref_no_in_spf_tracking_summary_should_have_data_match_with_expected_result(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		List<Map<String, String>> table = utils.extractDataTableWithText(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/table_SpfTracking'))
		for(int i=0; i<dTable.size(); i++) {
			String column = dTable.get(i).get('Column')
			String expected = dTable.get(i).get('Expected')
			for(int j=0; j<table.size(); j++) {
				String data = table.get(j).get(column).replace("\n", " ")
				Assert.assertEquals(data, expected, 'Data '+data+' not match with data '+expected)
			}
		}
	}

	//Làm nốt phần này
	@When("I click on Ref No in {string} status")
	def i_click_on_pending_for_deliberation_submission(String status) {
		List<Map<String, WebElement>> table = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/table_SpfTracking'))
		for(int i=0; i<table.size(); i++) {
			table.get(i).get('Stock').click()
			WebUI.switchToWindowTitle('MMW - SPF Recommendation and Deliberation Submission')
			if(WebUI.waitForElementPresent('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/h2_alertPopup', ['param': 'Confirmation'], GlobalVariable.MAX_WAIT)) {
				WebUI.closeWindowTitle('MMW - SPF Recommendation and Deliberation Submission')
				WebUI.switchToWindowTitle('MMW - Initial Spare Landing Page')
			}else {
				//thao tac 1 cai gi day
				break
			}
		}
	}

	@Then("All cell in the SPF Submission page should be blank")
	def all_cell_in_the_spf_submission_page_should_be_blank(DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		for(int i=0; i<dTable.size(); i++) {
			List<WebElement> cells = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/td_allCellInSubmission',['param':dTable.get(i)]), GlobalVariable.MIN_WAIT)
			for(int j=0; j<cells.size(); j++) {
				Assert.assertTrue(cells.get(j).getText().equals(''), 'A cell is not null')
			}
		}
	}

	@Then("Mat no text in popup should have color as {string}")
	def mat_no_text_in_popup_should_have_color_as(String expected) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/h5_textInPopup'), GlobalVariable.MIN_WAIT)
		String UIcolor = WebUI.getCSSValue(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/h5_textInPopup'), 'color')
		Assert.assertEquals(UIcolor, expected, 'Color is not correct')
	}

	@When("I get all data of column {string} in Stock Proposal Summary")
	def i_get_all_data_of_column_in_stock_proposal_summary(String column) {
		List<Map<String, String>> dTable = utils.extractDataTableWithText(findTestObject('Object Repository/Common/Table/table_Table'))
		List<String> columnList = new ArrayList<>()
		for(int i=0; i<dTable.size(); i++) {
			columnList.add(dTable.get(i).get(column).replace("\n", " "))
		}
		utils.addGlobalVariable("COLUMN_LIST", columnList)
	}

	@When("I get random data from list {string}")
	def i_get_random_data_from_list(String list) {
		List<String> dTable = GlobalVariable[list]
		Random rand = new Random();
		int randomNumber = rand.nextInt(dTable.size())
		utils.addGlobalVariable('RANDOM_VALUE', dTable.get(randomNumber))
	}

	@Then("Message in popup should be displayed as {string}")
	def message_in_popup_should_be_displayed_as(String text) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/p_textInPopup'), GlobalVariable.MIN_WAIT)
		String textUI = WebUI.getText(findTestObject('Object Repository/Initial Spare Analyzer/SPF Submission page/p_textInPopup'))
		Assert.assertEquals(text, textUI, 'Two messages are not equal')
	}

	@Then("Child ref no should be displayed when click to expand icon of parent ref no in SPF Tracking Summary")
	def child_ref_no_should_be_displayed_when_click_to_expand_icon_of_parent_ref_no_in_spf_tracking_summary() {
		List<Map<String, WebElement>> dTable = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))
		List<String> parents = new ArrayList<>()
		for(int i=0; i<dTable.size(); i++) {
			parents.add(dTable.get(i).get('Stock Proposal Ref No').getText())
			try {
				if(dTable.get(i).get('Stock Proposal Ref No').findElement(By.xpath(".//*[local-name()='svg' and @data-testid='KeyboardArrowRightIcon']")).isDisplayed()) {
					dTable.get(i).get('Stock Proposal Ref No').findElement(By.xpath(".//*[local-name()='svg' and @data-testid='KeyboardArrowRightIcon']")).click()
				}
			}catch(NoSuchElementException e) {
				continue
			}
		}
		List<Map<String, String>> dTable2 = utils.extractDataTableWithText(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int j=0; j<dTable2.size(); j++) {
			if(!parents.contains(dTable2.get(j).get('Stock Proposal Ref No'))) {
				String[] textArr = dTable2.get(j).get('Stock Proposal Ref No').split("/")
				Assert.assertEquals(textArr.length, 5, "Size is not match")
			}else {
				continue
			}
		}
	}

	@When("I create new random number for Material No")
	def i_create_new_random_number_for_material_no() {
		String newNumber = utils.getRandomNumber()
		utils.addGlobalVariable('RANDOM_MATNO', newNumber)
	}

	@Then ("I verify the Stock Proposal Ref No to follow format {string} in SPF Tracking Summary")
	def I_verify_Stock_Proposal_Ref_No_to_follow_format_in_SPF_Tracking_Summary(String format) {
		List<Map<String, WebElement>> dTable = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))

		for(int i=0; i<dTable.size(); i++) {
			String refNoText = dTable.get(i).get('Stock Proposal Ref No').getText()
			String compareText = dTable.get(i).get('Plant Code - Plant Name').getText()
			//First part is SPF
			Assert.assertEquals(refNoText.split("/")[0], 'SPF', 'The ref no is not started with SPF')
			//Third part is plant code
			Assert.assertEquals(compareText.split("-")[0].trim(),(refNoText.split("/")[2]), 'The plant code '+refNoText.split("/")[2]+' not in the list')
		}
	}

	@Then("All records with resubmit status should contain resubmit button if more than 16 days")
	def all_records_with_resubmit_status_should_contain_resubmit_button_if_more_than_16_days() {
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy");
		String today = dateFormat.format(date);
		List<Map<String, WebElement>> dTable = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<dTable.size(); i++) {
			try {
				if(dTable.get(i).get('Stock Proposal Ref No').findElement(By.xpath(".//*[local-name()='svg' and @data-testid='KeyboardArrowRightIcon']")).isDisplayed()) {
					dTable.get(i).get('Stock Proposal Ref No').findElement(By.xpath(".//*[local-name()='svg' and @data-testid='KeyboardArrowRightIcon']")).click()
				}
			}catch(NoSuchElementException e) {
				continue
			}
		}
		List<Map<String, WebElement>> dTable2 = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))

		for(int j=0; j<dTable2.size(); j++) {
			println('ZXCZXC')
			String refNo = dTable2.get(j).get('Stock Proposal Ref No').getText()
			if(refNo.split("/").length == 5) {
				Assert.assertEquals(dTable2.get(j).get('Status').getText().replace("\n", " "), 'PENDING FOR RESUBMIT', 'Status is not correct')
				Assert.assertEquals(dTable2.get(j).get('SPF Submission Date').getText(), '', 'Spf submission date is not null')
				Assert.assertEquals(dTable2.get(j).get('Total Submitted Material for Recommendation/Deliberation').getText(), '', 'Total submitted marterial is not null')
				String[] arr = refNo.split("/")
				arr = Arrays.copyOf(arr, arr.length - 1)
				String parentRefNo = String.join("/", arr)
				int checked;
				for(int k=0; k<dTable.size(); k++) {
					if(dTable.get(k).get('Stock Proposal Ref No').getText().equals(parentRefNo)) {
						String time = dTable.get(k).get('SPF Submission Date').getText().replace("\n", " ")
						time = utils.convertDateTimeFormat('dd MMM yyyy HH:mm a', 'dd MMM yyyy', time)
						println 'TIME '+time
						checked = utils.getDaysBetweenTwoDates(today, time, 'dd MMM yyyy')
						println 'CHECK '+checked
						break
					}
				}
				if(checked > 16) {
					Assert.assertTrue(dTable2.get(j).get('Action').findElement(By.xpath(".//img[@alt='Re-submission']")).isDisplayed(), 'Button re-submit is not displayed')
				}else {
					List<WebElement> resubmit = dTable2.get(j).get('Action').findElements(By.xpath(".//img[@alt='Re-submission']"))
					Assert.assertEquals(resubmit.size(), 0, 'Button re-submit is displayed')
				}
			}else {
				Assert.assertEquals(dTable2.get(j).get('Status').getText().replace("\n", " "), 'PENDING FOR DELIBERATION SUBMISSION', 'Status is not correct')
				Assert.assertTrue(dTable2.get(j).get('Stock Proposal Ref No').findElement(By.xpath(".//*[local-name()='svg' and @data-testid='KeyboardArrowDownIcon']")).isDisplayed(), 'Button is not clicked!')
			}
		}
	}
}