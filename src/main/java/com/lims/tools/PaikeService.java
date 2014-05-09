package com.lims.tools;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;

import com.lims.bean.KechengBiao;

public class PaikeService {
	public ArrayList<KechengBiao> paike(HashSet<Integer> set,ArrayList list){
		Object[] a =set.toArray();
		 ArrayList ttlist = new ArrayList();
		 for(int i=0;i<a.length;i++){
			 ttlist.add(a[i]);
		 }
		 ArrayList<KechengBiao> resultList = new ArrayList<KechengBiao>();;
		 Random r = new Random();
		 KechengBiao kb=null;
		 while(ttlist.size()!=0){
			 	kb = new KechengBiao();
				int gaijiekeIndex = r.nextInt(ttlist.size());
				//添加该节课的时间点
				int xingqiji = (Integer)ttlist.get(gaijiekeIndex)/6+1;
				kb.setXingqiji(xingqiji);
				int dijijie= (Integer)ttlist.get(gaijiekeIndex)%6+1;
				kb.setDijijie(dijijie);
				ttlist.remove(gaijiekeIndex);
				int gaijieke = r.nextInt(list.size());
				kb.setExperiment_name((String)list.get(gaijieke));
				//System.out.println("星期几：  "+xingqiji+"第几节:  "+dijijie+"什么课:   "+list.get(gaijieke));
				list.remove(gaijieke);
				resultList.add(kb);
		 }
		 return resultList;
		}
	//用于jsp是否找到当前的课程
	public KechengBiao getCurentCurse(List<KechengBiao> kb,int xinqiji,int dijijie){
		KechengBiao kecheng =null;
		for(int i=0;i<kb.size();i++){
			if(kb.get(i).getXingqiji()==(xinqiji+1)&&kb.get(i).getDijijie()==(dijijie+1)){
				kecheng  = new KechengBiao();
				kecheng.setExperiment_name(kb.get(i).getExperiment_name());
				kecheng.setTeacher_name(kb.get(i).getTeacher_name());
			}
		}
		return kecheng;
	}
}
