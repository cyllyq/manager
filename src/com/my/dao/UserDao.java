package com.my.dao;

import com.my.pojo.User;
import com.my.service.UserService;

import java.util.List;

public interface UserDao {
    /**
     * 根据用户名和密码查询用户
     * @param uname 用户名
     * @param pwd 密码
     * @return 返回查到的用户
     */
    User checkUserLoginDao(String uname, String pwd);

    /**
     * 根据用户ID修改用户密码
     * @param newPwd
     * @param uid
     * return
     */
    int userChangePwdDao(String newPwd, int uid);

    /**
     * 获取所有的用户信息
     * @return
     */
    List<User> userShowDao();

    /**
     * 用户注册
     * @param user
     * @return
     */
    int userRegDao(User user);
}
