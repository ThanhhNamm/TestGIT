package common

import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import static com.kms.katalon.core.testobject.ObjectRepository.findWindowsObject
import org.openqa.selenium.support.Color

import org.openqa.selenium.WebElement
import org.testng.Assert

import com.kms.katalon.core.annotation.Keyword
import com.kms.katalon.core.checkpoint.Checkpoint
import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling
import com.kms.katalon.core.testcase.TestCase
import com.kms.katalon.core.testdata.TestData
import com.kms.katalon.core.testobject.SelectorMethod
import com.kms.katalon.core.testobject.TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.common.WebUiCommonHelper
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import com.kms.katalon.core.windows.keyword.WindowsBuiltinKeywords as Windows

import internal.GlobalVariable

public class interfaceKW {


	//	@Keyword
	//	def static verifyElementPresentByJS(TestObject testObject, int timeOut) {
	//		String elementXpath = testObject.getSelectorCollection().get(SelectorMethod.XPATH)
	//		long startTime = System.currentTimeSeconds()
	//		String element
	//		while (System.currentTimeSeconds() - startTime < timeOut) {
	//			element = WebUI.executeJavaScript('return document.evaluate("' + elementXpath + '", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue',
	//					null, FailureHandling.OPTIONAL)
	//			if (null != element) {
	//				break
	//			}
	//		}
	//		if(null != element) {
	//			return true
	//		} else {
	//			return false
	//			throw new Exception("Unable to find element: " +testObject)
	//		}
	//	}

	@Keyword
	def static getTextByJS(TestObject testObject, int timeOut) {
		Boolean check = verifyElementPresentByJS(testObject, timeOut)
		String element
		String elementXpath = testObject.getSelectorCollection().get(SelectorMethod.XPATH)
		if(check == true) {
			element = WebUI.executeJavaScript('return document.evaluate("' + elementXpath + '", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.innerText',
					null, FailureHandling.OPTIONAL)
			if(null != element) {
				return element
			} else {
				throw new Exception("Unable to get text element: " +testObject)
			}
		}
	}

	@Keyword
	def static verifyHexColor(TestObject objPath, String attribute, String expectedValue) {
		String rgbColor = WebUI.getCSSValue((objPath), attribute)
		String actualTextHexColor = Color.fromString(rgbColor).asHex().toUpperCase()
		Assert.assertEquals(actualTextHexColor, expectedValue, 'Color is incorrect')
	}

	@Keyword
	def static verifyAttribute(TestObject objPath, String attribute, String expectedValue) {
		String actual = WebUI.getCSSValue((objPath),attribute)
		Assert.assertTrue(actual.equals(expectedValue),"Assertion failed. Expected: "+expectedValue+ " but found: " + actual)
	}

	@Keyword
	def static clickJSOneParam(String strObj, Object param){
		WebElement element = WebUiCommonHelper.findWebElement(findTestObject(strObj, ['param':param]),30)
		WebUI.executeJavaScript('arguments[0].click()', Arrays.asList(element))
	}
}
