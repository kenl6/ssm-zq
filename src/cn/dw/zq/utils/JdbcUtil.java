package cn.dw.zq.utils;

import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

/**
 * @author Ken.Leung
 * @version 2018年8月28日 下午9:05:20
 * 
 */
public class JdbcUtil {

	private static final String url = "jdbc:mysql://localhost:3306/zq-ssm";
	private static final String user = "root";
	private static final String password = "123456";
	private static final String driver = "com.mysql.jdbc.Driver";

	// 静态块 ：确保驱动只被执行一次
	static {
		// 1、加载驱动类
		try {
			Class.forName(driver);
			System.out.println("静态块。。。。。");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// 获取jdbc数据库连接
	private static Connection getConnection() throws SQLException {
		// 2、获取连接
		Connection conn = DriverManager.getConnection(url, user, password);
		return conn;
	}

	// 释放jdbc数据库连接资源
	private static void release(Statement statement, Connection conn) throws SQLException {
		if (statement != null)
			statement.close();
		if (conn != null)
			conn.close();
	}

	// 执行sql语句（比如：新增，更新，删除）
	public static void excute(String sql) {
		Connection conn = null;
		Statement statement = null;
		try {
			conn = getConnection();
			statement = conn.createStatement();
			statement.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				release(statement, conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	// 执行查询相关的SQL语句，然后把查询结果转换为bean
	public static List excuteQuery(String sql, Class clazz) {
		Connection conn = null;
		Statement statement = null;
		ResultSet results = null;
		ResultSetMetaData metaData = null;
		int count = 0;
		List list = new ArrayList<>();
		try {
			conn = getConnection();
			statement = conn.createStatement();
			results = statement.executeQuery(sql);
			metaData = results.getMetaData();
			count = metaData.getColumnCount();
			while (results.next()) {
				Object obj = clazz.newInstance();
				Map map = new HashMap<>();
				for (int i = 1; i <= count; i++) {
					map.put(metaData.getColumnName(i), results.getString(i));
				}
				BeanUtils.populate(obj, map);
				list.add(obj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} finally {
			try {
				release(statement, conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
