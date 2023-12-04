import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import static org.junit.Assert.assertEquals

import java.time.LocalDate
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

import org.openqa.selenium.By
import org.openqa.selenium.Keys
import org.openqa.selenium.WebElement
import org.openqa.selenium.interactions.Actions
import org.testng.Assert

import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
import com.kms.katalon.core.webui.common.WebUiCommonHelper
import com.kms.katalon.core.webui.driver.DriverFactory
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI

import common.DBConnection
import common.customKW
import common.utils
import cucumber.api.java.en.Then
import cucumber.api.java.en.When
import internal.GlobalVariable
import io.cucumber.datatable.DataTable

class MaterialForecastReport {
	@When("Click on {string} tab")
	def click_on_tab(String label) {
		WebUI.click(findTestObject('Object Repository/Material Forecast Analyzer/h3_tabs', [title : label]))
	}

	@When("Click on {string} search box")
	def click_on_searchbox(String boxname) {
		WebUI.click(findTestObject('Object Repository/Common/Filters/div_SearchBox', [title : boxname]))
	}

	@When("Click on {string} search arrow")
	def click_on_searcharrow(String boxname) {
		WebUI.click(findTestObject('Object Repository/Common/Filters/button_SearchArrow', [title : boxname]))
	}

	@Then("5 search boxes should be displayed")
	def verify_5_searchboxes_display(DataTable fields) {
		List<String> boxnames = fields.asList()
		List<String> elmText = customKW.getTextElements(findTestObject('Object Repository/Common/Filters/p_BoxNameLists'))
		customKW.verifyLists(elmText, boxnames)
		assertEquals(elmText.size(), boxnames.size())
	}

	@When("Input {string} into {string} search box")
	def input_key_into_searchbox(String text, String fields) {
		WebUI.click(findTestObject('Object Repository/Common/Filters/input_SearchTextBox', [title : fields]))
		WebUI.setText(findTestObject('Object Repository/Common/Filters/input_SearchTextBox', [title : fields]), text)
	}

	@Then("{string} should be contained in search results")
	def verify_key_with_result(String text) {
		List<String> results = customKW.getTextElements(findTestObject('Object Repository/Common/Filters/p_SearchResults'))
		for (String i : results) {
			Assert.assertTrue(i.contains(text.toUpperCase()), 'Keyword is not contained in search results')
		}
	}

