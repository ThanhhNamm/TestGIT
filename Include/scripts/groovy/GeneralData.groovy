import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import common.DBConnection
import common.ExcelKeyword
import common.customKW
import common.utils
import internal.GlobalVariable
import io.cucumber.datatable.DataTable

import org.openqa.selenium.WebElement
import org.openqa.selenium.remote.server.handler.FindElements
import org.testng.Assert

import org.apache.poi.ss.usermodel.Cell
import org.apache.poi.ss.usermodel.Row
import org.openqa.selenium.By
import org.openqa.selenium.Keys

import com.kms.katalon.core.testdata.reader.CSVReader
import com.kms.katalon.core.testdata.reader.CSVSeparator
import com.kms.katalon.core.webui.common.WebUiCommonHelper
import com.kms.katalon.core.webui.driver.DriverFactory
import cucumber.api.java.en.Then
import cucumber.api.java.en.When



class GeneralData {
	@When("Filters should be displayed in the screen")
	def filters_should_be_displayed_in_the_screen(DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		for(int i=0; i<dTable.size(); i++) {
			Assert.assertTrue(WebUI.verifyElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/span_ParamDropDown',['param':dTable.get(i)]), GlobalVariable.MIN_WAIT), 'Filter is not displayed!')
		}
	}

	@When("I click to {string} icon on the screen")
	def i_click_to_icon_on_the_screen(String svg) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Avatar/Role Management/svg_param',['param':svg]),GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Avatar/Role Management/svg_param',['param':svg]))
	}

	@Then("Pop-up should contain fields and buttons as design")
	def pop_up_should_contain_fields_and_buttons_as_design(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		for(int i=0; i<dTable.size(); i++) {
			String name = dTable.get(i).get('Name')
			String type = dTable.get(i).get('Type')
			switch(type) {
				case 'Textbox':
					WebUI.waitForElementPresent(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':name]), GlobalVariable.MIN_WAIT)
					WebUI.verifyElementPresent(findTestObject('Object Repository/Common/Filters/input_filterOption',['param':name]), GlobalVariable.MIN_WAIT)
					break
				case 'Button':
					WebUI.waitForElementPresent(findTestObject('Object Repository/Common/button_label', ['title' : name]), GlobalVariable.MIN_WAIT)
					WebUI.verifyElementPresent(findTestObject('Object Repository/Common/button_label', ['title' : name]), GlobalVariable.MIN_WAIT)
					break
				case 'Icon':
					WebUI.waitForElementPresent(findTestObject('Object Repository/Avatar/Role Management/svg_param', ['param' : name]), GlobalVariable.MIN_WAIT)
					WebUI.verifyElementPresent(findTestObject('Object Repository/Avatar/Role Management/svg_param', ['param' : name]), GlobalVariable.MIN_WAIT)
					break
				default:
					throw new Exception('Invalid Type')
			}
		}
	}

	@Then("The table in Catalogue Profile should have at least one column contain data {string} from search box")
	def the_table_in_catalogue_profile_should_have_at_least_one_column_contain_data_from_search_box(String keyword) {
		List<Map<String, String>> UI = utils.extractDataTableWithAllPages(findTestObject('Object Repository/Common/Table/table_Table'))
		List<WebElement> headers = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Table/table_Table'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//th"))

		for(int i=0; i<UI.size(); i++) {
			int count = 0
			for(int j=0; j<headers.size(); j++) {
				String th = headers.get(j).getText()
				if(UI.get(i).get(th).contains(keyword)) {
					count++
				}
			}
			Assert.assertTrue(count > 0, 'Row in table not contain keyword in the search bar!')
		}
	}

	@When("I delete all Company Code {string} in the General Data List")
	def i_delete_all_company_code_in_the_general_data_list(String companyCode) {
		new DBConnection(GlobalVariable.DB_HOSTNAME, GlobalVariable.DB_PORT, GlobalVariable.DB_INSTANCE_NAME,
				GlobalVariable.DB_USERNAME, GlobalVariable.DB_PASSWORD)
		String query = "delete from dim_company_plant where company_code = '"+companyCode+"'"
		DBConnection.executeUpdate(query)
	}

	@Then("Company or Plant Description in Company Plant Code List should contain data {string}")
	def company_or_plant_description_in_company_plant_code_list_should_contain_data(String value) {
		List<Map<String, String>> UI = utils.extractDataTableWithText(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<UI.size(); i++) {
			String company = UI.get(i).get('Company Description').toLowerCase()
			String plant = UI.get(i).get('Plant Description').toLowerCase()
			int count = 0;
			if(company.contains(value.toLowerCase()) || plant.contains(value.toLowerCase())) {
				count++;
			}
			Assert.assertTrue(count>0, 'Company or Plant description column not contains required data')
		}
	}

	@Then("Number record of table should match {string} and column {string}")
	def number_record_of_table_should_match_and_column(String list, String column) {
		List<Map<String, String>> UI = utils.extractDataTableWithAllPages(findTestObject('Object Repository/Common/Table/table_Table'))
		List<String> global = GlobalVariable[list.split("-",2)[1]]
		Assert.assertEquals(UI.size(), global.size(), 'Two size are not equal')
		for(int i=0; i<UI.size(); i++) {
			Assert.assertEquals(UI.get(i).get(column), global.get(i), 'Data is not match')
		}
	}

	@Then("I count all selected record then check with message {string} in General Data")
	def i_count_all_selected_record_then_check_with_message_in_general_data(String message) {
		//		List<WebElement> selected = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Filters/input_Checkboxes'), GlobalVariable.MIN_WAIT).findElements(By.xpath("./parent::span[not(contains(@title,'Select all'))]"))
		List<WebElement> selected = DriverFactory.getWebDriver().findElements(By.xpath("//input[@type='checkbox']/parent::span[not(contains(@title,'Select all'))]"))
		int count = 0
		for(int i=0; i<selected.size(); i++) {
			String checked = selected.get(i).getAttribute('class')
			if(checked.contains('Mui-checked')) {
				count++
			}
		}
		String messageText = count + ' ' + message
		WebUI.verifyElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Deliberation/h6_text',['param':messageText]), GlobalVariable.MIN_WAIT)
	}

	@Then("The filter {string} is displayed as default")
	def the_filter_is_displayed_as_default(String filterName) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/span_ParamDropDown',['param':filterName]), GlobalVariable.MAX_WAIT)
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/span_ParamDropDown',['param':filterName]))
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/SPF Tracking Summary/Dropdown/form_DropDownForm'), GlobalVariable.MIN_WAIT)
		List<WebElement> allValue = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Data Focal/General Data/span_selectedFilter'), GlobalVariable.MIN_WAIT)
		for(int i=0; i>allValue.size(); i++) {
			String value = allValue.get(i).getAttribute('class')
			Assert.assertFalse(value.contains('Mui-checked'), 'The option is selected')
		}
		WebUI.click(findTestObject('Object Repository/Common/button_label', ['title' : 'Apply']))
	}

	@Then("The Breadcrumb should be displayed as {string}")
	def the_breadcrumb_should_be_displayed_as(String text) {
		List<WebElement> breadscumb = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Data Focal/General Data/li_classParam',['param':'MuiBreadcrumbs-li']), GlobalVariable.MIN_WAIT).collect({x -> x.getText()})
		String StringBreadscrumb = breadscumb.get(0)
		for(int i=1; i<breadscumb.size(); i++) {
			StringBreadscrumb = StringBreadscrumb + ' > ' + breadscumb.get(i)
		}
		Assert.assertEquals(text, StringBreadscrumb, "Two text are not equals")
	}

	@When("I select first {int} record options in the list")
	def i_select_first_record_options_in_the_list(int number) {
		List<WebElement> options = WebUiCommonHelper.findWebElements(findTestObject('Object Repository/Common/Filters/input_Checkboxes'), GlobalVariable.MIN_WAIT)
		options.remove(0)
		for(int i=0; i<number; i++) {
			options.get(i).click()
		}
	}

	@Then("Filled data should be displayed in the screen")
	def filled_data_should_be_displayed_in_the_screen(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		for(int i=0; i<dTable.size(); i++) {
			String data = dTable.get(i).get('Data')
			String fieldName = dTable.get(i).get('Field Name')
			WebUI.verifyElementPresent(findTestObject('Object Repository/Data Focal/General Data/input_fieldsInAddNew',['value':data, 'fieldName':fieldName]), GlobalVariable.MIN_WAIT)
		}
	}

	@When("I delete all data in the {string} file")
	def i_delete_all_data_in_the_file(String fileName) {
		String dirName = System.getProperty('user.dir') + "/Data/Data Download/" + fileName
		def workbook = ExcelKeyword.getWorkbook(dirName)
		def sheet = workbook.getSheetAt(0)
		for(int i=1; i<sheet.getLastRowNum(); i++) {
			Row row = sheet.getRow(i);
			ExcelKeyword.deleteRow(sheet, row);
		}
		FileOutputStream out = new FileOutputStream(new File(dirName))
		workbook.write(out)
	}

	@When("I add data to new row in the excel file {string}")
	def i_add_data_to_new_row_in_the_excel_file(String fileName, DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		String dirName = System.getProperty('user.dir') + "/Data/Data Download/" + fileName
		def workbook = ExcelKeyword.getWorkbook(dirName)
		def sheet = workbook.getSheetAt(0)
		int rowNum = sheet.getLastRowNum()
		Row row = sheet.createRow(rowNum)
		Assert.assertEquals(dTable.size(), sheet.getRow(0).getLastCellNum(), 'List size does not match with column numbers')
		Cell cell;
		for(int i=0; i<sheet.getRow(0).getLastCellNum(); i++) {
			cell = row.createCell(i)
			cell.setCellValue(dTable.get(i))
		}
		FileOutputStream out = new FileOutputStream(new File(dirName))
		workbook.write(out)
	}

	@When("I update {int} row of the excel file {string} with value from column {int}")
	def i_update_row_of_the_excel_file_with_value_from_column(int position, String fileName, int start, DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		String dirName = System.getProperty('user.dir') + "/Data/Data Download/" + fileName
		def workbook = ExcelKeyword.getWorkbook(dirName)
		def sheet = workbook.getSheetAt(0)
		Assert.assertEquals(dTable.size(), sheet.getRow(0).getLastCellNum(), 'List size does not match with column numbers')
		Cell cell
		for(int i=start; i<sheet.getRow(0).getLastCellNum(); i++) {
			cell = sheet.getRow(position).getCell(i)
			if(cell != null) {
				cell.setCellValue(dTable.get(i))
			}else {
				cell = sheet.createRow(position).createCell(i)
				cell.setCellValue(dTable.get(i))
			}
		}
	}

	@Then("Toggle {string} should be displayed")
	def toggle_display(String label) {
		WebUI.waitForElementVisible(findTestObject('Object Repository/Data Focal/General Data/Equipment Sensitivity To Content/div_toggle',['label':label]), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementVisible(findTestObject('Object Repository/Data Focal/General Data/Equipment Sensitivity To Content/div_toggle',['label':label]))
	}

	@When("I delete record with material no {string} in the Msel Assemblies page")
	def i_delete_record_with_material_no_in_the_msel_assemblies_page(String keyword) {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Common/input_Placeholder',['param':'Search by keyword']), GlobalVariable.MIN_WAIT)
		WebUI.sendKeys(findTestObject('Object Repository/Common/input_Placeholder',['param':'Search by keyword']), Keys.chord(Keys.CONTROL, 'a', Keys.BACK_SPACE))
		WebUI.sendKeys(findTestObject('Object Repository/Common/input_Placeholder',['param':'Search by keyword']), keyword)

		List<WebElement> rows = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Table/table_Table'), GlobalVariable.MAX_WAIT).findElements(By.xpath(".//tr"))
		List<String> headers = utils.getColumnHeaders(rows.get(0).findElements(By.xpath(".//th")))
		List<Map<String, WebElement>> table = new ArrayList()
		if(WebUI.waitForElementNotPresent(findTestObject('Object Repository/Common/p_statusDropdown',['param':'No data to show.']), GlobalVariable.MIN_WAIT)) {
			for(int i=1; i<rows.size(); i++) {
				Map<String, String> obj = new HashMap<String, String>();
				List<WebElement> cellEles = rows.get(i).findElements(By.xpath(".//td"))
				for(int j=0; j<headers.size(); j++) {
					obj.put(headers.get(j), cellEles.get(j))
				}
				table.add(obj)
			}
		}

		for(int i=0; i<table.size(); i++) {
			if(table.get(i).get('Material No.').getText().equals(keyword)) {
				table.get(i).get('Action').findElement(By.xpath(".//*[local-name()='svg' and @data-testid='DeleteIcon']")).click()
				WebUI.waitForElementPresent(findTestObject('Object Repository/Common/Pop-up/h3_Name', [name : 'Confirmation']), GlobalVariable.MIN_WAIT)
				WebUI.verifyElementPresent(findTestObject('Object Repository/Common/Pop-up/h3_Name', [name : 'Confirmation']), GlobalVariable.MIN_WAIT)
				WebUI.click(findTestObject('Object Repository/Common/button_label', ['title' : 'Ok']))
			}
		}

		WebUI.sendKeys(findTestObject('Object Repository/Common/input_Placeholder',['param':'Search by keyword']), Keys.chord(Keys.CONTROL, 'a', Keys.BACK_SPACE))
	}

	@Then("The color of column header should be {string}")
	def the_color_of_column_header_should_be(String text) {
		List<WebElement> list = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Table/table_Table'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//th"))
		for(int i=0; i<list.size(); i++) {
			String color = list.get(i).getCssValue('background-color')
			Assert.assertEquals(color, text, 'Color is not correct')
		}
	}

	@Then("The color of column header text should be {string}")
	def the_color_of_column_header_text_should_be(String text) {
		List<WebElement> list = WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/Table/table_Table'), GlobalVariable.MIN_WAIT).findElements(By.xpath(".//th//div/span"))
		for(int i=0; i<list.size(); i++) {
			String color = list.get(i).getCssValue('color')
			Assert.assertEquals(color, text, 'Color is not correct')
		}
	}

	@Then("Column header should have name match with header in csv")
	def column_header_should_have_name_match_with_header_in_csv() {
		String csv = System.getProperty('user.home') + "/Downloads/" + "failure_words.csv"
		File file = new File(csv)
		List<String> test = file.readLines()
	}

	@When("I get all data from database with query in data file")
	def i_get_all_data_from_database_with_query_in_data_file(DataTable dataTable) {
		List<String> paramList = dataTable.asList()
		String[] arr = new String[paramList.size()];
		for(int i=0; i<paramList.size(); i++) {
			String text = paramList.get(i)
			if(text.contains('Global')) {
				text = GlobalVariable[text.split("-",2)[1]]
			}
			arr[i] = text
		}
		List<Map<String, String>> DBdata = utils.getDataFromDatabase(arr)
		utils.addGlobalVariable('LIST_MAP_FROM_DB', DBdata)
	}

	@Then("Sensitive to content column in Equipment Sensitive page should contain toggle button")
	def sensitive_to_content_column_in_equipment_sensitive_page_should_contain_toggle_button() {
		List<Map<String, WebElement>> UI = utils.extractDataTableWithWebElements(findTestObject('Object Repository/Common/Table/table_Table'))
		for(int i=0; i<UI.size(); i++) {
			Assert.assertTrue(UI.get(i).get('Sensitive To Content').findElement(By.xpath(".//button[@value='Yes']")).isDisplayed(), 'Button yes not display')
			Assert.assertTrue(UI.get(i).get('Sensitive To Content').findElement(By.xpath(".//button[@value='No']")).isDisplayed(), 'Button no not display')
		}
	}

	@Then("File {string} in {string} should have header match with expected")
	def file_in_should_have_header_match_with_expected(String fileName, String dir, DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		String dirName = System.getProperty('user.dir') + dir + fileName
		CSVReader csv = new CSVReader(dirName, CSVSeparator.COMMA, true)
		List<String> columns = csv.columnNames
		for(int i=0; i<dTable.size(); i++) {
			Assert.assertEquals(dTable.get(i), columns.get(i), 'Header not correct with '+dTable.get(i)+ ' and '+columns.get(i))
		}
	}

	@When("I replace all data in csv file {string} with new data in directory {string}")
	def i_replace_all_data_in_csv_file_with_new_data_in_directory(String csvFile, String dir, DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		String dirName = System.getProperty('user.dir') + dir + csvFile
		File file = new File(dirName)
		//get csv file
		CSVReader test = new CSVReader(dirName, CSVSeparator.COMMA, true)
		//get column names by index 0
		List<String> column = test.getColumnNames()
		String[] array = new String[column.size()]
		column.toArray(array)
		List<Object[]> input = new ArrayList<>()
		for(int i=0; i<dTable.size(); i++) {
			String[] temp= dTable.get(i).split(";")
			Assert.assertEquals(column.size(), temp.length, 'Headers and data are not same size')
			input.add(temp)
		}
		customKW.writeToCsv(file, array, input)
	}

	@When("I add new data row into csv file {string} in directory {string}")
	def i_add_new_data_row_into_csv_file_in_directory(String fileName, String directory, DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		String dirName = System.getProperty('user.dir') + fileName + directory
		File file = new File(dirName)
		//get csv file
		CSVReader test = new CSVReader(dirName, CSVSeparator.COMMA, true)
		//get column names by index 0
		List<String> column = test.getColumnNames()
		String[] array = new String[column.size()]
		column.toArray(array)
		List<Object[]> input = new ArrayList<>()
		//get all data from csv file
		List<List<String>> allData = test.getData()
		for(List<String> a : allData) {
			String[] array1 = new String[a.size()]
			a.toArray(array1)
			input.add(array1)
		}
		for(int i=0; i<dTable.size(); i++) {
			String[] temp= dTable.get(i).split(";")
			Assert.assertEquals(column.size(), temp.length, 'Headers and data are not same size')
			input.add(temp)
		}
		customKW.writeToCsv(file, array, input)
	}
}