package common

import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint

import org.apache.poi.ss.usermodel.Cell
import org.apache.poi.ss.usermodel.DataFormatter
import org.apache.poi.ss.usermodel.Row
import org.apache.poi.ss.usermodel.Sheet
import org.jsoup.select.Evaluator.IsEmpty
import org.openqa.selenium.By
import org.openqa.selenium.ElementClickInterceptedException

import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import static com.kms.katalon.core.testobject.ObjectRepository.findWindowsObject
import com.kms.katalon.core.annotation.Keyword
import com.kms.katalon.core.checkpoint.Checkpoint
import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling
import com.kms.katalon.core.testcase.TestCase
import com.kms.katalon.core.testdata.TestData
import com.kms.katalon.core.testobject.TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.common.WebUiCommonHelper
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import com.kms.katalon.core.windows.keyword.WindowsBuiltinKeywords as Windows
import internal.GlobalVariable
import java.awt.RenderingHints.Key
import java.text.DateFormat
import java.text.DecimalFormat
import java.text.ParseException
import java.text.SimpleDateFormat
import java.util.concurrent.TimeUnit

import common.DBConnection as DBConnection

import org.openqa.selenium.Keys
import org.openqa.selenium.NoSuchElementException
import org.openqa.selenium.WebElement
import org.testng.Assert

public class utils {

	/*
	 * Keyword to manage data values
	 */
	@Keyword
	def static addGlobalVariable(String name, def value) {
		GroovyShell shell1 = new GroovyShell()
		MetaClass mc = shell1.evaluate("internal.GlobalVariable").metaClass
		String getterName = "get" + name.capitalize()
		mc.'static'."$getterName" = { -> return value }
		mc.'static'."$name" = value
	}

	@Keyword
	def static String getRandomNumber(){
		Random rnd = new Random()
		int number = rnd.nextInt(9999999)
		def random = Integer.toString(number)
		def rnd_num = '5'+random
		return rnd_num
	}

