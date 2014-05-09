package com.lims.tools;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Random;

import com.lims.bean.KechengBiao;
import com.lims.dao.CurseDao;

public class PaikeMethod {
	DateUtil dateutil = new DateUtil();
	/*
	 * 
	 * 1，不排星期六星期天，按周次排
	 */
	public void paikeByWeeknoWeekend(KechengBiao kecheng){
		//所有的课程
		String kechengTotal = kecheng.getExperiment_name();
		//把String字符串转换成数组
		String kechengShuzu[] = kechengTotal.split(",");
		ArrayList<String> curseList = new ArrayList<String>();
		//第一步，将所有的课程放入到ArrayList中
		for(int i=0;i<kechengShuzu.length;i++){
			curseList.add(kechengShuzu[i]);
		}
		//第二步，得到课程安排的时间
		String dateStart = kecheng.getStarDate();
		
		String dateEnd = kecheng.getEndDate();
		//System.out.println(dateStart+"--------"+dateEnd);
		Calendar staDate =dateutil.stringToCarlendar(dateStart);
		Calendar endDate =dateutil.stringToCarlendar(dateEnd);
		//得到相距多少天
		int count = dateutil.betweenDays(staDate, endDate);
		//System.out.println("count==="+count);
		//得到起始的时间是星期几
		String startWeekDay = dateutil.getWeekday(dateStart);
		//System.out.println("startWeekDay"+startWeekDay);
		//得到结束的时间是星期几
		String endWeekDay = dateutil.getWeekday(dateEnd);
		//System.out.println("endWeekDay"+endWeekDay);
		//星期几的int型
		int start = dateutil.changeWeekDay(startWeekDay);
		
		//System.out.println("start=="+start);
		int end = dateutil.changeWeekDay(endWeekDay);
		//System.out.println("end==="+end);
		//得到经历的周数
		int weekcount = dateutil.getWeek(start, end, count);
		System.out.println("weekcount===="+weekcount);
		//每天安排的课数
		ArrayList meitianList = new ArrayList();
		if(count!=0){
			meitianList = dateutil.shiyangeshu(start, end, count, curseList.size());
		}else{
			meitianList.add(curseList.size());
		}
		ArrayList weekofCourse = new ArrayList();
		//得到每周的实验数
		weekofCourse = dateutil.getWeekExpCount(start, end, meitianList, weekcount);
		KechengBiao kb = new KechengBiao();
		System.out.println(weekofCourse);
		if(weekofCourse.size()==1){
			HashSet<Integer> set = new HashSet<Integer>();
			RandomGen randomGen = new RandomGen((Integer)weekofCourse.get(0));
			set = randomGen.genRadoms((start-1)*6, end*6, (Integer)weekofCourse.get(0));
			PaikeService pk = new PaikeService();
			ArrayList<KechengBiao> resultlist = new ArrayList<KechengBiao>();
			resultlist=pk.paike(set, curseList);
			for(int i=0;i<resultlist.size();i++){
				resultlist.get(i).setLabroomName(kecheng.getLabroomName());
				resultlist.get(i).setStarDate(dateStart);
				resultlist.get(i).setEndDate(dateEnd);
				resultlist.get(i).setWeekpage(1);
				resultlist.get(i).setKechengbiao_name(kecheng.getKechengbiao_name());
			}
			set.clear();
			CurseDao curseDao = new CurseDao();
			curseDao.setKechengbiao(resultlist);
		}else if(weekofCourse.size()==2){
			HashSet<Integer> set = new HashSet<Integer>();
			RandomGen randomGen = new RandomGen((Integer)weekofCourse.get(0));
			set = randomGen.genRadoms((start-1)*6, 30, (Integer)weekofCourse.get(0));
			PaikeService pk = new PaikeService();
			ArrayList<KechengBiao> totalresultlist = new ArrayList<KechengBiao>();
			ArrayList<KechengBiao> resultlist = new ArrayList<KechengBiao>();
			resultlist=pk.paike(set, curseList);
			for(int i=0;i<resultlist.size();i++){
				resultlist.get(i).setWeekpage(1);
				totalresultlist.add(resultlist.get(i));
			}
			set.clear();
			HashSet<Integer> set1 = new HashSet<Integer>();
			RandomGen randomGen1 = new RandomGen((Integer)weekofCourse.get(1));
			set1 = randomGen1.genRadoms(0, end*6, (Integer)weekofCourse.get(1));
			ArrayList<KechengBiao> resultlist1 = new ArrayList<KechengBiao>();
			resultlist1=pk.paike(set, curseList);
			for(int i=0;i<resultlist1.size();i++){
				resultlist1.get(i).setWeekpage(2);
				//System.out.println(resultlist1.get(i).getExperiment_name());
				totalresultlist.add(resultlist1.get(i));
			}
			set1.clear();
			//for(int i=0;i<totalresultlist.size();i++){
				//System.out.println(totalresultlist.get(i).getExperiment_name()+"+++"+totalresultlist.get(i).getWeekpage());
			//}
			//System.out.println(totalresultlist.toString());
			for(int i=0;i<totalresultlist.size();i++){
				totalresultlist.get(i).setLabroomName(kecheng.getLabroomName());
				totalresultlist.get(i).setStarDate(dateStart);
				totalresultlist.get(i).setEndDate(dateEnd);
				totalresultlist.get(i).setKechengbiao_name(kecheng.getKechengbiao_name());
			}
			CurseDao curseDao = new CurseDao();
			curseDao.setKechengbiao(totalresultlist);
		}else{
			HashSet<Integer> set = new HashSet<Integer>();
			RandomGen randomGen = new RandomGen((Integer)weekofCourse.get(0));
			set = randomGen.genRadoms((start-1)*6, 30, (Integer)weekofCourse.get(0));
			ArrayList<KechengBiao> totalresultlist = new ArrayList<KechengBiao>();
			ArrayList<KechengBiao> resultlist = new ArrayList<KechengBiao>();
			PaikeService pk = new PaikeService();
			resultlist=pk.paike(set, curseList);
			for(int i=0;i<resultlist.size();i++){
				resultlist.get(i).setWeekpage(1);
				totalresultlist.add(resultlist.get(i));
			}
			set.clear();
			for(int i=2;i<weekcount;i++){
				HashSet<Integer> set1 = new HashSet<Integer>();
				RandomGen randomGen1 = new RandomGen((Integer)weekofCourse.get(1));
				set1 = randomGen1.genRadoms(0, 30, (Integer)weekofCourse.get(1));
				ArrayList<KechengBiao> resultlist1 = new ArrayList<KechengBiao>();
				resultlist1=pk.paike(set, curseList);
				for(int j=0;j<resultlist1.size();j++){
					resultlist1.get(j).setWeekpage(i);
					totalresultlist.add(resultlist1.get(j));
				}
				set1.clear();
			}
			HashSet<Integer> set2 = new HashSet<Integer>();
			RandomGen randomGen2 = new RandomGen((Integer)weekofCourse.get(2));
			set2 = randomGen2.genRadoms(0, end*6, (Integer)weekofCourse.get(2));
			ArrayList<KechengBiao> resultlist2 = new ArrayList<KechengBiao>();
			resultlist2=pk.paike(set, curseList);
			for(int i=0;i<resultlist2.size();i++){
				resultlist2.get(i).setWeekpage(weekcount);
				totalresultlist.add(resultlist2.get(i));
			}
			set2.clear();
		//	for(int i=0;i<totalresultlist.size();i++){
			//	System.out.println(totalresultlist.get(i).getExperiment_name()+"+++"+totalresultlist.get(i).getWeekpage());
			//}
			for(int i=0;i<totalresultlist.size();i++){
				totalresultlist.get(i).setLabroomName(kecheng.getLabroomName());
				
				totalresultlist.get(i).setStarDate(dateStart);
				totalresultlist.get(i).setEndDate(dateEnd);
				totalresultlist.get(i).setKechengbiao_name(kecheng.getKechengbiao_name());
			}
			CurseDao curseDao = new CurseDao();
			curseDao.setKechengbiao(totalresultlist);
		}
		

	//2，不拍星期六星期天，按日期排
	//3，排星期六星期天，按周次排
	//4，排星期六星期天，按日期排
		
		
	}
}
