package DH.service;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

import DH.entity.User;
import DH.dao.UserDao;

@Service
public class UserService {

    @Resource
    private UserDao userDao;

    private User user;

    /**
     * 查询是否有该对象
     * @param userName
     * @param userPassword
     * @param message 获取错误信息
     * @return
     */
    public User selectLogin(String userName, String userPassword, StringBuffer message) {
        user = userDao.selectName(userName);
        if (user == null) {
            message.append("用户名错误");
            return null;
        }else {
            String pass = userDao.selectPassword(userName);
            if (pass.equals(userPassword)) {
                return user;
            } else {
                message.append("密码错误");
                return null;
            }
        }

    }

    /**
     * 注册用户
     * @param user 添加改对象
     * @return 如果添加成功返回true，否则返回false
     */
    public Boolean register(User user){
        return userDao.register(user);
    }

    /**
     * 查询是否有改对象
     * @param name 通过name查
     * @return 如果有返回改对象
     */
    public User selectName(String name){
        return userDao.selectName(name);
    }
}

