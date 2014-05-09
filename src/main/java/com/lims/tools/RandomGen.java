package com.lims.tools;

import java.util.HashSet;
public class RandomGen {
    // 利用HashSet的特征，只能存放不同的值
    public static HashSet<Integer> set = new HashSet<Integer>();
    public int count;// 需要生成随机数的个数
    public RandomGen(int num) {
        this.count = num;
    }

    public static RandomGen init(int num) {
        return new RandomGen(num);
    }

    // 生成【begin，end】区间内num个随机数
    public  HashSet<Integer> genRadoms(int begin, int end, int num) {
        if (num > (end - begin + 1) || end < begin) {
            return null;
        }
        for (int i = 0; i < num; i++) {// 生成num个随机数
            // 调用Math.random()方法
            int temp = (int) (Math.random() * (end - begin)) + begin;
            set.add(temp);// 将不同的数存入HashSet中
        }
        int setLen = set.size();
        // 如果存入的数小于指定生成的个数，则调用递归再生成剩余个数的随机数，如此循环，直到达到指定大小
        if (setLen < count) {
            genRadoms(begin, end, count - setLen);// 递归
        }
        return set;
    }
  
}