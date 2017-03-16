package com.yc.zxd.web.handler;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/randImg.jpg") // 注解方式的servlet /randImg.jpg 表示匹配url
public class ImageCodeServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 在内存中创建图象
		int width = 60;
		int height = 20;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

		// 创建图象
		Graphics g = image.getGraphics();
		// 生成随机对象
		Random random = new Random();
		// 设置背景色
		g.setColor(getRandColor(200, 250));
		g.fillRect(0, 0, width, height);
		// 设置字体
		g.setFont(new Font("Tines Nev Roman", Font.PLAIN, 18));
		// 随机产生干扰线
		g.setColor(getRandColor(160, 200));
		for (int i = 0; i < 255; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
		}
		// 随机产生认证码,4位数字
		String sRand = "";

		for (int i = 0; i < 4; i++) {
			String rand = String.valueOf(random.nextInt(10));
			sRand += rand;
			// 将认证码显示到图象中
			g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
			g.drawString(rand, 13 * i + 6, 16);
		}
		request.getSession().setAttribute("rand", sRand); // 验证码字符放入session中,
															// 方便后做验证操作
		// 图像生效
		g.dispose();
		// 输出图像到页面
		ServletOutputStream out = response.getOutputStream();
		ImageIO.write(image, "JPEG", out);
		out.flush();
		out.close();
	}

	Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255) {
			fc = 255;
		}
		if (bc < 255) {
			bc = 255;
		}
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);

		return new Color(r, g, b);
	}

	// 随机生成验证码
	public String verifyCode(HttpServletRequest request) {
		String sRand = "";
		Random random = new Random();
		for (int i = 0; i < 4; i++) {
			String rand = String.valueOf(random.nextInt(10));
			sRand += rand;
		}
		request.getSession().setAttribute("rand", sRand); // 验证码字符放入session中,
		// 方便后做验证操作
		return sRand;
	}

}
