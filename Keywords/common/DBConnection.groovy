package common

import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
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
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import com.kms.katalon.core.windows.keyword.WindowsBuiltinKeywords as Windows

import internal.GlobalVariable
import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import static com.kms.katalon.core.testobject.ObjectRepository.findWindowsObject
import java.sql.Connection
import java.sql.DriverManager
import java.sql.ResultSet
import java.sql.ResultSetMetaData
import java.sql.Statement
import org.junit.After
import org.testng.Assert
import com.kms.katalon.core.annotation.Keyword
import com.kms.katalon.core.checkpoint.Checkpoint
import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling
import com.kms.katalon.core.testcase.TestCase
import com.kms.katalon.core.testdata.TestData
import com.kms.katalon.core.testobject.TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import com.kms.katalon.core.windows.keyword.WindowsBuiltinKeywords as Windows
import com.kms.katalon.util.CryptoUtil
import internal.GlobalVariable

public class DBConnection {
	private static Connection connection = null

	DBConnection(String serverName, int portNumber, String instanceName, String userName, String encryptedPassword) {
		//		def password = (CryptoUtil.decode(CryptoUtil.getDefault(encryptedPassword)))
		if (connection == null) {
			try {
				Class.forName("org.postgresql.Driver")
				String url = "jdbc:postgresql://" + serverName + ":" + portNumber + "/" + instanceName + "?sslmode=allow"
				println(url)
				if(connection != null && !connection.isClosed()){
					connection.close()
				}
				println(userName+" and "+encryptedPassword)
				connection = DriverManager.getConnection(url, userName, encryptedPassword)
			} catch (Exception e) {
				throw e
			}
		}
	}

	public static List<LinkedHashMap<String, String>> executeQuery(String queryString) {
		println 'Querying to db with command "' + queryString + '"'
		Statement statement = this.connection.createStatement()
		ResultSet result
		try {
			result = statement.executeQuery(queryString)
		} catch (Exception e) {
			throw e
		}
		ResultSetMetaData metaData = result.getMetaData()
		int numberOfColumns = metaData.getColumnCount()

		List<LinkedHashMap<String, String>> listOfQueryRecords = new ArrayList<LinkedHashMap<String, String>>()

		while (result.next()) {
			LinkedHashMap<String, String> map = new LinkedHashMap<String, String>()

			for (int i = 1; i <= numberOfColumns; i++) {
				String cellValue = result.getString(i) != null ? result.getString(i) : ""
				map.put(metaData.getColumnName(i), cellValue)
			}
			listOfQueryRecords.add(map)

		}
		result.close()
		statement.close()

		return listOfQueryRecords
	}

	public static List<LinkedHashMap<String, String>> executeQueryWithRows(String queryString, int num) {
		println 'Querying to db with command "' + queryString + '"'
		Statement statement = this.connection.createStatement()
		ResultSet result
		try {
			result = statement.executeQuery(queryString)
		} catch (Exception e) {
			throw e
		}
		ResultSetMetaData metaData = result.getMetaData()
		int numberOfColumns = metaData.getColumnCount()

		List<LinkedHashMap<String, String>> listOfQueryRecords = new ArrayList<LinkedHashMap<String, String>>()

		int count = 0
		while (result.next()) {
			if(count < num) {
				LinkedHashMap<String, String> map = new LinkedHashMap<String, String>()

				for (int i = 1; i <= numberOfColumns; i++) {
					String cellValue = result.getString(i) != null ? result.getString(i) : ""
					map.put(metaData.getColumnName(i), cellValue)
				}
				listOfQueryRecords.add(map)
				count++
			}else {
				break
			}

		}
		result.close()
		statement.close()

		return listOfQueryRecords
	}

	public static HashMap<String, String> executeQueryToGetTypeColumn(String queryString) {
		println 'Querying to db with command "' + queryString + '"'
		Statement statement = this.connection.createStatement()
		ResultSet result = statement.executeQuery(queryString)
		ResultSetMetaData metaData = result.getMetaData()
		int numberOfColumns = metaData.getColumnCount()

		HashMap<String, String> MapColumnTypeOfQueryRecords = new HashMap<String, String>()

		while (result.next()) {
			for (int i = 1; i <= numberOfColumns; i++) {
				MapColumnTypeOfQueryRecords.put(metaData.getColumnName(i), metaData.getColumnClassName(i).split("\\.")[metaData.getColumnClassName(i).split("\\.").length-1].toUpperCase())
			}
			break
		}

		result.close()
		statement.close()

		return MapColumnTypeOfQueryRecords
	}

	public static execute(String executeString) {
		println 'Send a statement to db with command "' + executeString + '"'
		Statement statement = this.connection.createStatement()
		String a = statement.execute(executeString)
		println (a)
		statement.close()
	}

	private closeConnection() {
		println "Closing database connection"
		if (connection != null && !connection.isClosed()) {
			connection.close()
		}
		connection = null
	}

	public static List<HashMap<String, String>> executeUpdate(String queryString) {
		println 'Update to db with command "' + queryString + '"'
		Statement state = this.connection.createStatement();
		int x = state.executeUpdate(queryString)
		println x
		state.close();
	}
}
