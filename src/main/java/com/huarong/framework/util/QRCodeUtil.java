package com.huarong.framework.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

public class QRCodeUtil {

    private static int WIDTH = 200;
    private static int HEIGHT = 200;

    private static BufferedImage getBufferedImage(BitMatrix matrix, String logoPath, boolean remote) {
        int width = matrix.getWidth();
        int height = matrix.getHeight();
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        for (int i = 0; i < width; i++) {
            for (int j = 0; j < height; j++) {
                image.setRGB(i, j, matrix.get(i, j) ? Color.BLACK.getRGB() : Color.WHITE.getRGB());
            }
        }
        try {
            if (logoPath != null) {
                BufferedImage logo = null;
                if (remote) {
                    logo = ImageIO.read(new URL(logoPath));
                } else {
                	File logoFile=new File(logoPath);
                    logo = ImageIO.read(logoFile);
                }
                int widthLogo = logo.getWidth(), 
                    heightLogo = logo.getHeight(); 
                Graphics2D paint = image.createGraphics();
                paint.drawImage(logo, (image.getWidth() - logo.getWidth()) / 2, (image.getHeight() - logo.getHeight()) / 2, widthLogo, heightLogo, null);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return image;
    }

    /**
     * 
     * @param text
     *            二维码内容
     * @param os
     *            二维码输出流
     * @param width
     *            二维码宽度
     * @param height
     *            二维码高度
     * @param logoPath
     *            logo路径
     * @param remote
     *            是否是在线logo
     */
    public static void generate2Stream(String text, OutputStream os, int width, int height, String logoPath, boolean remote) {
        try {
            if (width == 0) {
                width = WIDTH;
            }
            if (height == 0) {
                height = HEIGHT;
            }
            Map<EncodeHintType, Object> map = new HashMap<EncodeHintType, Object>();
            map.put(EncodeHintType.CHARACTER_SET, "utf-8");
            map.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
            map.put(EncodeHintType.MARGIN, 0);
            BitMatrix matrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, width, height, map);
            BufferedImage bufferedImage = getBufferedImage(matrix, logoPath, remote);
            ImageIO.write(bufferedImage, "png", os);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 
     * @param text
     *            二维码内容
     * @param filePath
     *            二维码生成的文件路径
     * @param width
     *            二维码宽度
     * @param height
     *            二维码高度
     * @param logoPath
     *            logo路径
     * @param remote
     *            是否是在线logo
     */
    public static void write2File(String text, String filePath, int width, int height, String logoPath, boolean remote) {
        if (width == 0) {
            width = WIDTH;
        }
        if (height == 0) {
            height = HEIGHT;
        }
        try {
            File target = new File(filePath);
            if (target.exists()) {
                target.delete();
            }
            target.createNewFile();
            generate2Stream(text, new FileOutputStream(target), width, height, logoPath, remote);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private final static String logoFile="ewm.png";
    public static String getQrCodeFile(String userid,String url,HttpServletRequest request)
    {
    	String urlLink="";
    	String imgFileName = "qr_"+userid+".png";
        String webPath = request.getSession().getServletContext().getRealPath("/"); 
        String logoFilePath = webPath+logoFile;
	   	String imgPath = webPath+"/static/imgtmp"; 
	   	File imgFilePath = new File(imgPath);
   	    if(!imgFilePath.exists()){
   		  imgFilePath.mkdirs();
   	    }
   	    urlLink= "/static/imgtmp/" + imgFileName;
	   	String filePath= webPath + urlLink;
	 	write2File(url, filePath, 220, 220, logoFilePath, false);     
    	return urlLink;
    }
    public static void main(String[] args) {
        String filePath = "F:\\qr1File.png";
        write2File("https://www.weipaidai.com", filePath, 300, 300, "F:\\ewm.png", false);
    }
}
