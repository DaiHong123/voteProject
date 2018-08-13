package DH.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import DH.entity.User;

@Mapper
public interface UserDao {

    /**
     * 通过userName查询数据表中是否有该条数据
     * @param userName
     * @return 返回User对象
     */
    User selectName(@Param("userName") String userName);

    /**
     * 通过userName查询数据表中返回该条数据中的密码
     * @param userName
     * @return 返回String类型
     */
    String selectPassword(@Param("userName") String userName);


    /**
     * 注册信息
     * @param user
     * @return 添加成功返回true，否则返回false
     */
    Boolean register(@Param("pojo") User user);
}

