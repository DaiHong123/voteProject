package DH.entity;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.OutputStream;
import java.util.Random;

public class VerifyCode {
    private int w = 70;
    private int h = 35;
    private Random r = new Random();
    private String[] fontNames = {"宋体", "华文楷体", "黑体", "微软雅黑"};
    private String codes = "0123456789abcdefghijklmnopqrstuvwxyz";
    private Color bgColor = new Color(255, 255, 255);
    private String text;

    /**
     * 随机生成颜色
     * @return Color
     */
    private Color randomColor() {
        int red = r.nextInt(150);
        int green = r.nextInt(150);
        int blue = r.nextInt(150);
        return new Color(red, green, blue);
    }

    /**
     *生成的字体，粗细，大小
     * @return
     */
    private Font randomFont() {
        int index = r.nextInt(fontNames.length);
        String fontName = fontNames[index];
        int style = r.nextInt(4);
        int size = r.nextInt(5) + 25;
        return new Font(fontName, style, size);
    }

    /**
     * 在图片中的干扰线
     * @param image
     */
    private void drawLine(BufferedImage image) {
        int num = 3;
        Graphics2D g2 = (Graphics2D) image.getGraphics();
        for (int i = 0; i < num; i++) {
            int x1 = r.nextInt(w);
            int y1 = r.nextInt(h);
            int x2 = r.nextInt(w);
            int y2 = r.nextInt(h);
            g2.setStroke(new BasicStroke(1.5F));
            g2.setColor(Color.BLUE);
            g2.drawLine(x1, y1, x2, y2);
        }
    }

    /**
     * 随机返回字符串的位置来返回字母
     * @return
     */
    private char randomChar() {
        int index = r.nextInt(codes.length());
        return codes.charAt(index);

    }

    /**
     * 生成图片
     * @return
     */
    private BufferedImage createImage() {
        BufferedImage image = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2 = (Graphics2D) image.getGraphics();
        g2.setColor(this.bgColor);
        g2.fillRect(0, 0, w, h);
        return image;
    }

    /**
     * 获取图片
     * @return
     */
    public BufferedImage getImage() {
        BufferedImage image = createImage();
        Graphics2D g2 = (Graphics2D) image.getGraphics();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 4; i++) {
            String s = randomChar() + "";
            sb.append(s);
            float x = i * 1.0F * w / 4;
            g2.setFont(randomFont());
            g2.setColor(randomColor());
            g2.drawString(s, x, h - 5);
        }
        this.text = sb.toString();
        drawLine(image);
        return image;
    }

    /**
     * 获取图片中的字母
     * @return
     */
    public String getText() {
        return text;
    }

    /**
     * 生成图片和选择返回的类型和输出位置
     * @param image
     * @param out
     * @throws Exception
     */
    public static void output(BufferedImage image, OutputStream out) throws Exception {
        ImageIO.write(image, "JPEG", out);
    }
}