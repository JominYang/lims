package com.lims.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;

import java.util.Random;
import javax.imageio.ImageIO;

/**
* <img src="<%=request.getContextPath()%>/image.jsp" width="50" height="20"/>
* web.xml 添加
   <servlet>
        <servlet-name>CodeGenServlet</servlet-name>
        <servlet-class>util.CodeGenServlet</servlet-class>
</servlet>
<servlet-mapping>
   <servlet-name>CodeGenServlet</servlet-name>
    <url-pattern>/image.jsp</url-pattern>
</servlet-mapping>
* 获取验证码(String)session.getAttribute(CodeGenServlet.THECODE)
* @author jivam
*
*/
public class CodeServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
private static final String CONTENT_TYPE = "text/html; charset=GBK";
public static final String THECODE = "GEN_CODE";
    //Initialize global variables
    public void init() throws ServletException {
    }
    //Process the HTTP Get request
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        // 首先设置页面不缓存
                response.setHeader("Pragma", "No-cache");
                response.setHeader("Cache-Control", "no-cache");
                response.setDateHeader("Expires", 0);
                // 定义图片的宽度和高度
                int width = 90, height = 40;
                // 创建一个图像对象
                BufferedImage image = new BufferedImage(width, height,
                                BufferedImage.TYPE_INT_RGB);
                // 得到图像的环境对象
                Graphics g = image.createGraphics();
                Random random = new Random();
                // 用随机颜色填充图像背景
                g.setColor(getRandColor(180, 250));
                g.fillRect(0, 0, width, height);
                for (int i = 0; i < 5; i++) {
                        g.setColor(getRandColor(50, 100));
                        int x = random.nextInt(width);
                        int y = random.nextInt(height);
                        g.drawOval(x, y, 4, 4);
                }
                // 设置字体，下面准备画随机数
                g.setFont(new Font("", Font.PLAIN, 40));
                // 随机数字符串
                String sRand = "";
                for (int i = 0; i < 4; i++) {
                        // 生成四个数字字符
                        String rand = String.valueOf(random.nextInt(10));
                        sRand += rand;
                        // 生成随机颜色
                        g.setColor(new Color(20 + random.nextInt(80), 20 + random
                                        .nextInt(100), 20 + random.nextInt(90)));
                        // 将随机数字画在图像上
                        g.drawString(rand, (17 + random.nextInt(3)) * i + 8, 34);
                        // 生成干扰线
                        for (int k = 0; k < 12; k++) {
                                int x = random.nextInt(width);
                                int y = random.nextInt(height);
                                int xl = random.nextInt(9);
                                int yl = random.nextInt(9);
                                g.drawLine(x, y, x + xl, y + yl);
                        }
                }
                // 将生成的随机数字字符串写入Session
                request.getSession().setAttribute(THECODE, sRand);
                // 使图像生效
                g.dispose();
                // 输出图像到页面
                ImageIO.write(image, "JPEG", response.getOutputStream());
    }
    public Color getRandColor(int fc, int bc) {
        Random rand = new Random();
        if (fc > 255) {
            fc = 255;
        }
        if (bc > 255) {
            bc = 255;
        }
        int r = fc + rand.nextInt(bc - fc);
        int g = fc + rand.nextInt(bc - fc);
        int b = fc + rand.nextInt(bc - fc);
        return new Color(r, g, b);
    }
    //Process the HTTP Post request
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }
    //Clean up resources
    public void destroy() {
    }
}
