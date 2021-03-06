package test.main.com.example;

import static org.junit.Assert.*;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import main.com.example.MessageParser;
import main.com.example.PythonUiautomatorMessageParser;
import main.com.example.RobotframeworkMessageParser;
import main.com.example.utility.Utility;

public class PythonUiautomatorMessageParserTest {
	List<String> passMessage;
	List<String> failMessage;
	MessageParser parser;
	
	@Before
	public void setUp() throws IOException{
		final String MESSAGE_PATH = "./testdata/python_success_msg.txt";
		final String FAIL_MESSAGE_PATH = "./testdata/python_failure_msg.txt";
		File messageFile = new File(MESSAGE_PATH);
		assertTrue(messageFile.exists());
		File failMessageFile = new File(FAIL_MESSAGE_PATH);
		assertTrue(failMessageFile.exists());
		passMessage = Utility.readFile(new File(MESSAGE_PATH));
		failMessage = Utility.readFile(new File(FAIL_MESSAGE_PATH));
		parser = new PythonUiautomatorMessageParser();
	}
	
	@Test
	public void testIsPassTestingWithPassMessage(){
		assertTrue(parser.isPassTesting(passMessage));
	}
	
	@Test
	public void testIsPassTestingWithFailMessage(){
		assertTrue(parser.isPassTesting(failMessage)==false);
	}
	
	@Test
	public void testGetTestingMessageWithPassMessage(){
		List<String> message = parser.getTestingMessage(passMessage);
		for(int i=0, j=0; i<passMessage.size()-4 && j < message.size() ; i++, j++){
			if(!passMessage.get(i).equals(message.get(j)))
				assertTrue(false);
		}
		assertTrue(true);
	}
	
	@Test
	public void testGetTestingMessageWithFailMessage(){
		List<String> message = parser.getTestingMessage(failMessage);
		for(int i=0, j=0 ; i<failMessage.size()-4 && j<message.size() ; i++, j++){
			if(!failMessage.get(i).equals(message.get(j)))
				assertTrue(false);
		}
		assertTrue(true);
	}
	
	@Test
	public void testGetTotalMessageWithPassMessage(){
		int totalTestCase = parser.getTotalTestCase(passMessage);
		assertTrue(totalTestCase == 1);
	}
	
	@Test
	public void testGetTotalMessageWithFailMessage(){
		int totalTestCase = parser.getTotalTestCase(failMessage);
		assertTrue(totalTestCase == 3);
	}
	
	@Test
	public void testGetFailTestCaseNumberWithFailMessage(){
		int failTestCaseNumber = parser.getFailTestCaseNumber(failMessage);
		assertTrue(failTestCaseNumber == 2);
	}
}
