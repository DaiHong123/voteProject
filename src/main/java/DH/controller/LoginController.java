package DH.controller;


import DH.entity.User;
import DH.entity.VerifyCode;
import DH.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("Login")
public class LoginController {

    @Autowired
    private UserService userService;

    private VerifyCode verifyCode = new VerifyCode();

    /**
     * 判断从前台上获取的空的值转换成null
     * @param binder
     */
    /*@InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }
*/

    /**
     * 登陆判断
     *
     * @param response 获取respones对象
     * @param session 获取session对象
     * @param map 设置保存到页面的值
     * @param verify 获取前台验证码
     * @param rember 设置是否可以记住密码
     * @return 返回页面的名字
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)

    public String login(@Valid User user, BindingResult bindingResult, HttpServletResponse response, HttpSession session,
                        Map<String, Object> map, String verify, String rember, HttpServletRequest request) throws Exception {
        session.removeAttribute("message");
        //判断用户名或密码是否为空
        if (bindingResult.hasErrors()) {
            if (bindingResult.getFieldErrors().size() == 3 || bindingResult.getFieldError().equals("userName")) {
                map.put("message", "用户名" + bindingResult.getFieldError().getDefaultMessage());
                return "login";
            } else if (bindingResult.getFieldErrors().size() == 2 || bindingResult.getFieldError().equals("userPassword")) {
                map.put("message", "密码" + bindingResult.getFieldError().getDefaultMessage());
                return "login";
            }
        }

        //设置cookie值来暂时保存信息
        StringBuffer message = new StringBuffer();
        String verifyText = (String) session.getAttribute("verifyText");
        Cookie userNameCookie = new Cookie("userName", user.getUserName());
        Cookie userPasswordCookie = new Cookie("userPassword", user.getUserPassword());
        userNameCookie.setMaxAge(10);
        userPasswordCookie.setMaxAge(10);
        if (verify.equals("")) {
            response.addCookie(userNameCookie);
            response.addCookie(userPasswordCookie);
            message.append("验证码不能为空");
            session.setAttribute("message", message);
            return "redirect:login";
        } else {
            //判断用户名密码是否正确
            User user1 = userService.selectLogin(user.getUserName(), user.getUserPassword(), message);
            if (user1 == null) {
                map.put("message", message);
                return "login";
            } else {
                boolean b = verifyText.equals(verify);
                if (b) {
                    session.setAttribute("user",user);
                    //是否点击保存密码来设置cookie值的时间
                    if (rember != null) {
                        userNameCookie.setMaxAge(60 * 60 * 24 * 7);
                        userPasswordCookie.setMaxAge(60 * 60 * 24 * 7);
                    } else {
/*                        session.removeAttribute("userName");
                        session.removeAttribute("userPassword");*/
                        userNameCookie.setMaxAge(0);
                        userPasswordCookie.setMaxAge(0);
                    }
                    response.addCookie(userNameCookie);
                    response.addCookie(userPasswordCookie);
                    request.getRequestDispatcher("/index.jsp").forward(request,response);
                    return null;
                } else {
                    response.addCookie(userNameCookie);
                    response.addCookie(userPasswordCookie);
                    message.append("验证码错误");
                    session.setAttribute("message", message);
                    return "redirect:login";
                }
            }
        }
    }

    /**
     * 登陆登陆的页面
     *
     * @return 返回页面名字
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpSession session, @RequestParam(value = "tag",defaultValue = "1")String tag) {
        System.out.println(tag);
        if(tag.equals("exit")){
            session.removeAttribute("user");
        }
        return "login";
    }

    /**
     * 获取验证码
     *
     * @param session 设置保存验证码的字符
     * @param response 返回到页面中
     */
    @RequestMapping("/verify")
    public void Verify(HttpSession session, HttpServletResponse response) throws Exception {
        BufferedImage image = verifyCode.getImage();
        session.setAttribute("verifyText", verifyCode.getText());
        VerifyCode.output(image, response.getOutputStream());

    }

    /**
     * 跳入注册页面
     *
     * @return 返回页面名字
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {
        return "register";
    }

    /**
     * 将前端页面信息注册到后台
     * @param user 自动分装成javaBean对象
     * @param bindingResult 获取错误结果
     * @param name 获取前台的属性
     * @param response 得到response对象
     * @param map 创建map
     * @return 页面的名字
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@Valid User user, BindingResult bindingResult, String name, HttpServletResponse response, Map<String, Object> map) throws IOException {
        if (name != null) {
            User user1 = userService.selectName(name);
            if (user1 != null) {
                response.getWriter().write("y");
            }
            return null;
        } else {
            if (bindingResult.hasErrors()) {
                map.put("message", bindingResult.getFieldError().getDefaultMessage());
                return "register";
            } else {
                userService.register(user);
                return "login";
            }
        }
    }
}
