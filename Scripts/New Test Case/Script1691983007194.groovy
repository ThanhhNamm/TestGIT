import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import static com.kms.katalon.core.testobject.ObjectRepository.findWindowsObject

import java.nio.charset.StandardCharsets
import java.text.SimpleDateFormat as SimpleDateFormat
import java.time.LocalDate as LocalDate
import java.time.LocalDateTime as LocalDateTime
import java.time.format.DateTimeFormatter as DateTimeFormatter
import java.util.concurrent.TimeUnit as TimeUnit
import com.kms.katalon.core.checkpoint.Checkpoint as Checkpoint
import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling as FailureHandling
import com.kms.katalon.core.testcase.TestCase
import com.kms.katalon.core.testdata.CSVData
import com.kms.katalon.core.testdata.TestData
import com.kms.katalon.core.testdata.reader.CSVReader
import com.kms.katalon.core.testdata.reader.CSVSeparator
import com.kms.katalon.core.testdata.reader.CsvWriter
import com.kms.katalon.core.testng.keyword.TestNGBuiltinKeywords as TestNGKW
import com.kms.katalon.core.testobject.TestObject as TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import com.kms.katalon.core.windows.keyword.WindowsBuiltinKeywords as Windows
import common.utils as utils
import internal.GlobalVariable

import org.apache.commons.io.IOUtils
import org.openqa.selenium.Keys
import org.supercsv.io.CsvBeanWriter
import org.supercsv.io.CsvListReader as Keys
import org.supercsv.io.CsvListWriter
import org.supercsv.io.ICsvListWriter
import org.supercsv.prefs.CsvPreference

String dirName = System.getProperty('user.dir') + '/Data/Data Download/msel_assemblies.csv'
File file = new File(dirName)
println 'zxczxczxc '+file.readLines()

CSVReader test = new CSVReader(dirName, CSVSeparator.COMMA, true)
println 'TEST '+test.getColumnNames()
List<List<String>> aaa = test.getData()

List<String> column = test.getColumnNames()
String[] array = new String[column.size()]
column.toArray(array)

//CsvWriter writ = new CsvWriter()
List<String[]> input = new ArrayList<>()
String[] arr1 = ['50029899', '']
//String[] arr2 = ['bbb', 'bbb']
//for(List<String> a : aaa) {
//	String[] array1 = new String[a.size()]
//	a.toArray(array1)
//	input.add(array1)
//}
input.add(arr1)
//input.add(arr2)
ICsvListWriter csvWriter = null;
try {
	csvWriter = new CsvListWriter(new OutputStreamWriter(new FileOutputStream(file), StandardCharsets.UTF_8), CsvPreference.STANDARD_PREFERENCE);
	csvWriter.writeHeader(array);
	for (Object[] arr : input) {
		csvWriter.write(Arrays.asList(arr));
	}
} finally {
	IOUtils.closeQuietly(csvWriter);
}