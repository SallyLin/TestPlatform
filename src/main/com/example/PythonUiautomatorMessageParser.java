package main.com.example;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class PythonUiautomatorMessageParser implements MessageParser{

	@Override
	public boolean isPassTesting(List<String> message) {
		String testResult = message.get(message.size()-1);
		if(testResult.contains("OK"))
			return true;
		return false;
	}

	@Override
	public List<String> getTestingMessage(List<String> message) {
		List<String> testMessage = new ArrayList<String>();
		for(int i=0 ; i<message.size()-4 ; i++){
			String line = message.get(i);
			testMessage.add(line);
//			System.out.println(line);
		}
		return testMessage;
	}

	@Override
	public int getTotalTestCase(List<String> message) {
		String line = message.get(message.size()-3);
		String[] tokens = line.split("\\s");
		return Integer.parseInt(tokens[1]);
	}

	@Override
	public int getPassTestCaseNumber(List<String> message) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getFailTestCaseNumber(List<String> message) {
		String line = message.get(message.size()-1);
		int failNumber = Integer.parseInt(line.replaceAll("[\\D]",""));
		System.out.println(failNumber);
		return failNumber;
	}

}
