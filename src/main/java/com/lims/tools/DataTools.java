package com.lims.tools;

import java.util.ArrayList;
import java.util.List;

public class DataTools {
	public ArrayList<String> dataTools(String[] AllData) {
		List<String> thirddata = new ArrayList<String>();
	
		
		for(int i=0;i<AllData.length;i++){
			String data = AllData[i].trim();
			String secondData=null;
			secondData = data.replaceAll("\n", "");
			thirddata.add(secondData);
		}
		
		List<String> lastData = new ArrayList<String>();
		int n=39;
		int m=46;
		while(n<120){
			for(int i=n;i<m;i++){
				lastData.add(thirddata.get(i));

			}
			n+=16;m+=16;
		}
		for(int i=0;i<lastData.size();i++){
			System.out.println("mingzi ha  fasdfa======="+thirddata.get(i));
		}
		return (ArrayList<String>) lastData;
	}
}
