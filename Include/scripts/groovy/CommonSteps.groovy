import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import static org.junit.Assert.assertEquals

import java.text.SimpleDateFormat

import org.openqa.selenium.By
import org.openqa.selenium.Keys
import org.openqa.selenium.WebElement
import org.openqa.selenium.interactions.Actions
import org.testng.Assert

import com.google.common.collect.Lists
import com.kms.katalon.core.model.FailureHandling
import com.kms.katalon.core.testobject.TestObject
import com.kms.katalon.core.testdata.TestData
import com.kms.katalon.core.webui.common.WebUiCommonHelper
import com.kms.katalon.core.webui.driver.DriverFactory
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI

import common.customKW
import common.utils
import cucumber.api.java.en.Given
import cucumber.api.java.en.Then
import cucumber.api.java.en.When
import internal.GlobalVariable
import io.cucumber.datatable.DataTable

class CommonSteps {
	TestObject tableHeader = null
	TestObject tableBody = null

	@Given("I go to the {string} page with {string} role")
	def go_to_landingpage_with_role(String boxname, String role) {
		String userName;
		String password;
		switch(role.toUpperCase()) {
			case 'ADMIN':
				userName = GlobalVariable.ADMIN_USERNAME
				password = GlobalVariable.ADMIN_PASSWORD
				break
			case 'OPU ENGINEER':
				userName = GlobalVariable.OPU_ENGINEER_USERNAME
				password = GlobalVariable.OPU_ENGINEER_PASSWORD
				break
			case 'DATA FOCAL':
				userName = GlobalVariable.DATA_FOCAL_USERNAME
				password = GlobalVariable.DATA_FOCAL_PASSWORD
				break
			case 'SRC SECRETARY':
				userName = GlobalVariable.SRC_SECRETARY_USERNAME
				password = GlobalVariable.SRC_SECRETARY_PASSWORD
				break
			default:
				throw new Exception('Invalid inputed role!')
		}
		customKW.navigateToUrl(userName, password, role)
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/h3_TabTitle', ['title' : boxname]), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Common/Landing Page/div_BoxList', ['boxName' : boxname]))
	}

	@When("I click on {string} tab")
	def click_on_tab(String label) {
		WebUI.click(findTestObject('Object Repository/Common/h3_TabTitle', ['title' : label]))
	}

	@Then("{string} page title should be displayed")
	def landingpage_shouldbe_displayed(String boxname) {
		if(boxname.contains('currentMonth')) {
			SimpleDateFormat formatter = new SimpleDateFormat('MMM yyyy')
			Date date = new Date()
			boxname = boxname.replace('currentMonth', formatter.format(date))
		}
		WebUI.waitForElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : boxname]), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementVisible(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : boxname]))
	}

	@When("I click on {string} button")
	def click_on_button(String label) {
		WebUI.click(findTestObject('Object Repository/Common/button_label', ['title' : label]))
	}

	@When("I go back to the {string} page")
	def i_go_back_to_the_page(String page) {
		switch(page.toUpperCase()) {
			case 'HOME':
				WebUI.click(findTestObject('Object Repository/Common/Header/a_headerHome'))
				break
			case 'MFA':
				WebUI.click(findTestObject('Object Repository/Common/Header/a_headerMenu',['param':'Material Forecast Analyzer']))
				break
			case 'ISA':
				WebUI.click(findTestObject('Object Repository/Common/Header/a_headerMenu',['param':'Initial Spare Analyzer']))
				break
			case 'ZENTORY':
				WebUI.click(findTestObject('Object Repository/Common/Header/a_headerMenu',['param':'Zentory+']))
				break
			case 'LQ8':
				WebUI.click(findTestObject('Object Repository/Common/Header/a_headerMenu',['param':'Liquid 8 Marketplace']))
				break
			case 'CONTACT SETUP':
				WebUI.click(findTestObject('Object Repository/Common/Header/a_headerMenu',['param':'Contact Setup']))
				break
			case 'ROLE MANAGEMENT':
				WebUI.click(findTestObject('Object Repository/Common/Header/a_headerMenu',['param':'Role Management']))
				break
			case 'USER MANAGEMENT':
				WebUI.click(findTestObject('Object Repository/Common/Header/a_headerMenu',['param':'User Management']))
				break
			default:
				throw new Exception('Invalid input')
		}
	}
	
	@When("I naviagte to page in breadcrumb {string}")
	def i_navigate_to_page_in_breadcrumb(String page) {
		WebUI.click(findTestObject('Object Repository/Common/Header/a_text',['param':page]))
	}

	@When("I go to site {string}")
	def i_go_to_site(String title) {
		WebUI.delay(5)
		WebUI.switchToWindowTitle(title)
		WebUI.switchToWindowTitle(title)
	}

	// Working with table
	@When ("I click on {string} column of {string} table")
	def click_on_column_name_of_table(String tableName, String columnName){
		switch (tableName.toUpperCase()) {
			case 'PREDA MATERIALS':
				tableHeader = findTestObject('Object Repository/Common/Table/thead')
				tableBody = findTestObject('Object Repository/Common/Table/tbody')
				break
			case 'PREDA EQUIPMENT':
				tableHeader = findTestObject('Object Repository/Common/Table/thead')
				tableBody = findTestObject('Object Repository/Common/Table/tbody')
				break
			case 'SPF TRACKING SUMMARY':
				tableHeader = findTestObject('Object Repository/Common/Table/thead')
				tableBody = findTestObject('Object Repository/Common/Table/tbody')
				break
			default:
				throw new Exception('Invalid Table Name!')
				break
		}
		int colNum= utils.getIndexOfColumn(tableHeader, columnName)
		println("======="+ colNum)
		List<WebElement> colNames = WebUI.findWebElements(tableHeader, GlobalVariable.MIN_WAIT)
		WebElement c = colNames.get(colNum)
		TestObject colName = WebUI.convertWebElementToTestObject(c)
		WebUI.click(colName)
		WebUI.waitForElementVisible(findTestObject('Object Repository/Common/span_Pagination_NumberOfRecords'), GlobalVariable.MIN_WAIT)
	}

	@Then ("Table {string} should display corect data based on selected {string} option of {string} column")
	def verify_data_in_table_after_filtering(String tableName, String option, String columnName ) {

		switch (tableName.toUpperCase()) {
			case 'PREDA MATERIALS':
				tableHeader = findTestObject('Object Repository/Common/Table/thead')
				tableBody = findTestObject('Object Repository/Common/Table/tbody')
				break
			case 'PREDA EQUIPMENT':
				tableHeader = findTestObject('Object Repository/Common/Table/thead')
				tableBody = findTestObject('Object Repository/Common/Table/tbody')
				break
			case 'SPF TRACKING SUMMARY':
				tableHeader = findTestObject('Object Repository/Common/Table/thead')
				tableBody = findTestObject('Object Repository/Common/Table/tbody')
				break
			default:
				throw new Exception('Invalid Table Name!')
				break
		}
		int colNum = utils.getIndexOfColumn(tableHeader, columnName)
		List<TestObject> cells = utils.getListCellsOfAColumn(tableBody, colNum)
		List<TestObject> cellText = new ArrayList()
		for (TestObject cell : cells) {
			String text = WebUI.getText(cell)
			cellText.add(text)
		}

		for (String text : cellText) {
			Assert.assertEquals(text, option, 'Data is NOT matched with search')
		}
	}

	//Column Option
	@Then('I verify each deselected columns should not be displayed in the table')
	def verify_each_deselected_columns_is_notdisplayed() {
		List<WebElement> columnHeader = WebUI.findWebElements(findTestObject('Object Repository/Common/Table/th_ColumnName'), GlobalVariable.MIN_WAIT)
		List<String> column = utils.getColumnHeaders(columnHeader)
		for(String s : column) {
			utils.scrollAndClick(findTestObject('Object Repository/Common/Column Option/input_columnOptionCheckboxes',[title:s]))
			click_on_button('Apply Changes')
			List<String> newColumnList = WebUI.findWebElements(findTestObject('Object Repository/Common/Table/thead'), GlobalVariable.MIN_WAIT)
			List<String> newColumnNames = utils.getColumnHeaders(newColumnList)
			Assert.assertTrue(!newColumnNames.contains(s), 'Deselected column name is still contained in column')
			click_on_button('Column Option')
		}
	}

	@When("I select checkboxes in Column Option")
	def select_checkboxes_in_ColumnOption(DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/button_label',['title':'Column Option']), GlobalVariable.MAX_WAIT)
		WebUI.click(findTestObject('Object Repository/Common/button_label',['title':'Column Option']))
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/Column Option/div_columnList'), GlobalVariable.MAX_WAIT)
		List<WebElement> columnHeader = WebUI.findWebElements(findTestObject('Object Repository/Common/Table/th_ColumnName'), GlobalVariable.MIN_WAIT)
		for(String s : dTable) {
			utils.scrollAndClick(findTestObject('Object Repository/Common/Column Option/input_columnOptionCheckboxes',[title:s]))
		}
	}

	@Then("Table {string} should have correct columns as in data file")
	def verify_column_header_with_datafile(String tablename) {
		List<WebElement> colNames = WebUI.findWebElements(findTestObject('Object Repository/Common/Table/th_ColumnName'), GlobalVariable.MIN_WAIT)
		List<String> colApp = utils.getColumnHeaders(colNames)
		switch (tablename.toUpperCase()) {
			case 'PREDA MATERIALS':
				TestData file = findTestData('Data Files/US 17/Preda Materials')
				List<String> column = Arrays.asList(file.getColumnNames())
				List<String> columnFile = Lists.partition(column, colApp.size()).getAt(0)
				customKW.verifyLists(colApp, columnFile)
				break
			case 'PREDA EQUIPMENT':
				TestData file = findTestData('Data Files/US 17/Preda Equipment')
				List<String> column = Arrays.asList(file.getColumnNames())
				List<String> columnFile = Lists.partition(column, colApp.size()).getAt(0)
				customKW.verifyLists(colApp, columnFile)
				break
		}
	}

	@Then("{int} rows in the table should be corresponding to the show option")
	def verify_number_of_rows_in_table(int row) {
		List<WebElement> dataRows = WebUI.findWebElements(findTestObject('Object Repository/Common/Table/tr_dataRows'), GlobalVariable.MIN_WAIT)
		Assert.assertEquals(row,dataRows.size(), 'number of data rows is not match')
	}

	@Then("The order of table headers should be displayed as design")
	def the_order_of_table_headers_should_be_displayed_as_design(DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		List<WebElement> headers = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Table/table_Table'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//th"))
		List<String> allHeaders = headers.collect{x -> x.getText()}
		for(int i=0; i<dTable.size(); i++) {
			Assert.assertEquals(dTable.get(i), allHeaders.get(i).trim().replace("*", "").replace("\n", " "))
		}
	}

	//Working with Filters
	@When("I change the number of data rows in table into {string}")
	def i_change_the_number_of_rows_in_table_into(String number) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/input_classParam',['param':'MuiSelect-nativeInput']), GlobalVariable.MIN_WAIT)
		WebUI.scrollToElement(findTestObject('Object Repository/Common/input_classParam',['param':'MuiSelect-nativeInput']), GlobalVariable.MIN_WAIT)
		WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/input_classParam',['param':'MuiSelect-nativeInput']), GlobalVariable.MIN_WAIT).findElement(By.xpath("./parent::div")).click()
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/ul_listBox'), GlobalVariable.MIN_WAIT)
		WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/ul_listBox'), GlobalVariable.MIN_WAIT).findElement(By.xpath("./li[text()='"+number+"']")).click()
	}

	@Then('I verify option should be removed from each filter when click on Reset')
	def verify_option_is_removed_from_each_filter() {
		List<WebElement> filterArrow = WebUI.findWebElements(findTestObject('Object Repository/Common/Filters/div_Filter'), GlobalVariable.MIN_WAIT)
		Actions actions = new Actions(DriverFactory.getWebDriver())
		for (WebElement i : filterArrow) {
			i.click()
			WebUI.click(findTestObject('Object Repository/Common/Filters/input_CheckBoxes'))
			WebUI.verifyElementPresent(findTestObject('Object Repository/Common/Filters/div_selectedOptions'), GlobalVariable.MIN_WAIT)
			actions.sendKeys(i, Keys.TAB).perform()
			click_on_button('Search')
			click_on_button('Reset')
			WebUI.verifyElementNotPresent(findTestObject('Object Repository/Common/Filters/div_selectedOptions'), GlobalVariable.MIN_WAIT)
		}
	}

	@Then("The button {string} should be {string}")
	def the_button_should_be_disabled(String button, String status) {
		switch(status) {
			case 'disabled':
				WebUI.waitForElementPresent(findTestObject('Object Repository/Common/button_label', ['title' : button]), GlobalVariable.MIN_WAIT)
				WebUI.verifyElementNotClickable(findTestObject('Object Repository/Common/button_label', ['title' : button]))
				break
			case 'enabled':
				WebUI.waitForElementPresent(findTestObject('Object Repository/Common/button_label', ['title' : button]), GlobalVariable.MIN_WAIT)
				WebUI.verifyElementClickable(findTestObject('Object Repository/Common/button_label', ['title' : button]))
				break
			case 'displayed':
				WebUI.waitForElementVisible(findTestObject('Object Repository/Common/button_label', ['title' : button]), GlobalVariable.MIN_WAIT)
				WebUI.verifyElementVisible(findTestObject('Object Repository/Common/button_label', ['title' : button]))
				break
			case 'not displayed':
				WebUI.waitForElementNotVisible(findTestObject('Object Repository/Common/button_label', ['title' : button]), GlobalVariable.MIN_WAIT)
				WebUI.verifyElementNotVisible(findTestObject('Object Repository/Common/button_label', ['title' : button]))
				break
			case 'selected':
				String check = WebUI.getAttribute(findTestObject('Object Repository/Common/button_label', ['title' : button]), 'class')
				Assert.assertTrue(check.contains('Mui-selected'), 'Button is not selected')
				break
			default:
				throw new Exception('Invalid input')
		}
	}

	@When("I press button to refresh the website")
	def i_press_button_to_refresh_the_website() {
		WebUI.refresh()
		WebUI.delay(10)
	}

	@When("I select {string} on the top of the screen")
	def i_select_on_the_top_of_the_screen(String icon) {
		WebUI.click(findTestObject('Object Repository/Common/button_ariaLabel',['param':icon]))
	}

	@Then("A pop-up name {string} should be {string} as design")
	def a_pop_up_name_should_be_displayed_as_design(String popupName, String status) {
		switch(status) {
			case 'displayed':
				WebUI.waitForElementPresent(findTestObject('Object Repository/Common/Pop-Up/span_popup',['param':popupName]), GlobalVariable.MIN_WAIT)
				WebUI.verifyElementPresent(findTestObject('Object Repository/Common/Pop-Up/span_popup',['param':popupName]), GlobalVariable.MIN_WAIT)
				break
			case 'not displayed':
				WebUI.waitForElementNotPresent(findTestObject('Object Repository/Common/Pop-Up/span_popup',['param':popupName]), GlobalVariable.MIN_WAIT)
				WebUI.verifyElementNotPresent(findTestObject('Object Repository/Common/Pop-Up/span_popup',['param':popupName]), GlobalVariable.MIN_WAIT)
				break
			default:
				throw new Exception("Invalid Input")
		}
	}

	@When("I click on radio button {string} on the screen")
	def i_click_on_radio_button_on_the_screen(String radio) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Data Focal/ERBS Input Data/input_radioButton',['param':radio]), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Data Focal/ERBS Input Data/input_radioButton',['param':radio]))
		WebUI.verifyElementChecked(findTestObject('Object Repository/Data Focal/ERBS Input Data/input_radioButton',['param':radio]), GlobalVariable.MIN_WAIT)
	}

	@Then("A {string} alert should be {string}")
	def a_alert_should_be_displayed(String alert, String status) {
		switch(status) {
			case 'displayed':
				WebUI.waitForElementPresent(findTestObject('Object Repository/Data Focal/ECA/h2_alertPopup'), GlobalVariable.MIN_WAIT)
				WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Data Focal/ECA/h2_alertPopup'), GlobalVariable.MIN_WAIT).findElement(By.xpath(".//*[normalize-space(text())='"+alert+"']"))
				break
			case 'not displayed':
				WebUI.waitForElementNotPresent(findTestObject('Object Repository/Data Focal/ECA/h2_alertPopup'), GlobalVariable.MIN_WAIT)
				WebUI.verifyElementNotPresent(findTestObject('Object Repository/Data Focal/ECA/h2_alertPopup'), GlobalVariable.MIN_WAIT)
				break
			default:
				throw new Exception('Invalid input')
		}

	}

	@When("I click to avatar icon")
	def i_click_to_avatar_icon() {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Avatar/img_avatar'), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Avatar/img_avatar'))
	}

	@When("I choose option {string} in the dropdown list")
	def i_choose_option_in_the_dropdown_list(String text) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Avatar/p_dropdownOption',['param':text]), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Avatar/p_dropdownOption',['param':text]))
	}

	//Verify Pop-up
	@Then("A new pop-up {string} should be displayed")
	def a_new_pop_up_should_be_displayed(String popup) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/h2_alertPopup',['param':popup]), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/h2_alertPopup',['param':popup]), GlobalVariable.MIN_WAIT)
	}

	@Then("The {string} pop-up should be displayed with message {string} and {string} button")
	def verify_popup_displayed(String name, String content, String button) {
		WebUI.delay(5)
		WebUI.verifyElementVisible(findTestObject('Object Repository/Common/Pop-up/h3_Name', [name : name]))
		WebUI.verifyElementVisible(findTestObject('Object Repository/Common/Pop-Up/span_message', ['message' : content]))
		WebUI.verifyElementVisible(findTestObject('Object Repository/Common/button_label', [title : button]))
		WebUI.verifyElementVisible(findTestObject('Object Repository/Common/Pop-up/svg_CloseButton'))
	}

	@Then("The text message {string} should {string} in the website")
	def the_text_message_should_in_the_website(String message, String status) {
		TestObject testobject = findTestObject('Object Repository/Common/p_statusDropdown',['param':message])
		switch(status) {
			case 'display':
				WebUI.waitForElementPresent(testobject, GlobalVariable.MIN_WAIT)
				WebUI.verifyElementPresent(testobject, GlobalVariable.MIN_WAIT)
				break
			case 'not display':
				WebUI.waitForElementNotPresent(testobject, GlobalVariable.MIN_WAIT)
				WebUI.verifyElementNotPresent(testobject, GlobalVariable.MIN_WAIT)
				break
			default:
				throw new Exception('Invalid status')
		}
	}

	@Then("The screen should contain list of tab below")
	def the_screen_should_contain_list_of_tab_below(DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		List<WebElement> tablist = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Common/button_tablist'), GlobalVariable.MIN_WAIT)
		for(int i=0; i<tablist.size(); i++) {
			Assert.assertEquals(dTable.get(i), tablist.get(i).getText(), 'Tab names are not equal')
		}
	}

	@When("I get number of all record {string} in table then put it to list")
	def i_get_number_of_all_record_in_table_then_put_it_to_list(String column) {
		List<Map<String, String>> UI = utils.extractDataTableWithAllPages(findTestObject('Object Repository/Common/Table/table_Table'))
		List<String> columnList = new ArrayList<>()
		for(int i=0; i<UI.size(); i++) {
			columnList.add(UI.get(i).get(column))
		}
		utils.addGlobalVariable(column.toUpperCase().replaceAll("\\s", "_"), columnList)
	}

	@When("I click next button")
	def i_click_next_button() {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Avatar/Role Management/svg_param',['param':'ArrowRightIcon']), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Avatar/Role Management/svg_param',['param':'ArrowRightIcon']))
	}

	@Then("Page {string} should be selected")
	def page_should_be_selected(String pagenum) {
		String checked = WebUI.getAttribute(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/button_ButtonInDropDown',['param':pagenum]), 'class')
		Assert.assertTrue(checked.contains('Mui-selected'), 'Current page is not '+pagenum)
	}

	@Then("I should see button {string} is {string}")
	def i_should_see_button_is(String name, String status) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/button_ariaLabel',['param':name]), GlobalVariable.MIN_WAIT)
		WebUI.scrollToElement(findTestObject('Object Repository/Common/button_ariaLabel',['param':name]), GlobalVariable.MIN_WAIT)
		WebElement element = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/button_ariaLabel',['param':name]), GlobalVariable.MIN_WAIT)
		switch(status) {
			case 'disabled':
				Assert.assertTrue(!element.isEnabled(), 'Element is not disabled, please check again')
				break
			case 'enabled':
				Assert.assertTrue(element.isEnabled(), 'Element is not enabled, please check again')
				break
			default:
				throw new Exception('Invalid input')
		}
	}

	@Then("Icon {string} should be displayed in the website")
	def icon_should_be_displayed_in_the_website(String icon) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Avatar/Role Management/svg_param',['param':icon]), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementPresent(findTestObject('Object Repository/Avatar/Role Management/svg_param',['param':icon]), GlobalVariable.MIN_WAIT)
	}

	@Then("I should see input field {string} is displayed")
	def i_should_see_input_field_is_displayed(String field) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/input_Placeholder',['param':field]), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementPresent(findTestObject('Object Repository/Common/input_Placeholder',['param':field]), GlobalVariable.MIN_WAIT)
	}

	//Search by keyword
	@When("I search for {string} in search bar")
	def i_search_in_search_bar(String keyword) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/input_Placeholder',['param':'Search by keyword']), GlobalVariable.MIN_WAIT)
		if(keyword.contains('Global')) {
			keyword = GlobalVariable[keyword.split("-",2)[1]]
			WebUI.clearText(findTestObject('Object Repository/Common/input_Placeholder',['param':'Search by keyword']))
			WebUI.sendKeys(findTestObject('Object Repository/Common/input_Placeholder',['param':'Search by keyword']), keyword)
		}else {
			WebUI.sendKeys(findTestObject('Object Repository/Common/input_Placeholder',['param':'Search by keyword']), Keys.chord(Keys.CONTROL, 'a', Keys.BACK_SPACE))
			WebUI.sendKeys(findTestObject('Object Repository/Common/input_Placeholder',['param':'Search by keyword']), keyword)
		}
		WebUI.delay(3)
	}

	//Data name in General Data & ECA & iSpare
	@When("I click on {string} link")
	def i_click_on_data_link(String linkName) {
		List<Map<String, WebElement>> table = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))
		if(linkName.contains('Global')) {
			linkName = GlobalVariable[linkName.split("-",2)[1]]
			WebUI.sendKeys(findTestObject('Object Repository/Common/input_Placeholder',['param':'Search by keyword']), linkName)
		}
		if(linkName.equals("random")) {
			List<WebElement> listE = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Table/table_Table'), GlobalVariable.MAX_WAIT).findElements(By.xpath('.//td//a/h6'))
			Random rand = new Random();
			int randomNumber = rand.nextInt(listE.size())
			utils.addGlobalVariable('RANDOM_REF_NO', listE.get(randomNumber).getText())
			listE.get(randomNumber).click()
		}else if(linkName.contains('General Data')){
			linkName = linkName.split("-", 2)[1]
			for(int i=0; i<table.size(); i++) {
				if(table.get(i).get('Dataset Name').findElement(By.xpath(".//a")).getText().trim().equals(linkName)) {
					table.get(i).get('Dataset Name').findElement(By.xpath(".//a[normalize-space(text())='"+ linkName + "']")).click()
				}
			}
		}else {
			for(int i=0; i<table.size(); i++) {
				if(table.get(i).get('Stock Proposal Ref No').findElement(By.xpath(".//a/h6")).getText().trim().equalsIgnoreCase(linkName)) {
					table.get(i).get('Stock Proposal Ref No').findElement(By.xpath(".//a/h6[normalize-space(text())='"+ linkName + "']")).click()
				}
			}
		}
	}

	@When("I delay for {int} seconds")
	def i_delay_for_seconds(int time) {
		WebUI.delay(time)
	}

	@Then("The {string} button should be displayed on the screen")
	def upload_button_display(String button_label) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/span_upload button',['label':button_label]), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementPresent(findTestObject('Object Repository/Common/span_upload button',['label':button_label]), GlobalVariable.MIN_WAIT)
	}

	@When("I convert data of table into list map {string} with format {string}")
	def i_convert_data_of_all_page_into_list_map(String name, String format) {
		if(format.equals("SELECTED_DATA")) {
			List<Map<String, String>> UI = utils.extractDataTableWithSelectedData(findTestObject('Object Repository/Common/Table/table_Table'))
			utils.addGlobalVariable(name, UI)
		}else if(format.equals("ALL_DATA_ONE_PAGE")) {
			List<Map<String, String>> UI = utils.extractDataTableWithText(findTestObject('Object Repository/Common/Table/table_Table'))
			utils.addGlobalVariable(name, UI)
		}else if(format.equals("DATA_ALL_PAGE")) {
			List<Map<String, String>> UI = utils.extractDataTableWithAllPages(findTestObject('Object Repository/Common/Table/table_Table'))
			utils.addGlobalVariable(name, UI)
		}else if(format.contains("DATA_FROM_PAGE")) {
			Integer page = Integer.parseInt(format.split("-",2)[1])
			List<Map<String, String>> UI = utils.extractDataTableWithPages(page, findTestObject('Object Repository/Common/Table/table_Table'))
			utils.addGlobalVariable(name, UI)
		}else {
			throw new Exception('Invalid input')
		}
	}

	@When("I reverse order of the list {string}")
	def i_reverse_order_of_the_list(String list) {
		List<String> newList = GlobalVariable[list]
		Collections.reverse(newList)
		utils.addGlobalVariable(list, newList)
	}

	@When("I click on message {string} on the screen")
	def i_click_on_message_on_the_screen(String mess) {
		WebUI.waitForElementPresent(findTestObject("Object Repository/Common/p_text",['param':mess]), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject("Object Repository/Common/p_text",['param':mess]))
	}
}