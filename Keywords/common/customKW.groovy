package common

import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject

import java.nio.charset.StandardCharsets

import org.apache.commons.io.IOUtils
import org.openqa.selenium.WebElement
import org.supercsv.io.CsvListWriter
import org.supercsv.io.ICsvListWriter
import org.supercsv.prefs.CsvPreference
import org.testng.Assert

import com.kms.katalon.core.annotation.Keyword
import com.kms.katalon.core.model.FailureHandling
import com.kms.katalon.core.testobject.TestObject
import com.kms.katalon.core.webui.common.WebUiCommonHelper
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI

import internal.GlobalVariable

public class customKW {
	def static navigateToUrl(String username, String password, String role) {
		//		if(GlobalVariable.OPU_ENGINEER_PASSWORD.equals('') || !GlobalVariable.OPU_ENGINEER_PASSWORD.equals(role)) {
		//			WebUI.closeBrowser(FailureHandling.OPTIONAL)
		//			this.openWebsite(username, password)
		//		}
		//		else if(GlobalVariable.OPU_ENGINEER_PASSWORD.equals(role)) {
		//			try {
		//				WebUI.navigateToUrl(GlobalVariable.BASE_URL)
		//			} catch (Exception e) {
		//				WebUI.closeBrowser(FailureHandling.OPTIONAL)
		//				this.openWebsite(username, password)
		//			}
		//		}
		this.openWebsite(username, password)
	}
	def static selectNewLoginField() {
		if(WebUI.waitForElementPresent(findTestObject('Object Repository/Common/Login/div_UseAnotherAccount'), GlobalVariable.MIN_WAIT)){
			WebUI.click(findTestObject('Object Repository/Common/Login/div_UseAnotherAccount'))
		}
	}
	def static openWebsite(String username, String password) {
		WebUI.openBrowser(GlobalVariable.BASE_URL)
		WebUI.maximizeWindow()
		this.login_with_username_password(username, password)
	}
	def static login_with_username_password (String username, String password) {
		if(WebUI.waitForElementPresent(findTestObject('Object Repository/Common/button_class param',['param':'backButton']), GlobalVariable.MIN_WAIT)) {
			WebUI.click(findTestObject('Object Repository/Common/button_class param',['param':'backButton']))
		}
		selectNewLoginField()
		WebUI.waitForElementVisible(findTestObject('Object Repository/Common/Login/input_UserNameField'), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementVisible(findTestObject('Object Repository/Common/Login/input_UserNameField'))
		WebUI.setText(findTestObject('Object Repository/Common/Login/input_UserNameField'), username)
		WebUI.click(findTestObject('Object Repository/Common/Login/button_SignIn',[ param :'Next']))
		WebUI.waitForElementVisible(findTestObject('Object Repository/Common/Login/input_PasswordField'), GlobalVariable.MIN_WAIT)
		WebUI.verifyElementVisible(findTestObject('Object Repository/Common/Login/input_PasswordField'))
		WebUI.setEncryptedText(findTestObject('Object Repository/Common/Login/input_PasswordField'), password)
		WebUI.click(findTestObject('Object Repository/Common/Login/button_SignIn',[param:'Sign in']))
		//		GlobalVariable.OPU_ENGINEER_PASSWORD = role
	}

	@Keyword
	public static List<String> getTextElements(TestObject obj, String attribute_name = null){
		List<String> textList = new ArrayList()
		List<WebElement> elements = WebUiCommonHelper.findWebElements(obj, GlobalVariable.MIN_WAIT)
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
	public static writeToCsv(File file, String[] headers, List<Object[]> data) {
		ICsvListWriter csvWriter = null;
		try {
			csvWriter = new CsvListWriter(new OutputStreamWriter(new FileOutputStream(file), StandardCharsets.UTF_8), CsvPreference.STANDARD_PREFERENCE);
			csvWriter.writeHeader(headers);
			for (Object[] arr : data) {
				csvWriter.write(Arrays.asList(arr));
			}
		} finally {
			IOUtils.closeQuietly(csvWriter);
		}
	}
}
