import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject

import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths

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
import org.testng.Assert
import org.openqa.selenium.WebDriver
import org.openqa.selenium.By

import com.kms.katalon.core.mobile.keyword.internal.MobileDriverFactory
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



class StockProposalReport {
	@When("I select option on filter bar in Stock Proposal Report")
	def i_select_option_on_filter_bar_in_stock_proposal_report(DataTable dataTable) {
		List<String> dTable = dataTable.asList()
		for(int i=0; i<dTable.size(); i++) {
			WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/button_Value',['param':dTable.get(i)]), GlobalVariable.MIN_WAIT)
			WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Report/button_Value',['param':dTable.get(i)]))
		}
	}

	@Then("Data in table should be match with filter value in Stock Proposal Report")
	def data_in_table_should_be_match_with_filter_value_in_stock_proposal_report(DataTable dataTable) {
		List<Map<String, String>> dTable = dataTable.asMaps(String.class, String.class)
		for(int i=0; i<dTable.size(); i++) {
			switch(dTable.get(i).get('Tab')) {
				case 'Summary':
					WebUI.waitForElementPresent(findTestObject('Object Repository/Common/button_label',['title':'summary']), GlobalVariable.MIN_WAIT)
					WebUI.click(findTestObject('Object Repository/Common/button_label',['title':'summary']))
					break
				case 'Detail':
					WebUI.waitForElementPresent(findTestObject('Object Repository/Common/button_label',['title':'Detail']), GlobalVariable.MIN_WAIT)
					WebUI.click(findTestObject('Object Repository/Common/button_label',['title':'Detail']))
					break
				default:
					throw new Exception('Invalid input')
			}
			List<Map<String, String>> table = utils.extractDataTableWithText(findTestObject('Object Repository/Common/Table/table_Table'))
			for(int j=0; j<table.size(); j++) {
				String column = dTable.get(i).get('Column')
				String value = dTable.get(i).get('Value')
				String dataFromTable = table.get(j).get(column)
				Assert.assertEquals(value, dataFromTable, 'Two values are not matched!')
			}
		}
	}

	@When("I select all ref no in the Stock Proposal Report page")
	def i_select_all_ref_no_in_the_stock_proposal_report_page() {
		WebUI.waitForElementPresent(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/input_selectAll'), GlobalVariable.MIN_WAIT)
		WebUI.click(findTestObject('Object Repository/Initial Spare Analyzer/Stock Proposal Summary/input_selectAll'))
	}

	@Then("New file name {string} should be downloaded")
	def new_file_name_should_be_downloaded(String fileName) {
		WebUI.delay(10)
		if(fileName.equals('SPF Endorsement Report')) {
			String dirName = System.getProperty('user.home') + "/Downloads/"
			String now = new Date().format('ddMMyyyy')
			utils.addGlobalVariable('DOWNLOAD_PATH', dirName)
			Assert.assertTrue(utils.isFileDownloaded(dirName, fileName+'_'+now+'.xlsx'), 'File is not downloaded!')
			File file = new File(dirName+fileName+'_'+now+'.xlsx')
			file.delete()
			Assert.assertFalse(file.exists(), 'File still exist!')
		}else if(fileName.equals('Stock Proposal Savings Report')) {
			String dirName = System.getProperty('user.home') + "/Downloads/"
			String now = new Date().format('ddMMyyyy')
			utils.addGlobalVariable('DOWNLOAD_PATH', dirName)
			Assert.assertTrue(utils.isFileDownloaded(dirName, fileName+'_'+now+'.xlsx'), 'File is not downloaded!')
			File file = new File(dirName+fileName+'_'+now+'.xlsx')
			boolean download = false
			while(download == false) {
				WebUI.delay(5)
				if(utils.isFileDownloaded(dirName, fileName) == true) {
					download = true
				}
			}
			Assert.assertTrue(utils.isFileDownloaded(dirName, fileName), 'File is not downloaded!')
			Files.move(Paths.get(dirName+fileName+'_'+now+'.xlsx'), Paths.get(System.getProperty('user.dir') + "/Data/Data Download/"+fileName+'_'+now+'.xlsx'))
		}else if(fileName.equals('MMW User Management')) {
			String dirName = System.getProperty('user.home') + "/Downloads/"
			String now = new Date().format('ddMMyy')
			utils.addGlobalVariable('DOWNLOAD_PATH', dirName)
			Assert.assertTrue(utils.isFileDownloaded(dirName, fileName+'-'+now+'.xlsx'), 'File is not downloaded!')
			File file = new File(dirName+fileName+'-'+now+'.xlsx')
			boolean download = false
			while(download == false) {
				WebUI.delay(5)
				if(utils.isFileDownloaded(dirName, fileName) == true) {
					download = true
				}
			}
			Assert.assertTrue(utils.isFileDownloaded(dirName, fileName), 'File is not downloaded!')
			Files.move(Paths.get(dirName+fileName+'-'+now+'.xlsx'), Paths.get(System.getProperty('user.dir') + "/Data/Data Download/"+fileName+'-'+now+'.xlsx'))
		}else if(fileName.contains('Global')) {
			fileName = GlobalVariable[fileName.split("-",2)[1]]
			String dirName = System.getProperty('user.home') + "/Downloads/"
			File file = new File(dirName+fileName)
			boolean download = false
			while(download == false) {
				WebUI.delay(5)
				if(utils.isFileDownloaded(dirName, fileName) == true) {
					download = true
				}
			}
			Assert.assertTrue(utils.isFileDownloaded(dirName, fileName), 'File is not downloaded!')
			file.delete()
			Assert.assertFalse(file.exists(), 'File still exist!')
		}else if(fileName.contains('No Delete')) {
			fileName = fileName.split("-",2)[1]
			String dirName = System.getProperty('user.home') + "/Downloads/"
			File file = new File(dirName+fileName)
			boolean download = false
			while(download == false) {
				WebUI.delay(5)
				if(utils.isFileDownloaded(dirName, fileName) == true) {
					download = true
				}
			}
			Assert.assertTrue(utils.isFileDownloaded(dirName, fileName), 'File is not downloaded!')
			Files.move(Paths.get(dirName + fileName), Paths.get(System.getProperty('user.dir') + "/Data/Data Download/"+fileName))
		}else {
			String dirName = System.getProperty('user.home') + "/Downloads/"
			File file = new File(dirName+fileName)
			boolean download = false
			while(download == false) {
				WebUI.delay(5)
				if(utils.isFileDownloaded(dirName, fileName) == true) {
					download = true
				}
			}
			Assert.assertTrue(utils.isFileDownloaded(dirName, fileName), 'File is not downloaded!')
			file.delete()
			Assert.assertFalse(file.exists(), 'File still exist!')
		}
	}
}