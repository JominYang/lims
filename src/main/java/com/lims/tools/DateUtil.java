package com.lims.tools;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DateUtil {
	//讲String转换为carlendate
	public Calendar stringToCarlendar(String str){
		DateFormat df = new SimpleDateFormat("yy-MM-dd");
		Date date = null;
		try {
			date = df.parse(str);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar ca = Calendar.getInstance();
		ca.setTime(date);
		return ca;
	}
	//求出当前星期几是几月几号
	public String getCurentDate(String start,int week,int xingqi){
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar ca = stringToCarlendar(start);
		int day = ca.get(Calendar.DAY_OF_YEAR);
		//得到起始日期是星期几
		String startdate = getWeekday(start);
		//将星期几换成INT型
		int startday = changeWeekDay(startdate);
		int length = (week-1)*7+xingqi-startday;
		ca.set(Calendar.DAY_OF_YEAR,day+length);
		Date cc = ca.getTime();
		String resultdate = df.format(cc);
		return resultdate;
	}
	//将String换成Date类型
	public Date StringtoDate(String str){
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date =null;
		try {
			date = df.parse(str);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}
	
	//判断某天是星期几
	 public  String getWeekday(String date){
	        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");    
	        SimpleDateFormat sdw = new SimpleDateFormat("E");    
	        Date d = null;    
	        try {    
	            d = sd.parse(date);    
	        } catch (ParseException e) {    
	            e.printStackTrace();    
	        }  
	        return sdw.format(d);  
	     }  
	//判断两个时间相聚多少天
	public int betweenDays(Calendar beginDate, Calendar endDate) {
        if (beginDate.get(Calendar.YEAR) == endDate.get(Calendar.YEAR)) {
            return endDate.get(Calendar.DAY_OF_YEAR)
                    - beginDate.get(Calendar.DAY_OF_YEAR);
        } else {
            if (beginDate.getTimeInMillis() < endDate.getTimeInMillis()) {
                int days = beginDate.getActualMaximum(Calendar.DAY_OF_YEAR)
                        - beginDate.get(Calendar.DAY_OF_YEAR)
                        + endDate.get(Calendar.DAY_OF_YEAR);
                for (int i = beginDate.get(Calendar.YEAR) + 1; i < endDate
                        .get(Calendar.YEAR); i++) {
                    Calendar c = Calendar.getInstance();
                    c.set(Calendar.YEAR, i);
                    days += c.getActualMaximum(Calendar.DAY_OF_YEAR);
                }
                return days;
            } else {
                int days = endDate.getActualMaximum(Calendar.DAY_OF_YEAR)
                        - endDate.get(Calendar.DAY_OF_YEAR)
                        + beginDate.get(Calendar.DAY_OF_YEAR);
                for (int i = endDate.get(Calendar.YEAR) + 1; i < beginDate
                        .get(Calendar.YEAR); i++) {
                    Calendar c = Calendar.getInstance();
                    c.set(Calendar.YEAR, i);
                    days += c.getActualMaximum(Calendar.DAY_OF_YEAR);
                }
                return days;
            }
        }
    }
	//讲星期数转换成数字
	public int changeWeekDay(String weekDay){
		int i=0;
		String sunday="星期天";
		String xingqiliu="星期六";
		String friday="星期五";
		String forday="星期四";
		String staturday="星期三";
		String tuesday="星期二";
		String monday="星期一";
		if(weekDay.equals(sunday)){
			i= 7;
		}
		if(weekDay.equals(monday)){
			System.out.println("herere?????");
			i= 1;
		}
		if(weekDay.equals(tuesday)){
			i= 2;
		}
		if(weekDay.equals(staturday)){
			i= 3;
		}
		if(weekDay.equals(forday)){
			i= 4;
		}
		if(weekDay.equals(friday)){
			i= 5;
		}
		if(weekDay.equals(xingqiliu)){
			i= 6;
		}
		System.out.println("i====="+i);
		return i;
	}
	//将数字转换成星期
		public String changeWeekDay(int weekDay){
			String i=null;
			int sunday=7;
			int xingqiliu=6;
			int friday=5;
			int forday=4;
			int staturday=3;
			int tuesday=2;
			int monday=1;
			if(weekDay==sunday){
				i= "星期天";
			}
			if(weekDay==monday){
				System.out.println("herere?????");
				i= "星期一";
			}
			if(weekDay==tuesday){
				i= "星期二";
			}
			if(weekDay==staturday){
				i= "星期三";
			}
			if(weekDay==forday){
				i= "星期四";
			}
			if(weekDay==friday){
				i= "星期五";
			}
			if(weekDay==xingqiliu){
				i= "星期六";
			}
			System.out.println("i====="+i);
			return i;
		}
	//得到起始日期和截止日期的周数
	//得到每天课程个数分配的方法
	public ArrayList shiyangeshu(int start,int end,int daycount,int shiyancount){	
		int a = shiyancount/daycount;
		int b = shiyancount%daycount;
		
		ArrayList alist = new ArrayList();
		for(int i=0;i<b;i++){
			alist.add(a+1);
		}
		for(int j=b;j<daycount;j++){
			alist.add(a);
		}
		
		for(int l=0;l<daycount;l++){
			
			System.out.println(alist.get(l));
		}
		return alist;
	}
	public int getdayCountHasWeekend(int start,int end,int weekcount){
		return 6-start+end+(weekcount*5);
	}
	//得到每周排课节数的方法
	public ArrayList getWeekExpCount(int start,int end,ArrayList list,int weekcount){
		ArrayList weeklist = new ArrayList();
		if(weekcount>=3){
			int firstWeek=0;
			int lastWeek=0;
			int total=0;
			int innerWeek=0;
			for(int a=0;a<6-start;a++){
				firstWeek += (Integer)list.get(a);
			}
			List tlist = new ArrayList();
			tlist =	list.subList(list.size()-end, list.size());
			for(int i=0;i<tlist.size();i++){
				lastWeek+=(Integer)tlist.get(i);
			}
			for(int i=0;i<list.size();i++){
				total+=(Integer)list.get(i);
			}
			innerWeek = total-lastWeek-firstWeek;
			weeklist.add(firstWeek);
			weeklist.add(innerWeek);
			weeklist.add(lastWeek);	
		}
		if(weekcount==2){
			int firstWeek=0;
			int lastWeek=0;
			int total=0;
			for(int a=0;a<6-start;a++){
				firstWeek += (Integer)list.get(a);
			}
			
			for(int i=0;i<list.size();i++){
				total+=(Integer)list.get(i);
			}
			lastWeek = total-firstWeek;
			weeklist.add(firstWeek);
			weeklist.add(lastWeek);	
		}
		if(weekcount==1){
			int total=0;
			
			for(int i=0;i<list.size();i++){
				total+=(Integer)list.get(i);
			}
		
			weeklist.add(total);	
		}
		return weeklist;
	}

	//得到经历的周数
	public int getWeek(int start,int end,int count){
		int weeks=0;
		System.out.println("count===="+count);
		System.out.println("end===="+end);
		System.out.println("start===="+start);
		System.out.println((count-(7-start+end))/7+2);
		if(count==(end-start)){
			weeks = (count-(7-start+end))/7+2;
			
		}else{
			weeks = (count-(7-start+end))/7+2;
			
		}
		return weeks;
	}
	
	
}
