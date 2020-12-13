package com.my.dao.impl;

import com.my.dao.UserDao;
import com.my.pojo.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {
    //根据用户名和密码查询用户信息
    @Override
    public User checkUserLoginDao(String uname, String pwd) {
        //声明jdbc对象
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        //声明变量
        User u = null;
        try {
            //加载驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            //获取链接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/manager?serverTimezone=GMT%2B8", "root", "lyq930305");
            String sql = "select * from t_user where uname=? and pwd=?";
            //创建sql命令对象
            ps = conn.prepareStatement(sql);
            //给占位符赋值
            ps.setString(1, uname);
            ps.setString(2, pwd);
            //执行sql
            rs = ps.executeQuery();
            //遍历查询结果
            while (rs.next()) {
                u = new User();
                u.setUid(rs.getInt("uid"));
                u.setUname(rs.getString("uname"));
                u.setPwd(rs.getString("pwd"));
                u.setSex(rs.getString("sex"));
                u.setAge(rs.getInt("age"));
                u.setBirth(rs.getString("birth"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        return u;
    }

    //根据用户ID修改用户密码
    @Override
    public int userChangePwdDao(String newPwd, int uid) {
        //声明jdbc对象
        Connection conn = null;
        //预编译的sql语句对象
        PreparedStatement ps = null;
        //创建变量
        int index = -1;
        try {
            //加载驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/manager?serverTimezone=GMT%2B8", "root", "lyq930305");
            //创建sql命令
            String sql = "update t_user set pwd=? where uid=?";
            //创建sql命令对象
            ps = conn.prepareStatement(sql);
            //给占位符赋值
            ps.setString(1, newPwd);
            ps.setInt(2, uid);
            index = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return index;
    }

    //获取所有的用户信息
    @Override
    public List<User> userShowDao() {
        //声明jdbc对象
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        //声明变量
        List<User> lu = null;
        try {
            //加载驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/manager?serverTimezone=GMT%2B8", "root", "lyq930305");
            //创建sql命令
            String sql = "select * from t_user";
            //创建sql命令对象
            ps = conn.prepareStatement(sql);
            //执行sql
            rs = ps.executeQuery();
            //给集合赋值
            lu = new ArrayList<>();
            while (rs.next()) {
                User u = new User();
                u.setUid(rs.getInt("uid"));
                u.setUname(rs.getString("uname"));
                u.setPwd(rs.getString("pwd"));
                u.setSex(rs.getString("sex"));
                u.setAge(rs.getInt("age"));
                u.setBirth(rs.getString("birth"));
                lu.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return lu;
    }

    //用户注册
    @Override
    public int userRegDao(User user) {
        //声明jdbc对象
        Connection conn = null;
        PreparedStatement ps = null;
        //声明变量
        int index = -1;
        try {
            //加载驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/manager?serverTimezone=GMT%2B8", "root", "lyq930305");
            //创建sql命令
            String sql = "insert into t_user values(default,?,?,?,?,?)";
            //创建sql命令对象
            ps = conn.prepareStatement(sql);
            //给占位符赋值
            ps.setString(1, user.getUname());
            ps.setString(2, user.getPwd());
            ps.setString(3, user.getSex());
            ps.setInt(4, user.getAge());
            ps.setString(5, user.getBirth());
            //执行sql
            index = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return index;
    }
}