	@Keyword
	def static String randomString(int length) {
		String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		Random rand = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i=0; i<length; i++) {
			sb.append(str.charAt(rand.nextInt(str.length())));
		}
		addGlobalVariable('RANDOM_STRING', sb.toString())
		return sb.toString();
	}

	@Keyword
	public static List<String> getTextElements(TestObject obj, String attribute_name = null){
		List<String> textList = new ArrayList()
		List<WebElement> elements = WebUiCommonHelper.findWebElements(obj, GlobalVariable.MAX_WAIT)
		elements.each {
			if (attribute_name == null) {
				textList.add(it.getText().trim())
			}else {
				textList.add(it.getAttribute(attribute_name).trim())
			}
		}
		return textList
	}

	@Keyword
	public static verifyLists (List<String> expectedList, List<String> actualList){
		Assert.assertEquals(actualList.size(), expectedList.size(), 'Number of two lists are not equal')
		for(int i; i < expectedList.size(); i++) {
			Assert.assertEquals(actualList[i], expectedList[i], 'Item is not correct at index '+i)
		}
	}

	@Keyword
	public static String scrollAndClick(TestObject testObject) {
		try{
			WebUI.scrollToElement(testObject, 10)
			WebUI.sendKeys(findTestObject('Object Repository/Page_PTW Coolwork/Page_Create PTW/html'), Keys.chord(Keys.ARROW_UP))
			WebUI.sendKeys(findTestObject('Object Repository/Page_PTW Coolwork/Page_Create PTW/html'), Keys.chord(Keys.ARROW_UP))
			WebUI.click(testObject)
		} catch(Exception e) {
			WebUI.scrollToElement(testObject, 10)
			WebUI.sendKeys(findTestObject('Object Repository/Page_PTW Coolwork/Page_Create PTW/html'), Keys.chord(Keys.ARROW_DOWN))
			WebUI.sendKeys(findTestObject('Object Repository/Page_PTW Coolwork/Page_Create PTW/html'), Keys.chord(Keys.ARROW_DOWN))
			WebUI.sendKeys(findTestObject('Object Repository/Page_PTW Coolwork/Page_Create PTW/html'), Keys.chord(Keys.ARROW_DOWN))
			WebUI.sendKeys(findTestObject('Object Repository/Page_PTW Coolwork/Page_Create PTW/html'), Keys.chord(Keys.ARROW_DOWN))
			WebUI.click(testObject)
		} catch(Exception e) {
			WebUI.scrollToElement(testObject, 10)
			WebUI.sendKeys(findTestObject('Object Repository/Page_PTW Coolwork/Page_Create PTW/html'), Keys.chord(Keys.ARROW_UP))
			WebUI.sendKeys(findTestObject('Object Repository/Page_PTW Coolwork/Page_Create PTW/html'), Keys.chord(Keys.ARROW_UP))
			WebUI.sendKeys(findTestObject('Object Repository/Page_PTW Coolwork/Page_Create PTW/html'), Keys.chord(Keys.ARROW_UP))
			WebUI.sendKeys(findTestObject('Object Repository/Page_PTW Coolwork/Page_Create PTW/html'), Keys.chord(Keys.ARROW_UP))
			WebUI.click(testObject)
		}
	}

	@Keyword
	public static String getCurrentDateTime(String defaultFormat = 'dd MMM yyyy hh:mm a') {
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat(defaultFormat);
		String strDate = formatter.format(date);
		return strDate
	}

	@Keyword
	def static getDateFromString(String string, String format){
		try {
			SimpleDateFormat form = new SimpleDateFormat(format)
			Date date = form.parse(string)
			return date;
		} catch (Exception e) {
			e.printStackTrace()
		}
	}


	/*
	 * Keyword to manage files
	 */

	@Keyword
	public static boolean isFileDownloaded(String downloadPath, String fileName) {
		File dir = new File(downloadPath);
		File[] dirContents = dir.listFiles();
		println dirContents
		String lastAttempt = '';
		if (dirContents.length > 0) {

			for (int i = 0; i < dirContents.length; i++) {

				if (dirContents[i].getName().contains(fileName)) {
					// File has been found, it can now be deleted:
					//					dirContents[i].delete();
					return true;

				}
				lastAttempt = dirContents[i].getName().contains(fileName);
			}
			if (lastAttempt != fileName) {
				return false;
			}
		}
		return false;
	}


	/* 
	 * Keyword to handle data table 
	 */

	@Keyword
	public static List<String> getColumnHeaders(List<WebElement> list) {
		List<String> headers  = new ArrayList<String>()
		for(l in list) {
			headers.add(l.getText().trim())
		}
		return headers
	}

	@Keyword
	public static int getIndexOfColumn(TestObject thead, String columnName) {
		List<String> elmText = getTextElements(thead)
		String col = columnName.trim()
		return elmText.indexOf(col)
	}

	@Keyword
	public static TestObject getACellInTable(TestObject tbody, int rowNum, int colNum) {
		List<WebElement> rows = WebUiCommonHelper.findWebElement(tbody, GlobalVariable.MIN_WAIT).findElements(By.xpath("./tr"))
		WebElement row = rows.get(rowNum)
		List<WebElement> cells = row.findElements(By.xpath("./td"))
		TestObject cell = WebUI.convertWebElementToTestObject(cells.get(colNum))
		return cell
	}

	@Keyword
	public static List<TestObject> getListCellsOfAColumn(TestObject tbody, int colNum){
		List<WebElement> rows = WebUiCommonHelper.findWebElement(tbody, GlobalVariable.MIN_WAIT).findElements(By.xpath("./tr"))
		List<TestObject> cellList = new ArrayList()
		for(WebElement row :rows) {
			List<WebElement> cells = row.findElements(By.xpath("./td"))
			TestObject cell = WebUI.convertWebElementToTestObject(cells.get(colNum))
			cellList.add(cell)
		}
		return cellList
	}

	@Keyword
	public static List<WebElement> getListCellsElmOfAColumn(TestObject tbody, int colNum){
		List<WebElement> rows = WebUiCommonHelper.findWebElement(tbody, GlobalVariable.MIN_WAIT).findElements(By.xpath("./tr"))
		List<WebElement> cellList = new ArrayList()
		for(WebElement row :rows) {
			List<WebElement> cells = row.findElements(By.xpath("./td"))
			WebElement cell = cells.get(colNum)
			cellList.add(cell)
		}
		return cellList
	}


	@Keyword
	public static List<TestObject> getListCellsOfARow(TestObject tbody, int rowNum){
		List<WebElement> rows = WebUiCommonHelper.findWebElement(tbody, GlobalVariable.MIN_WAIT).findElements(By.xpath("./tr"))
		List<WebElement> cells = rows.getAt(rowNum).findElements(By.xpath("./td"))
		List<TestObject> cellList = new ArrayList()
		for(WebElement c : cells) {
			TestObject cell = WebUI.convertWebElementToTestObject(c)
			cellList.add(cell)
		}
		return cellList
	}


	@Keyword
	public static List<String> getTextOfCellListInTable(List<TestObject> cells){
		List<String> cellTxt = new ArrayList<>()
		for(TestObject cell :cells) {
			String txt = WebUI.getText(cell)
			cellTxt.add(txt)
		}
		return cellTxt
	}

	@Keyword
	public static boolean isSortedByASCList(List<String> lst) {
		if(lst.size() == 0 || lst.size() == 1) {
			return true
		}

		Iterator<String> ite = lst.iterator()
		String pre, current = ite.next()
		while (ite.hasNext()) {
			current = ite.next()
			if(pre.compareTo(current) > 0) {
				return false
			}
			pre = current
		}
		return true
	}

	@Keyword
	public static List<Map<String, String>> extractDataTableWithText(TestObject tableObject){
		List<WebElement> rows = WebUiCommonHelper.findWebElement(tableObject, GlobalVariable.MAX_WAIT).findElements(By.xpath(".//tr"))
		List<String> headers = this.getColumnHeaders(rows.get(0).findElements(By.xpath(".//th")))

		List<Map<String, String>> table = new ArrayList()
		for(int i=1; i<rows.size(); i++) {
			Map<String, String> obj = new HashMap<String, String>();
			List<WebElement> cellEles = rows.get(i).findElements(By.xpath(".//td"))
			for(int j=0; j<headers.size(); j++) {
				obj.put(headers.get(j), cellEles.get(j).getText().trim().replace("\n", " "))
			}
			table.add(obj)
		}
		return table
	}

	@Keyword
	public static List<Map<String, String>> extractDataTableWithSelectedData(TestObject tableObject){
		List<WebElement> rows = WebUiCommonHelper.findWebElement(tableObject, GlobalVariable.MAX_WAIT).findElements(By.xpath(".//tr"))
		List<String> headers = this.getColumnHeaders(rows.get(0).findElements(By.xpath(".//th")))

		List<Map<String, String>> table = new ArrayList()
		for(int i=1; i<rows.size(); i++) {
			Map<String, String> obj = new HashMap<String, String>();
			List<WebElement> cellEles = rows.get(i).findElements(By.xpath(".//td"))
			if(cellEles.get(0).findElement(By.xpath(".//input/parent::span")).getAttribute('class').contains('Mui-checked')) {
				for(int j=0; j<headers.size(); j++) {
					obj.put(headers.get(j), cellEles.get(j).getText().trim().replace("\n", " "))
				}
				table.add(obj)
			}
		}
		return table
	}

	@Keyword
	public static List<Map<String, WebElement>> extractDataTableWithWebElements(TestObject tableObject){
		List<WebElement> rows = WebUiCommonHelper.findWebElement(tableObject, GlobalVariable.MAX_WAIT).findElements(By.xpath(".//tr"))
		List<String> headers = this.getColumnHeaders(rows.get(0).findElements(By.xpath(".//th")))

		List<Map<String, String>> table = new ArrayList()
		for(int i=1; i<rows.size(); i++) {
			Map<String, String> obj = new HashMap<String, String>();
			List<WebElement> cellEles = rows.get(i).findElements(By.xpath(".//td"))
			for(int j=0; j<headers.size(); j++) {
				obj.put(headers.get(j), cellEles.get(j))
			}
			table.add(obj)
		}
		return table
	}

	@Keyword
	public static List<Map<String, WebElement>> extractDataTableWithoutSyntax(TestObject tableObject){
		List<WebElement> rows = WebUiCommonHelper.findWebElement(tableObject, GlobalVariable.MAX_WAIT).findElements(By.xpath(".//tr"))
		List<String> headers = this.getColumnHeaders(rows.get(0).findElements(By.xpath(".//th")))
		List<Map<String, String>> table = new ArrayList()
		for(int i=1; i<rows.size(); i++) {
			Map<String, String> obj = new HashMap<String, String>();
			List<WebElement> cellEles = rows.get(i).findElements(By.xpath(".//td"))
			if(cellEles.size()==0) {
				continue
			}
			for(int j=0; j<headers.size(); j++) {
				obj.put(headers.get(j).replace("*", "").replace("\n", " ").trim(), cellEles.get(j))
			}
			table.add(obj)
		}
		return table
	}

	@Keyword
	public static List<Map<String, WebElement>> extractDataTableWithTheadAndTbody(TestObject tableObject){
		List<WebElement> rows = WebUiCommonHelper.findWebElement(tableObject, GlobalVariable.MAX_WAIT).findElements(By.xpath(".//tr"))
		List<String> headers = this.getColumnHeaders(rows.get(0).findElements(By.xpath(".//th")))
		List<Map<String, String>> table = new ArrayList()
		for(int i=1; i<rows.size(); i++) {
			Map<String, String> obj = new HashMap<String, String>();
			List<WebElement> cellEles = rows.get(i).findElements(By.xpath(".//td"))
			if(cellEles.size()==0) {
				continue
			}
			for(int j=0; j<headers.size(); j++) {
				obj.put(headers.get(j).replace("*", "").replace("\n", " ").trim(), cellEles.get(j))
			}
			table.add(obj)
		}
		return table
	}

	@Keyword
	public static List<Map<String, String>> extractDataTableWithAllPages(TestObject tableObject){
		List<Map<String, String>> table = new ArrayList()
		boolean check = true
		while(check){
			List<WebElement> rows = WebUiCommonHelper.findWebElement(tableObject, GlobalVariable.MAX_WAIT).findElements(By.xpath(".//tr"))
			List<String> headers = this.getColumnHeaders(rows.get(0).findElements(By.xpath(".//th")))
			for(int i=1; i<rows.size(); i++) {
				Map<String, String> obj = new HashMap<String, String>();
				List<WebElement> cellEles = rows.get(i).findElements(By.xpath(".//td"))
				for(int j=0; j<headers.size(); j++) {
					obj.put(headers.get(j).replace("*", "").replace("\n", " ").trim(), cellEles.get(j).getText().trim())
				}
				table.add(obj)
			}
			if(WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/button_ariaLabel',['param':'Go to next page']), GlobalVariable.MIN_WAIT).isEnabled()) {
				WebUI.click(findTestObject('Object Repository/Common/button_ariaLabel',['param':'Go to next page']))
			}else {
				check = false
			}
		}
		return table
	}

	@Keyword
	public static List<Map<String, String>> extractDataTableWithAllPagesInPopup(TestObject tableObject){
		List<Map<String, String>> table = new ArrayList()
		boolean check = true
		while(check){
			List<WebElement> rows = WebUiCommonHelper.findWebElement(tableObject, GlobalVariable.MAX_WAIT).findElements(By.xpath(".//tr"))
			List<String> headers = this.getColumnHeaders(rows.get(0).findElements(By.xpath(".//th")))
			for(int i=1; i<rows.size(); i++) {
				Map<String, String> obj = new HashMap<String, String>();
				List<WebElement> cellEles = rows.get(i).findElements(By.xpath(".//td"))
				for(int j=0; j<headers.size(); j++) {
					obj.put(headers.get(j).replace("*", "").replace("\n", " ").trim(), cellEles.get(j).getText().trim())
				}
				table.add(obj)
			}
			if(WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/button_AriaLabel',['param':'Go to next page']), GlobalVariable.MIN_WAIT).isEnabled()) {
				WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/button_AriaLabel',['param':'Go to next page']))
			}else {
				check = false
			}
		}
		return table
	}

	@Keyword
	public static List<Map<String, String>> extractDataTableWithPages(int pages, TestObject tableObject){
		List<Map<String, String>> table = new ArrayList()
		for(int count=0; count<pages; count++) {
			List<WebElement> rows = WebUiCommonHelper.findWebElement(tableObject, GlobalVariable.MAX_WAIT).findElements(By.xpath(".//tr"))
			List<String> headers = this.getColumnHeaders(rows.get(0).findElements(By.xpath(".//th")))
			for(int i=1; i<rows.size(); i++) {
				Map<String, String> obj = new HashMap<String, String>();
				List<WebElement> cellEles = rows.get(i).findElements(By.xpath(".//td"))
				if(cellEles.size()==0) {
					continue
				}
				for(int j=0; j<headers.size(); j++) {
					obj.put(headers.get(j).replace("*", "").replace("\n", " ").trim(), cellEles.get(j).getText().trim())
				}
				table.add(obj)
			}
			if(WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/button_ariaLabel',['param':'Go to next page']), GlobalVariable.MIN_WAIT).isEnabled()) {
				WebUI.click(findTestObject('Object Repository/Common/button_ariaLabel',['param':'Go to next page']))
			}else {
				break
			}
		}
		return table
	}

	@Keyword
	public static List<Map<String, WebElement>> extractDataTableWithPagesWebElement(int pages, TestObject tableObject){
		List<Map<String, String>> table = new ArrayList()
		for(int count=0; count<pages; count++) {
			List<WebElement> rows = WebUiCommonHelper.findWebElement(tableObject, GlobalVariable.MAX_WAIT).findElements(By.xpath(".//tr"))
			List<String> headers = this.getColumnHeaders(rows.get(0).findElements(By.xpath(".//th")))
			for(int i=1; i<rows.size(); i++) {
				Map<String, String> obj = new HashMap<String, String>();
				List<WebElement> cellEles = rows.get(i).findElements(By.xpath(".//td"))
				if(cellEles.size()==0) {
					continue
				}
				for(int j=0; j<headers.size(); j++) {
					obj.put(headers.get(j).replace("*", "").replace("\n", " ").trim(), cellEles.get(j))
				}
				table.add(obj)
			}
			if(WebUiCommonHelper.findWebElement(findTestObject('Object Repository/Common/button_ariaLabel',['param':'Go to next page']), GlobalVariable.MIN_WAIT).isEnabled()) {
				WebUI.click(findTestObject('Object Repository/Common/button_ariaLabel',['param':'Go to next page']))
			}else {
				break
			}
		}
		return table
	}

	@Keyword
	public static String convertDateTimeFormat(String before, String after, String datetime) {
		DateFormat original = new SimpleDateFormat(before);
		DateFormat target = new SimpleDateFormat(after);
		String formattedDate = ""
		try{
			Date date = original.parse(datetime);
			formattedDate = target.format(date);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return formattedDate
	}

	@Keyword
	public static List<HashMap<String, String>> getDataFromDatabase(String...params) {
		int i = 1
		TestData testdata = findTestData(GlobalVariable.dataFilePath)
		int rowIndex = GlobalVariable.iterationNum.toInteger()
		def query = testdata.getValue('query', rowIndex)
		for (param in params) {
			query = query.replace("param" + i, param)
			i++
		}
		//Connect DB and get data from database
		new DBConnection(GlobalVariable.DB_HOSTNAME, GlobalVariable.DB_PORT, GlobalVariable.DB_INSTANCE_NAME,
				GlobalVariable.DB_USERNAME, GlobalVariable.DB_PASSWORD)
		List<HashMap<String, String>> listQueryRecords = DBConnection.executeQuery(query.toString())
		return listQueryRecords
		DBConnection.connection.close()
	}

	@Keyword
	public static List<HashMap<String, String>> getDataFromDatabaseWithNumber(int num, String...params) {
		int i = 1
		TestData testdata = findTestData(GlobalVariable.dataFilePath)
		int rowIndex = GlobalVariable.iterationNum.toInteger()
		def query = testdata.getValue('query', rowIndex)
		for (param in params) {
			query = query.replace("param" + i, param)
			i++
		}
		//Connect DB and get data from database
		new DBConnection(GlobalVariable.DB_HOSTNAME, GlobalVariable.DB_PORT, GlobalVariable.DB_INSTANCE_NAME,
				GlobalVariable.DB_USERNAME, GlobalVariable.DB_PASSWORD)
		List<HashMap<String, String>> listQueryRecords = DBConnection.executeQueryWithRows(query.toString(), num)
		return listQueryRecords
		DBConnection.connection.close()
	}

	@Keyword
	public static boolean isElementPresented(WebElement ele) {
		boolean checked;
		try {
			if(ele.isDisplayed()) {
				checked = true
			}
		}catch(NoSuchElementException e) {
			checked = false
		}
		return checked;
	}

	@Keyword
	public static int dayPastOrFuture(String day1, String day2, String format) {
		int checked;
		SimpleDateFormat sdformat = new SimpleDateFormat(format);
		Date d1 = sdformat.parse(day1);
		Date d2 = sdformat.parse(day2);
		if(d1.compareTo(d2) > 0) {
			checked = 1;
		}else if(d1.compareTo(d2) < 0){
			checked = -1;
		}else {
			checked = 0;
		}
		return checked;
	}

	@Keyword
	public static int getDaysBetweenTwoDates(String day1, String day2, String format) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(format)
		Date date1 = dateFormat.parse(day1)
		Date date2 = dateFormat.parse(day2)
		int getDiff = date1.getTime() - date2.getTime()
		int getDaysDiff = TimeUnit.MILLISECONDS.toDays(getDiff)
		return Math.abs(getDaysDiff);
	}

	@Keyword
	public static List<Map<String, String>> extractExcelFile(String dir, String sheetName){
		def workbook = ExcelKeyword.getWorkbook(dir)
		def sheet = workbook.getSheet(sheetName)
		List<String> headers = new ArrayList()
		for(int a=0; a<sheet.getRow(0).getLastCellNum(); a++) {
			headers.add(a, sheet.getRow(0).getCell(a).toString())
		}
		List<Map<String, String>> table = new ArrayList()
		for(int i=1; i<sheet.getLastRowNum()+1; i++) {
			Map<String, String> obj = new HashMap<String, String>();
			for(int j=0; j<headers.size(); j++) {
				obj.put(headers.get(j), sheet.getRow(i).getCell(j).toString())
			}
			table.add(obj)
		}
		return table
	}

	@Keyword
	public static List<Map<String, String>> extractExcelFileWithIndex(String dir, int index){
		def workbook = ExcelKeyword.getWorkbook(dir)
		def sheet = workbook.getSheetAt(index)
		List<String> headers = new ArrayList()
		for(int a=0; a<sheet.getRow(0).getLastCellNum(); a++) {
			headers.add(a, sheet.getRow(0).getCell(a).toString())
		}
		List<Map<String, String>> table = new ArrayList()
		for(int i=1; i<sheet.getLastRowNum()+1; i++) {
			Map<String, String> obj = new HashMap<String, String>();
			for(int j=0; j<headers.size(); j++) {
				obj.put(headers.get(j), sheet.getRow(i).getCell(j).toString())
			}
			table.add(obj)
		}
		return table
	}

	@Keyword
	public static boolean isValid(String date, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format)
		sdf.setLenient(false);
		try {
			sdf.parse(date)
		}catch(ParseException e) {
			return false
		}
		return true
	}
}