	@When("I select filter option {string} in Material Forecast Report page")
	def i_select_filter_option_in_material_forecast_report_page(String option) {
		if(option.contains("index-")) {
			int index = Integer.parseInt(option.split("-",2)[1])-1
			WebUI.waitForElementPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_allFilters'), GlobalVariable.MIN_WAIT)
			List<WebElement> list = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_allFilters'), GlobalVariable.MIN_WAIT)
			if(index > 5) {
				WebUI.click(findTestObject("Object Repository/Common/div_class",['param':'slick-next']))
			}
			String name = list.get(index).findElement(By.xpath(".//p/preceding-sibling::div")).getText()
			list.get(index).click()
			utils.addGlobalVariable('FILTER_NAME', name)
		}else {
			if(option.contains("Global-")) {
				option = GlobalVariable[option.split("-",2)[1]]
			}
			if(WebUI.waitForElementNotPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_filterName',['param':option]), GlobalVariable.MIN_WAIT)) {
				WebUI.click(findTestObject("Object Repository/Common/div_class",['param':'slick-next']))
			}
			WebUI.click(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_filterName',['param':option]))
		}
	}

	@When("I select options in {string} field")
	def i_select_options_in_field(String name, DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/Filters/svg_icon',['param':name, 'param1':'ArrowDropDownIcon']), GlobalVariable.MIN_WAIT)
		for(int i=0; i<dTable.size(); i++) {
			Random rand = new Random();
			String text = dTable.get(i)
			if(text.equals('random')) {
				WebUI.click(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':name]))
				WebUI.delay(3)
				List<WebElement> options = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/input_notCheckedOptions'), GlobalVariable.MIN_WAIT)
				List<String> optionName = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/p_optionsText'), GlobalVariable.MIN_WAIT).collect({ x ->
					x.getText()
				})
				int r = rand.nextInt(options.size())
				options.get(r).click()
				utils.addGlobalVariable('RANDOM_VALUE_FROM_FILTER', optionName.get(r))
				WebUI.sendKeys(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':name]), Keys.chord(Keys.TAB))
			}else if(text.contains('Global')){
				text = GlobalVariable[text.split("-",2)[1]]
				WebUI.click(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':name]))
				WebUI.sendKeys(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':name]), text)
				WebUI.delay(3)
				WebUI.click(findTestObject('Object Repository/Common/Filters/input_CheckBox',['option':text]))
				WebUI.sendKeys(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':name]), Keys.chord(Keys.TAB))
			}else {
				WebUI.click(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':name]))
				WebUI.sendKeys(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':name]), text)
				WebUI.delay(3)
				WebUI.click(findTestObject('Object Repository/Common/Filters/input_CheckBox',['option':text]))
				WebUI.sendKeys(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':name]), Keys.chord(Keys.TAB))
			}
		}
	}

	@When("I delete all option of filter option in Material Forecast Report")
	def i_delete_all_option_of_filter_option_in_material_forecast_report(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		for(int i=0; i<dTable.size(); i++) {
			String name = dTable.get(i).get('Name')
			String type = dTable.get(i).get('Type')
			switch(type) {
				case 'FIELD':
					WebUI.click(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':name]))
					if(WebUI.waitForElementPresent(findTestObject('Object Repository/Common/Filters/svg_icon',['param':name,'param1':'CloseIcon']), GlobalVariable.MIN_WAIT)) {
						WebUI.click(findTestObject('Object Repository/Common/Filters/svg_icon',['param':name,'param1':'CloseIcon']))
					}
					WebUI.sendKeys(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':name]), Keys.chord(Keys.TAB))
					break
				case 'OPTION':
					List<WebElement> list = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Common/Filters/button_filterOption',['param':name]), GlobalVariable.MIN_WAIT)
					for(int a=0; a<list.size(); a++) {
						if(list.get(a).getAttribute('aria-pressed').equals('true')) {
							list.get(a).click()
						}
					}
					break
				default:
					throw new Exception('Invalid type!')
			}
		}
	}

	@Then("An alert with text {string} should be displayed")
	def an_alert_with_text_should_be_displayed(String text) {
		WebUI.delay(2)
		WebElement ls = DriverFactory.getWebDriver().findElement(By.xpath("//div[contains(@class, 'MuiAlert-message')]"))
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/div_class',['param':'MuiAlert-message']), GlobalVariable.MIN_WAIT)
		Assert.assertEquals(text, ls.getText(), 'Two messages are not correct')
	}

	@When("I click to move to {string} page")
	def i_click_to_move_to_page(String button) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/button_ariaLabel',['param':button]), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Common/button_ariaLabel',['param':button]))
	}

	@Then("Option in the field of Material Forecast Report should be displayed as expected")
	def option_in_the_field_of_material_forecast_report_should_be_displayed_as_expected(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		for(int i=0; i<dTable.size(); i++) {
			String name = dTable.get(i).get('Name')
			String type = dTable.get(i).get('Type')
			String data = dTable.get(i).get('Data')
			if(data.contains('Global')) {
				data = GlobalVariable[data.split("-",2)[1]]
			}
			switch(type) {
				case 'FIELD':
					WebUI.scrollToElement(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'Material Forecast Report']), GlobalVariable.MIN_WAIT)
					WebUI.click(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':name]))
					List<WebElement> lists = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':name]), GlobalVariable.MIN_WAIT).findElements(By.xpath("./preceding-sibling::div//span"))
					List<String> testL = lists.collect{x -> x.getText()}
					println 'ZXCZXC '+testL
					Assert.assertTrue(testL.contains(data), 'The input data is NOT displayed correctly '+data)
					break
				case 'OPTION':
					List<WebElement> lists = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Common/Filters/button_filterOption',['param':name]), GlobalVariable.MIN_WAIT)
					for(int a=0; a<lists.size(); a++) {
						if(lists.get(a).getAttribute('value'.equals(data))) {
							Assert.assertTrue(lists.get(a).getAttribute('aria-pressed').equals('true'), 'Search parameter is NOT included in the search field')
						}
					}
					break
				default:
					throw new Exception('Invalid type!')
			}
		}
	}

	@Then("Column in table should have data match with expected result in Material Forecast Report")
	def column_in_table_should_have_data_match_with_expected_result_in_material_forecast_report(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		List<Map<String, WebElement>> table = utils.extractDataTableWithTheadAndTbody(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<dTable.size(); i++) {
			String column = dTable.get(i).get('Column')
			String oper = dTable.get(i).get('Operator')
			String expec = dTable.get(i).get('Expected')
			//Expected
			if(expec.contains('Date Time')) {
				String newFormat = expec.split("-",2)[1]
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern(newFormat)
				LocalDateTime now = LocalDateTime.now()
				expec = dtf.format(now)
			}else if(expec.contains('Global')) {
				expec = GlobalVariable[expec.split("-",2)[1]]
			}
			for(int j=0; j<table.size(); j++) {
				//Operators
				switch(oper.toUpperCase()) {
					case 'CONTAINS':
						Assert.assertTrue(table.get(j).get(column).getText().trim().replace("\n", " ").contains(expec), 'Data in column does not contain expected result')
						break
					case 'EQUALS':
						Assert.assertEquals(table.get(j).get(column).getText().trim().replace("\n", " "), expec, 'Two data are not equal')
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
						Assert.assertTrue(num1 <= fromUI, 'Wrong expected with number 1')
						Assert.assertTrue(fromUI <= num2, 'Wrong expected with number 2')
						break
					default:
						throw new Exception('Invalid input')
				}
			}
		}
	}

	@When("I select random value in {string} field")
	def i_select_random_value_in_field(String fieldName) {
		Random generator = new Random();
		WebUI.click(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':fieldName]))
		List<WebElement> options = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/input_options'), GlobalVariable.MIN_WAIT)
		int num = generator.nextInt(options.size())
		options.get(num).click()
		utils.addGlobalVariable(fieldName.toUpperCase().replaceAll("\\s", "_"), WebUI.getText(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/p_checkedOption')))
		WebUI.sendKeys(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':fieldName]), Keys.chord(Keys.TAB))
		println 'RANDOM' + GlobalVariable[fieldName.toUpperCase().replaceAll("\\s", "_")]
	}

	@Then("A new {string} should be displayed automatically")
	def a_new_should_be_displayed_automatically(String fieldName) {
		WebUI.delay(5)
		WebUI.click(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':fieldName]))
		WebUI.waitForElementPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_optionValue',['param':fieldName]), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_optionValue',['param':fieldName]), GlobalVariable.MIN_WAIT)
		utils.addGlobalVariable(fieldName.replaceAll("\\s", "_"), WebUI.getText(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_optionValue',['param':fieldName])))
	}

	@Then("SWEC Material Group displayed should be matched with database where Material No is {string}")
	def swec_material_group_displayed_should_be_matched_with_database_where_material_no_is(String matno) {
		new DBConnection(GlobalVariable.DB_HOSTNAME, GlobalVariable.DB_PORT, GlobalVariable.DB_INSTANCE_NAME,
				GlobalVariable.DB_USERNAME, GlobalVariable.DB_PASSWORD)
		if(matno.contains('Global')) {
			matno = GlobalVariable[matno.split("-",2)[1]]
		}
		String query = "select distinct swec_material_group from public.material_forecast_report_group_by_plant_and_material_view where material_no = '"+matno+"'"
		List<Map<String, String>> DBdata = DBConnection.executeQuery(query)
		String SWEC = GlobalVariable.SWEC_MAT_GROUP
		Assert.assertEquals(SWEC, DBdata.get(0).get('swec_material_group'), 'SWEC is not correct')
	}

	@Then("New region displayed should be matched with plant code and plant name in database")
	def new_region_displayed_should_be_matched_with_plant_code_and_plant_name_in_database() {
		new DBConnection(GlobalVariable.DB_HOSTNAME, GlobalVariable.DB_PORT, GlobalVariable.DB_INSTANCE_NAME,
				GlobalVariable.DB_USERNAME, GlobalVariable.DB_PASSWORD)
		String data = GlobalVariable['RANDOM_VALUE_FROM_FILTER']
		String code = data.split("-",2)[0].trim()
		String name = data.split("-",2)[1].trim()
		String query = "select region from material_forecast_report_data mfrd where plant_code = '"+code+"' and plant_name = '"+name+"' group by region"
		List<Map<String, String>> DBdata = DBConnection.executeQuery(query)
		String region = GlobalVariable.REGION
		Assert.assertEquals(region, DBdata.get(0).get('region'), 'REGION is not correct')
	}

	@When("I get all values from column {string} from the database")
	def i_get_all_values_from_column_from_the_database(String column, DataTable dataTable) {
		List<String> paramList = dataTable.asList()
		String[] arr = new String[paramList.size()];
		for(int i=0; i<paramList.size(); i++) {
			String text = paramList.get(i)
			if(text.contains('Global')) {
				text = GlobalVariable[text.split("-",2)[1]]
			}
			arr[i] = text
		}
		List<Map<String, String>> dataDB = utils.getDataFromDatabase(arr)
		List<String> columnList = new ArrayList<>()
		for(int i=0; i<dataDB.size(); i++) {
			columnList.add(dataDB.get(i).get(column))
		}
		utils.addGlobalVariable(column.toUpperCase(), columnList)
	}

	@Then("All data in column {string} must exist in list {string} of {int} pages")
	def all_data_in_column_must_exist_in_list_of_pages(String UIcolumn, String list, int pages) {
		List<Map<String, String>> UI = utils.extractDataTableWithPages(pages, findTestObject('Object Repository/Common/Table/table_Table'))
		List<String> globalList = GlobalVariable[list]
		for(int i=0; i<UI.size(); i++) {
			String value = UI.get(i).get(UIcolumn)
			Assert.assertTrue(globalList.contains(value), 'Value ' + value + ' is not exist in the list')
		}
	}

	@When("I get all filter name in Material Forecast Report and put it to list {string}")
	def i_get_all_filter_name_in_material_forecast_report_and_put_it_to_list(String list) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_allFilters'), GlobalVariable.MIN_WAIT)
		List<String> filters = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_filters'), GlobalVariable.MIN_WAIT).collect{x -> x.getText()}
		utils.addGlobalVariable(list.toUpperCase(), filters)
	}

	@Then("Two list should match with the condition between two lists")
	def two_list_should_match_with_the_condition_between_two_lists(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		for(int i=0; i<dTable.size(); i++) {
			List<String> list1 = GlobalVariable[dTable.get(i).get('List 1')]
			List<String> list2 = GlobalVariable[dTable.get(i).get('List 2')]
			String operator = dTable.get(i).get('Operator')
			int smaller;
			if(list1.size() < list2.size()) {
				smaller = list1.size()
			}else {
				smaller = list2.size()
			}
			for(int j=0; j<smaller; j++) {
				switch(operator) {
					case 'NOT EQUAL':
						Assert.assertNotEquals(list1.get(j), list2.get(j), 'Two element are equal')
						break
					default:
						throw new Exception('Invalid input')
				}
			}
		}
	}

	@Then("Material Forecast Report page should contain filter as expected")
	def material_forecast_report_page_should_contain_filter_as_expected(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		for(int i=0; i<dTable.size(); i++) {
			String name = dTable.get(i).get('Name')
			String type = dTable.get(i).get('Type')
			switch(type) {
				case 'FIELD':
					WebUI.waitForElementPresent(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':name]), GlobalVariable.MIN_WAIT)
					WebUI.verifyElementPresent(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':name]), GlobalVariable.MIN_WAIT)
					break
				case 'OPTION':
					WebUI.waitForElementPresent(findTestObject('Object Repository/Common/Filters/button_filterOption',['param':name]), GlobalVariable.MIN_WAIT)
					WebUI.verifyElementPresent(findTestObject('Object Repository/Common/Filters/button_filterOption',['param':name]), GlobalVariable.MIN_WAIT)
					break
				case 'TOGGLE':
					WebUI.waitForElementPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/input_filterOptionWithSpan',['param':name]), GlobalVariable.MIN_WAIT)
					WebUI.verifyElementPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/input_filterOptionWithSpan',['param':name]), GlobalVariable.MIN_WAIT)
					break
				default:
					throw new Exception('Invalid type!')
			}
		}
	}

	@When("I convert Plant Code Plant Name {string} into two")
	def i_convert_plant_code_plant_name_into_two(String plant) {
		if(plant.contains('Global')) {
			plant = GlobalVariable[plant.split("-",2)[1]]
		}
		utils.addGlobalVariable('PLANT_CODE', plant.split("-",2)[0].trim())
		utils.addGlobalVariable('PLANT_NAME', plant.split("-",2)[1].trim())
	}

	@Then("Option in the field {string} of Material Forecast Report should be displayed as default")
	def option_in_the_field_of_material_forecast_report_should_be_displayed_as_default(String field) {
		WebUI.scrollToElement(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'Material Forecast Report']), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':field]))
		List<WebElement> lists = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':field]), GlobalVariable.MIN_WAIT).findElements(By.xpath("./preceding-sibling::div//span"))
		Assert.assertEquals(lists.size(), 0, 'Field still have data')
	}

	@Then("{string} field should contain options below")
	def field_should_contain_options_below(String fieldName, DataTable dataTable) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/Filters/button_filterOption',['param':fieldName]), GlobalVariable.MIN_WAIT)
		List<String> buttons = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Common/Filters/button_filterOption',['param':fieldName]), GlobalVariable.MIN_WAIT).collect({x -> x.getText()})
		List<String> dTable = dataTable.asList()
		for(int i=0; i<buttons.size(); i++) {
			Assert.assertEquals(buttons.get(i), dTable.get(i), 'Two options are not equal')
		}
	}

	@Then("The button {string} in {string} field should be {string}")
	def the_button_in_field_should_be(String button, String field, String status) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/p_OptionsWithText',['param':field]), GlobalVariable.MIN_WAIT)
		List<WebElement> buttons = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/p_OptionsWithText',['param':field]), GlobalVariable.MIN_WAIT)
		for(int i=0; i<buttons.size(); i++) {
			if(button.equals(buttons.get(i).getText())) {
				String attribute = buttons.get(i).findElement(By.xpath("./parent::button")).getAttribute('class')
				switch(status){
					case 'selected':
						Assert.assertTrue(attribute.contains('Mui-selected'), 'Button is not selected')
						break
					case 'not selected':
						Assert.assertFalse(attribute.contains('Mui-selected'), 'Button is not selected')
						break
					default:
						throw new Exception("Invalid input")
				}
			}
		}
	}

	@Then("The filter of these field should be displayed as default")
	def the_filter_of_these_field_should_be_displayed_as_default(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		for(int i=0; i<dTable.size(); i++) {
			String name = dTable.get(i).get('Name')
			String type = dTable.get(i).get('Type')
			switch(type) {
				case 'FIELD':
					WebUI.scrollToElement(findTestObject('Object Repository/Common/h1_PageTitle', ['title' : 'Material Forecast Report']), GlobalVariable.MIN_WAIT)
					WebUI.click(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':name]))
					List<WebElement> lists = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':name]), GlobalVariable.MIN_WAIT).findElements(By.xpath("./preceding-sibling::div//span"))
					List<String> testL = lists.collect{x -> x.getText()}
					Assert.assertTrue(testL.size() == 0, 'The filter '+name+' still have data!')
					break
				case 'OPTION':
					List<WebElement> lists = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Common/Filters/button_filterOption',['param':name]), GlobalVariable.MIN_WAIT)
					for(int a=0; a<lists.size(); a++) {
						Assert.assertTrue(lists.get(a).getAttribute('aria-pressed').equals('false'), 'Value '+a+' is selected!')
					}
					break
				case 'TOGGLE':
					WebUI.waitForElementPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/input_filterOptionWithSpan',['param':name]), GlobalVariable.MIN_WAIT)
					String att = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/input_filterOptionWithSpan',['param':name]), GlobalVariable.MIN_WAIT).findElement(By.xpath("./parent::span")).getAttribute('class')
					Assert.assertFalse(att.contains('Mui-checked'), 'Toggle is on')
					break
				default:
					throw new Exception('Invalid type!')
			}
		}
	}

	@When("I delete first filter in the Material Forecast Report")
	def i_delete_first_filter_in_the_material_forecast_report() {
		Actions action = new Actions(DriverFactory.getWebDriver());
		WebUI.waitForElementPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_allFilters'), GlobalVariable.MIN_WAIT)
		List<WebElement> filters = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_filters'), GlobalVariable.MIN_WAIT)
		//		filters.get(0).findElement(By.xpath(".//span[@role='button']")).click()
		action.moveToElement(filters.get(0).findElement(By.xpath(".//span[@role='button']"))).doubleClick().perform()
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/span_columnOptions',['param':'Delete']), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/span_columnOptions',['param':'Delete']))
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/Pop-Up/span_popup',['param':'Confirmation']), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Common/button_label', ['title' : 'OK']))
	}

	@When("I input text into field in the {string} pop up")
	def i_input_text_into_field_in_the_pop_up(String popupName, DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/Pop-Up/span_popup',['param':popupName]), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementPresent(findTestObject('Object Repository/Common/Pop-Up/span_popup',['param':popupName]), GlobalVariable.MIN_WAIT)
		for(int i=0; i<dTable.size(); i++) {
			String field = dTable.get(i).get('FIELD')
			String value = dTable.get(i).get('VALUE')
			if(value.contains('random-')) {
				value = utils.randomString(Integer.parseInt(value.split("-",2)[1]))
			}
			WebUI.click(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':field]))
			WebUI.setText(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':field]), value)
			WebUI.sendKeys(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':field]), Keys.chord(Keys.TAB))
		}
	}

	@Then("The list {string} should contain these elements below")
	def the_list_should_contain_these_elements_below(String listName, DataTable dataTable) {
		List<String> list = GlobalVariable[listName]
		List<String> dTable = dataTable.asList()
		for(int i=0; i<dTable.size(); i++) {
			String data = dTable.get(i)
			if(data.contains('Global')) {
				data = GlobalVariable[data.split("-",2)[1]]
			}
			Assert.assertTrue(list.contains(data), 'List does not contain value '+data)
		}
	}

	@Then("An error message of {string} in popup should be displayed as {string}")
	def an_error_message_of_in_popup_should_be_displayed_as(String field, String message) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/p_OptionsWithText',['param':field]), GlobalVariable.MIN_WAIT)
		String text = WebUI.getText(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/p_OptionsWithText',['param':field]))
		Assert.assertEquals(message, text, 'Two messages are not equal')
	}

	@When("I add new filter until it reach {int} filters in Material Forecast Report")
	def i_add_new_filter_until_it_reach_filters_in_material_forecast_report(int numOfFilter) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_allFilters'), GlobalVariable.MIN_WAIT)
		List<String> filters = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_filters'), GlobalVariable.MIN_WAIT).collect{x -> x.getText()}
		for(int i=filters.size(); i<10; i++) {
			WebUI.click(findTestObject('Object Repository/Common/button_label', ['title' : 'Save Filters']))
			WebUI.waitForElementPresent(findTestObject('Object Repository/Common/Pop-Up/span_popup',['param':'Add New Filter']), GlobalVariable.MIN_WAIT)
			WebUI.setText(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':'FILTER NAME']), utils.randomString(10))
			WebUI.click(findTestObject('Object Repository/Common/button_label', ['title' : 'Save']))
		}
	}

	@When("I get all value of all filter in Material Forecast Report")
	def i_get_all_value_of_all_filter_in_material_forecast_report() {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_allFilters'), GlobalVariable.MIN_WAIT)
		List<String> filters = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_filtersValue'), GlobalVariable.MIN_WAIT).collect{x -> x.getText()}
		List<String> listWithNum = new ArrayList()
		for(int i=0; i<filters.size(); i++) {
			String newValue = filters.get(i).replace("RM", "")
			Double convertedValue
			if(newValue.length() > 0) {
				if(!Character.isDigit(newValue.charAt(newValue.length()-1))) {
					String currency = String.valueOf(newValue.charAt(newValue.length()-1))
					Double value = Double.parseDouble(newValue.substring(0, newValue.length()-1))
					switch(currency) {
						case 'K':
							convertedValue = value * 1000
							break
						case 'M':
							convertedValue = value * 1000000
							break
						case 'B':
							convertedValue = value * 1000000000
							break
						default:
							throw new Exception("Invalid input")
					}
				}else {
					convertedValue = Double.parseDouble(newValue)
				}
			}else {
				convertedValue = Double.parseDouble(newValue)
			}
			listWithNum.add(String.valueOf(convertedValue))
		}
		utils.addGlobalVariable('FILTERS_VALUE', listWithNum)
	}

	@Then("Value in the list {string} should been sorted from {string}")
	def value_in_the_list_should_been_sorted_from(String listName, String order) {
		List<String> list = GlobalVariable[listName]
		List<String> newList = list
		switch(order) {
			case 'ASC':
				Collections.sort(list)
				break
			case 'DSC':
				Collections.sort(list, Collections.reverseOrder())
				break
			default:
				throw new Exception("Invalid input")
		}
		Assert.assertEquals(list, newList, 'Wrong order')
	}

	@When("I duplicate filter {string} in the Material Forecast Report")
	def i_duplicate_filter_in_the_material_forecast_report(String filterName) {
		WebUI.refresh()
		WebUI.delay(5)
		Actions action = new Actions(DriverFactory.getWebDriver())
		WebUI.waitForElementPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_allFilters'), GlobalVariable.MIN_WAIT)
		List<WebElement> filters = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_filters'), GlobalVariable.MIN_WAIT)
		if(filterName.contains('Global')) {
			filterName = GlobalVariable[filterName.split("-",2)[1]]
		}
		for(int i=0; i<filters.size(); i++) {
			println 'ZXC '+i
			if(filters.get(i).getText().equals(filterName)) {
				if(filters.get(i).findElement(By.xpath(".//div/preceding-sibling::div")).isDisplayed()) {
					action.moveToElement(filters.get(i).findElement(By.xpath(".//span[@role='button']"))).doubleClick().perform()
					break
				}else {
					WebUI.click(findTestObject("Object Repository/Common/div_class",['param':'slick-next']))
					action.moveToElement(filters.get(i).findElement(By.xpath(".//span[@role='button']"))).doubleClick().perform()
					break
				}
			}
		}
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/span_columnOptions',['param':'Duplicate']), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/span_columnOptions',['param':'Duplicate']))
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/Pop-Up/span_popup',['param':'Duplicate']), GlobalVariable.MIN_WAIT)
	}

	@When("I click to three dots icon in any filter in the Material Forecast Report page")
	def i_click_to_three_dots_icon_in_any_filter_in_the_material_forecast_report_page() {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_allFilters'), GlobalVariable.MIN_WAIT)
		List<WebElement> filters = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_allFilters'), GlobalVariable.MIN_WAIT)
		Random rand = new Random();
		int randomNumber = rand.nextInt(filters.size())
		if(!(filters.get(randomNumber).findElement(By.xpath(".//*[local-name()='svg']")).isDisplayed())) {
			WebUI.click(findTestObject("Object Repository/Common/div_class",['param':'slick-next']))
		}
		utils.addGlobalVariable('ANY_FILTER_IN_MAT', filters.get(randomNumber).findElement(By.xpath(".//p/preceding-sibling::div")).getText())
		filters.get(randomNumber).findElement(By.xpath(".//*[local-name()='svg']")).click()
	}

	@Then("The filter with name {string} should not be displayed in the Material Forecast Report page")
	def the_filter_with_name_should_not_be_displayed_in_the_material_forecast_report_page(String name) {
		if(name.contains('Global')) {
			name = GlobalVariable[name.split("-",2)[1]]
		}
		WebUI.waitForElementNotPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_filterName',['param':name]), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementNotPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/div_filterName',['param':name]), GlobalVariable.MIN_WAIT)
	}

	@When("I select options in multiple choice {string}")
	def i_select_options_in_multiple_choice(String field, DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		List<WebElement> list = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Common/Filters/button_filterOption',['param':field]), GlobalVariable.MIN_WAIT)
		for(int i=0; i<dTable.size(); i++) {
			for(int j=0; j<list.size(); j++) {
				String text = dTable.get(i)
				if(list.get(j).getText().equals(text)) {
					list.get(j).click()
				}
			}
		}
	}

	@When("I turn {string} the toggle {string}")
	def i_turn_the_toggle(String status, String toggle) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/input_filterOptionWithSpan',['param':toggle]), GlobalVariable.MIN_WAIT)
		String att = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/input_filterOptionWithSpan',['param':toggle]), GlobalVariable.MIN_WAIT).findElement(By.xpath("./parent::span")).getAttribute('class')
		switch(status) {
			case 'on':
				if(!att.contains('Mui-checked')) {
					WebUI.click(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/input_filterOptionWithSpan',['param':toggle]))
				}
				break
			case 'off':
				if(att.contains('Mui-checked')) {
					WebUI.click(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/input_filterOptionWithSpan',['param':toggle]))
				}
				break
			default:
				throw new Exception('Invalid input')
		}
	}

	@Then("All data in the Material Forecast Report table must match condition {string}")
	def all_data_in_the_material_forecast_report_table_must_match_condition(String condition) {
		if(condition.equals('Stock equal 0')) {
			List<Map<String, WebElement>> UI = utils.extractDataTableWithTheadAndTbody(findTestObject('Object Repository/Common/Table/table_Table'))
			for(int i=0; i<UI.size(); i++) {
				String code = UI.get(i).get('Plant Code').getText()
				String name = UI.get(i).get('Plant Name').getText()
				String swec = UI.get(i).get('SWEC Material Group').getText()
				String matno = UI.get(i).get('Material No').getText()
				List<Map<String, String>> dataDB = utils.getDataFromDatabase(code, name, swec, matno)
				for(int j=0; j<dataDB.size(); j++) {
					Assert.assertEquals(dataDB.get(j).get('stock_quantity'), '0', 'Stock quantity not equal 0')
				}
			}
		}else if(condition.equals('Stock off')) {
			List<Map<String, WebElement>> UI = utils.extractDataTableWithTheadAndTbody(findTestObject('Object Repository/Common/Table/table_Table'))
			List<Map<String, String>> dataDB = utils.getDataFromDatabase()
			for(int i=0; i<UI.size(); i++) {
				println 'ZXCZXCZXC '+i
				Assert.assertEquals(UI.get(i).get('Material No').getText(), dataDB.get(i).get('material_no'), 'Material no are not the same')
				Assert.assertEquals(UI.get(i).get('Region').getText(), dataDB.get(i).get('region'), 'Region are not the same')
				Assert.assertEquals(UI.get(i).get('Plant Code').getText(), dataDB.get(i).get('plant_code'), 'Plant code are not the same')
				Assert.assertEquals(UI.get(i).get('Plant Name').getText(), dataDB.get(i).get('plant_name'), 'Plant name are not the same')
			}
		}else if(condition.equals('match plant code name')) {
			List<Map<String, WebElement>> UI = utils.extractDataTableWithTheadAndTbody(findTestObject('Object Repository/Common/Table/table_Table'))
			List<Map<String, String>> dataDB = utils.getDataFromDatabase(GlobalVariable['RANDOM_VALUE_FROM_FILTER'])
			List<String> code = dataDB.collect{ x -> x.get('plant_code')}
			List<String> name = dataDB.collect{ x -> x.get('plant_name')}
			for(int i=0; i<UI.size(); i++) {
				Assert.assertTrue(code.contains(UI.get(i).get('Plant Code').getText()))
				Assert.assertTrue(name.contains(UI.get(i).get('Plant Name').getText()))
			}
		}else {
			throw new Exception('Invalid input')
		}
	}

	@When("I click sort icon in column {string} to make it {string}")
	def i_click_sort_icon_in_column_to_make_it(String columnName, String status) {
		switch(status) {
			case 'ASC':
				if(WebUI.waitForElementNotPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/svg_sortIcon',['param':columnName,'param1':'iconDirectionAsc']), GlobalVariable.MIN_WAIT)) {
					WebUI.click(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/svg_sortIcon',['param':columnName,'param1':'iconDirectionDesc']))
				}
				break
			case 'DSC':
				if(WebUI.waitForElementNotPresent(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/svg_sortIcon',['param':columnName,'param1':'iconDirectionDesc']), GlobalVariable.MIN_WAIT)) {
					WebUI.click(findTestObject('Object Repository/Material Forecast Analyzer/Material Forecast Report/svg_sortIcon',['param':columnName,'param1':'iconDirectionAsc']))
				}
				break
			default:
				throw new Exception('Invalid input')
		}
	}

	@Then("These columns should not be displayed in the table")
	def these_columns_should_not_be_displayed_in_the_table(DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		List<WebElement> headers = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Table/table_Table'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//th"))
		for(int i=0; i<headers.size(); i++) {
			for(int j=0; j<dTable.size(); j++) {
				if(dTable.get(j).equals(headers.get(i).getText())) {
					Assert.assertFalse(headers.get(i).isDisplayed(), 'Column is still display')
				}
			}
		}
	}

	@Then("The order of table headers displayed on the screen should be as design")
	def the_order_of_table_headers_displayed_on_the_screen_should_be_as_design(DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		List<WebElement> headers = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Table/table_Table'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//th"))
		List<WebElement> tmp=new ArrayList<>()
		headers.each{
			if(WebUI.waitForElementVisible((WebUI.convertWebElementToTestObject(it)),  GlobalVariable.MIN_WAIT)) {
				tmp.add(it)
			}
		}
		List<String> allHeaders = tmp.collect{x -> x.getText()}
		println allHeaders
		for(int i=0; i<dTable.size(); i++) {
			Assert.assertEquals(dTable.get(i), allHeaders.get(i).trim().replace("*", "").replace("\n", " "))
		}
	}

	@When("I get {int} data from database with query in data file")
	def i_get_data_from_database_with_query_in_data_file(int num, DataTable dataTable) {
		List<String> paramList = dataTable.asList()
		String[] arr = new String[paramList.size()];
		for(int i=0; i<paramList.size(); i++) {
			String text = paramList.get(i)
			if(text.contains('Global')) {
				text = GlobalVariable[text.split("-",2)[1]]
			}
			arr[i] = text
		}
		List<Map<String, String>> DBdata = utils.getDataFromDatabaseWithNumber(num, arr)
		utils.addGlobalVariable('PART_LIST_MAP_FROM_DB', DBdata)
	}
	
	@When("I update data in key of list map {string}")
	def i_update_data_in_key_of_list_map(String list, DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		List<Map<String, String>> oldList = GlobalVariable[list]
		for(int i=0;i < dTable.size(); i++) {
			String column = dTable.get(i)
			//check column
			if(column.equals("potential_value_opportunity") || column.equals("Potential Value Opportunity")) {
				for(int j=0; j<oldList.size(); j++) {
					String value = oldList.get(j).get(column)
					if(!value.equals("")) {
						oldList.get(j).put(column, String.valueOf(Double.parseDouble(value)))
					}
				}
			}
		}
		utils.addGlobalVariable(list, oldList)
	}
}