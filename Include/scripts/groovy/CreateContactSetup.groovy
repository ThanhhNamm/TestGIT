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
import org.openqa.selenium.support.ui.WebDriverWait
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



class CreateContactSetup {
	@When("I add new into module {string} and expert user {string} in Contact Setup")
	def i_add_new_into_module_and_expert_user_in_contact_setup(String module, String user) {
		List<WebElement> listModule = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'MODULE']), GlobalVariable.MIN_WAIT)
		List<WebElement> listUser = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'EXPERT USER']), GlobalVariable.MIN_WAIT)
		//Select Module
		listModule.get(listModule.size()-1).sendKeys(module)
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/div_listbox'), GlobalVariable.MIN_WAIT)
		if(WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/span_columnOptions',['param':module]), GlobalVariable.MIN_WAIT)) {
			WebUI.scrollToElement(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/span_columnOptions',['param':module]), GlobalVariable.MIN_WAIT)
			WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/span_columnOptions',['param':module]))
		}else {
			WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/span_columnOptions',['param':'Add New']))
			WebUI.scrollToElement(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/span_columnOptions',['param':module]), GlobalVariable.MIN_WAIT)
			WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/span_columnOptions',['param':module]))
		}
		//Select Expert User
		String[] arr = user.split(",")
		for(int i=0; i<arr.length; i++) {
			switch(arr[i]) {
				case 'admin':
					user = 'ERBS.SSO'
					break
				case '0':
					user = 'Stag.SSO'
					break
				case '1':
					user = 'Stag.SSO01'
					break
				case 'trung':
					user = 'Trung Bui'
					break
				case 'phuc':
					user = 'Phuc'
					break
				default:
					throw new Exception('Invalid input')
			}
			listUser.get(listUser.size()-1).click()
			listUser.get(listUser.size()-1).sendKeys(user)
			WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/div_listbox'), GlobalVariable.MIN_WAIT)
			WebUI.delay(1)
			WebUI.scrollToElement(findTestObject('Object Repository/Common/Filters/input_CheckBox',['option':user]), GlobalVariable.MIN_WAIT)
			WebUI.click(findTestObject('Object Repository/Common/Filters/input_CheckBox',['option':user]))
			listUser.get(listUser.size()-1).sendKeys(Keys.TAB)
		}
	}

	@When("I input data into input field")
	def i_input_data_into_input_field(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		for(int i=0; i<dTable.size(); i++) {
			String field = dTable.get(i).get('Field Name')
			String data = dTable.get(i).get('Data')
			WebUI.scrollToElement(findTestObject('Object Repository/Data Focal/General Data/input_textNoSpace',['param':field]), GlobalVariable.MIN_WAIT)
			WebUI.click(findTestObject('Object Repository/Data Focal/General Data/input_textNoSpace',['param':field]))
			WebUI.sendKeys(findTestObject('Object Repository/Data Focal/General Data/input_textNoSpace',['param':field]), Keys.chord(Keys.CONTROL, 'a', Keys.BACK_SPACE))
			if(data.contains('Global')) {
				data = GlobalVariable[data.split("-",2)[1]]
			}
			WebUI.setText(findTestObject('Object Repository/Data Focal/General Data/input_textNoSpace',['param':field]), data)
		}
		WebUI.executeJavaScript("window.scrollBy(0,-500)", null)
	}

	@When("I delete all module with name {string}")
	def i_delete_all_module_with_name(String module) {
		List<WebElement> list = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'MODULE']), GlobalVariable.MIN_WAIT)
		for(int i=0; i<list.size(); i++) {
			String value = list.get(i).getAttribute('value')
			if(value.contains(module)) {
				list.get(i).findElement(By.xpath("./ancestor::div[contains(@class,'MuiFormControl-root')]/parent::div/following-sibling::div//*[local-name()='svg' and @data-testid='DeleteIcon']")).click()
				WebUI.click(findTestObject('Object Repository/Common/button_label', ['title' : 'Ok']))
				WebUI.waitForElementNotPresent(WebUI.convertWebElementToTestObject(list.get(i)), GlobalVariable.MIN_WAIT)
			}
		}
	}

	@When("I get random module and user list from Contact Setup Page")
	def i_get_random_module_and_user_list_from_contact_setup_page() {
		Random generator = new Random();
		List<WebElement> module = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'MODULE']), GlobalVariable.MIN_WAIT)
		int num = generator.nextInt(module.size())
		utils.addGlobalVariable('MODULE', module.get(num).getAttribute('value'))
		List<WebElement> user = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'EXPERT USER']), GlobalVariable.MIN_WAIT)
		user.get(num).click()
		List<WebElement> allusers = user.get(num).findElements(By.xpath("./preceding-sibling::div/span"))
		List<String> allusersText = allusers.collect{x -> x.getText()}
		utils.addGlobalVariable('USERS', allusersText)
	}

	@When("I input module {string} into the search bar in Contact Us page")
	def i_input_module_into_the_search_bar_in_contact_us_page(String data) {
		if(data.contains('Global')) {
			data = GlobalVariable[data.split("-", 2)[1]]
		}
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/input_Placeholder',['param':'Module Name']), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Common/input_Placeholder',['param':'Module Name']))
		WebUI.waitForElementPresent(findTestObject('Object Repository/Avatar/Role Management/svg_param',['param':'CloseIcon']), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Avatar/Role Management/svg_param',['param':'CloseIcon']))
		WebUI.setText(findTestObject('Object Repository/Common/input_Placeholder',['param':'Module Name']), data)
		WebUI.waitForElementPresent(findTestObject('Object Repository/Avatar/Contact Us/p_searchResultWithText',['param':data]), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Avatar/Contact Us/p_searchResultWithText',['param':data]))
	}

	@Then("The table in Contact Us page should display all users match with module")
	def the_table_in_contact_us_page_should_display_all_users_match_with_module() {
		List<Map<String, String>> table = utils.extractDataTableWithText(findTestObject('Object Repository/Common/Table/table_Table'))
		List<String> expert_user = GlobalVariable['USERS']
		for(int i=0; i<table.size(); i++) {
			Assert.assertTrue(expert_user.contains(table.get(i).get('Name')),'User is not displayed in the table')
		}
	}

	@Then("New field Module and Expert User are displayed with null value in Contact Setup page")
	def new_field_module_and_expert_user_are_displayed_with_null_value_in_contact_setup_page() {
		List<WebElement> listModule = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'MODULE']), GlobalVariable.MIN_WAIT)
		List<WebElement> listUser = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'EXPERT USER']), GlobalVariable.MIN_WAIT)
		Assert.assertEquals(listModule.get(listModule.size()-1).getAttribute('value'), '', 'Module field is not new')
		Assert.assertEquals(listUser.get(listUser.size()-1).getAttribute('value'), '', 'Module field is not new')
	}

	@When("I get all data of column {string} base on the condition {string}")
	def i_get_all_data_of_column_base_on_the_condition(String column, String condition) {
		switch(condition) {
			case 'Status is Active':
				List<Map<String, String>> dTable = utils.extractDataTableWithAllPages(findTestObject('Object Repository/Common/Table/table_Table'))
				List<String> columnList = new ArrayList<>()
				for(int i=0; i<dTable.size(); i++) {
					if(dTable.get(i).get('Status').equals('Active')) {
						columnList.add(dTable.get(i).get(column).replace("\n", " "))
					}
				}
				utils.addGlobalVariable("CONTACT_COLUMN", columnList)
				break
			default:
				throw new Exception('Invalid input')
		}
	}

	@Then("{string} field should contain data match with list {string}")
	def field_should_contain_data_match_with_list(String field, String list) {
		Actions actions = new Actions(DriverFactory.getWebDriver())
		List<String> newList = GlobalVariable[list.split("-",2)[1]]
		List<WebElement> fieldList = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':field]), GlobalVariable.MIN_WAIT)
		for(int i=0; i<fieldList.size(); i++) {
			fieldList.get(i).click()
			WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/div_listbox'), GlobalVariable.MIN_WAIT)
			List<String> options = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Common/Filters/p_SearchResults'), GlobalVariable.MIN_WAIT).collect{x -> x.getText()}
			for(int j=0; j<options.size(); j++) {
				Assert.assertTrue(newList.contains(options.get(j)), 'Element not exist in the dropdown list')
			}
			actions.sendKeys(fieldList.get(i), Keys.TAB).perform()
		}
	}

	@When("I get all module list from Contact Setup Page")
	def i_get_all_module_list_from_contact_setup_page() {
		List<WebElement> module = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'MODULE']), GlobalVariable.MIN_WAIT)
		List<String> moduleList = new ArrayList<>()
		for(int i=0; i<module.size(); i++) {
			moduleList.add(module.get(i).getAttribute('value'))

		}
		utils.addGlobalVariable("MODULE_LIST", moduleList)

	}

	@Then("The dropdown in Contact Us page should display all module")
	def the_dropdown_in_contact_us_page_should_display_all_module() {
		List<String> all = GlobalVariable['MODULE_LIST']
		for(int i=0; i<all.size(); i++) {
			WebUI.verifyElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/p_statusDropdown',['param':all.get(i)]), GlobalVariable.MIN_WAIT)
		}
	}

	@When("I get helpdesk contact information from Contact Setup Page")
	def i_get_helpdesk_contact_information_from_contact_setup_page() {
		String contactNumberText = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/input_name',['param':'contact_no']), GlobalVariable.MIN_WAIT).getAttribute('value')
		String emailText = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/input_name',['param':'email']), GlobalVariable.MIN_WAIT).getAttribute('value')
		utils.addGlobalVariable("CONTACT_NUMBER_TEXT", contactNumberText)
		utils.addGlobalVariable("EMAIL_TEXT", emailText )
	}

	@Then("The Helpdask Information in Contact Us page should match with Contact Setup")
	def the_helpdask_information_in_contact_us_page_should_match_with_contact_setup() {
		WebUI.verifyElementVisible(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/h6_text',['param':GlobalVariable.CONTACT_NUMBER_TEXT]))
		WebUI.verifyElementVisible(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/h6_text',['param':GlobalVariable.EMAIL_TEXT]))
	}

	@When("I verify Email and Role of random Expert User")
	def I_verify_email_and_role_of_random_expert_user() {

		List<Map<String, WebElement>> dTable = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))
		Random rand = new Random();
		int i = rand.nextInt(dTable.size())
		String nameText = dTable.get(i).get('Name').getText()
		String emailText = dTable.get(i).get('Email').getText()
		String roleText = dTable.get(i).get('Role').getText()

		utils.addGlobalVariable('NAME_TEXT', nameText)
		utils.addGlobalVariable('EMAIL_TEXT', emailText)
		utils.addGlobalVariable('ROLE_TEXT', roleText)
	}

	@When("I add new module {string} into newest module")
	def i_add_new_module_into_newest_module(String module) {
		List<WebElement> listModule = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'MODULE']), GlobalVariable.MIN_WAIT)
		//Select Module
		listModule.get(listModule.size()-1).sendKeys(module)
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/div_listbox'), GlobalVariable.MIN_WAIT)
		if(WebUI.waitForElementNotPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/span_columnOptions',['param':module]), GlobalVariable.MIN_WAIT)) {
			WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/span_columnOptions',['param':'Add New']))
		}
		listModule.get(listModule.size()-1).sendKeys(Keys.chord(Keys.TAB))
	}

	@When("I select {string} in last {string} in Contact Setup page")
	def i_select_in_last_in_contact_setup_page(String name, String field) {
		List<WebElement> listModule = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':field]), GlobalVariable.MIN_WAIT)
		//Select Module
		listModule.get(listModule.size()-1).sendKeys(name)
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/div_listbox'), GlobalVariable.MIN_WAIT)
		WebUI.scrollToElement(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/span_columnOptions',['param':name]), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/span_columnOptions',['param':name]))
		Assert.assertEquals(listModule.get(listModule.size()-1).getAttribute('value'), name, field + ' name is not correct, please check again')
	}

	@Then("New module should have name is {string} in the Contact Setup page")
	def new_module_should_have_name_is_in_the_contact_setup_page(String name) {
		List<WebElement> listModule = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'MODULE']), GlobalVariable.MIN_WAIT)
		Assert.assertEquals(listModule.get(listModule.size()-1).getAttribute('value'), name, 'MODULE name is not correct, please check again')
	}

	@When("I get all module name in the Contact Setup page")
	def i_get_all_module_name_in_the_contact_setup_page() {
		List<String> listModule = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'MODULE']), GlobalVariable.MIN_WAIT).collect{x -> x.getAttribute('value')}
		utils.addGlobalVariable('MODULE_NAMES', listModule)
	}

	@Then("New module should not contain any data from list {string} in Contact Setup page")
	def new_module_should_not_contain_any_data_from_list_in_contact_setup_page(String list) {
		List<String> global_list = GlobalVariable[list]
		List<WebElement> listModule = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'MODULE']), GlobalVariable.MIN_WAIT)
		//Select Module
		listModule.get(listModule.size()-1).click()
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/div_listbox'), GlobalVariable.MIN_WAIT)
		List<String> UI_options = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/div_listbox'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//span")).collect { x -> x.getText() }
		UI_options.remove(UI_options.size()-1)
		for(int i=0; i<UI_options.size(); i++) {
			Assert.assertFalse(listModule.contains(UI_options.get(i)), 'Option '+UI_options.get(i)+' is exist in the list')
		}
	}

	@When("I update data of the {int} module in Contact Setup page")
	def i_update_data_of_the_module_in_contact_setup_page(int index, DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		List<WebElement> listModule = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'MODULE']), GlobalVariable.MIN_WAIT)
		List<WebElement> listUser = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'EXPERT USER']), GlobalVariable.MIN_WAIT)
		for(int i=0; i<dTable.size(); i++) {
			String field = dTable.get(i).get('Field')
			String value = dTable.get(i).get('Data')
			switch(field) {
				case 'EXPERT USER':
					listUser.get(index-1).click()
					listUser.get(index-1).sendKeys(value)
					WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/div_listbox'), GlobalVariable.MIN_WAIT)
					WebUI.delay(1)
					WebUI.scrollToElement(findTestObject('Object Repository/Common/Filters/input_CheckBox',['option':value]), GlobalVariable.MIN_WAIT)
					if(!WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Filters/input_CheckBox',['option':value]), GlobalVariable.MIN_WAIT).isSelected()) {
						WebUI.click(findTestObject('Object Repository/Common/Filters/input_CheckBox',['option':value]))
					}
					listUser.get(listUser.size()-1).sendKeys(Keys.TAB)
					break
				default:
					throw new Exception('Invalid input')
			}
		}
	}

	@Then("The module of index {int} should have user as displayed")
	def the_module_of_index_should_have_user_as_displayed(int index, DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		List<WebElement> listUser = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'EXPERT USER']), GlobalVariable.MIN_WAIT)
		listUser.get(index-1).click()
		List<String> allUser = listUser.get(index-1).findElements(By.xpath("./preceding-sibling::div")).collect{x -> x.getText()}
		for(int i=0; i<dTable.size(); i++) {
			Assert.assertTrue(dTable.contains(allUser.get(i)), 'User not exist in the UI')
		}
	}

	@When("I select data from the dropdown list in the input field of {string}")
	def i_select_data_from_the_dropdown_list_in_the_input_field_of(String field, DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		WebUI.waitForElementPresent(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':field]), GlobalVariable.MIN_WAIT)
		for(int i=0; i<dTable.size(); i++) {
			WebUI.click(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':field]))
			WebUI.sendKeys(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':field]), dTable.get(i))
			WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/div_listbox'), GlobalVariable.MIN_WAIT)
			WebUI.delay(1)
			WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/div_listbox'), GlobalVariable.MIN_WAIT).findElement(By.xpath(".//p[normalize-space(text())='"+dTable.get(i)+"']")).click()
			WebUI.sendKeys(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':field]), Keys.chord(Keys.TAB))
		}
	}

	@Then("The module name {string} should have user name as expected")
	def the_module_name_should_have_user_name_as_expected(String module, DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		List<WebElement> listModule = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'MODULE']), GlobalVariable.MIN_WAIT)
		List<WebElement> listUser = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'EXPERT USER']), GlobalVariable.MIN_WAIT)
		for(int i=0; i<listModule.size(); i++) {
			if(listModule.get(i).getAttribute('value').equals(module)) {
				listUser.get(i).click()
				List<String> allUser = listUser.get(i).findElements(By.xpath("./preceding-sibling::div")).collect{x -> x.getText()}
				for(int j=0; j<allUser.size(); j++) {
					Assert.assertTrue(allUser.contains(dTable.get(j)), 'User is not correct')
				}
			}
		}
	}

	@Then("User of module {string} should contain user as expected {string}")
	def user_of_module_should_contain_user_as_expected(String index, String users) {
		List<WebElement> listUser = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Avatar/Contact Setup/input_withText',['param':'EXPERT USER']), GlobalVariable.MIN_WAIT)
		String[] arr = users.split(",")
		if(index.equals('last')) {
			listUser.get(listUser.size()-1).click()
			List<String> allUser = listUser.get(listUser.size()-1).findElements(By.xpath("./preceding-sibling::div")).collect{x -> x.getText()}
			for(int j=0; j<allUser.size(); j++) {
				Assert.assertTrue(allUser.contains(arr[j]), 'User is not correct')
			}
		}
	}

	@When("I scroll to the top of the website")
	def i_scroll_to_the_top_of_the_website() {
		WebUI.delay(5)
		WebUI.executeJavaScript("window.scrollBy(0,-500)", null)
	}
}
