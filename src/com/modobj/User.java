package com.modobj;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.database.Database;

public class User {
	private String uid;
	private String uname;
	private String upwd;
	
	public String getUid() {
		return uid;
	}
	
	public void setUid(String uid) {
		this.uid = uid;
	}
	
	public String getUname() {
		return uname;
	}
	
	public void setUname(String uname) {
		this.uname = uname;
	}
	
	public String getUpwd() {
		return upwd;
	}
	
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	
	public boolean addUser() {
		String sql = "insert into users values ('"+ uid + "','"+ uname + "','" + upwd + "')";
		Database db = new Database();
		int result = db.executeUpdate(sql);
		if(result==1)
			return true;
		else
			return false;
	}
	
	public static String getIdByCookie(HttpServletRequest request) {		
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies){
		    if(cookie.getName().equals("id"))
		    	return cookie.getValue();
		}
		return "";
	}
	
	public static boolean check(HttpServletRequest request,String uid,String upwd) {
		String sql = "select upwd from users where uid='" + uid + "'";
		Database db = new Database();
		ResultSet result = db.executeQuery(sql);
		try {
			result.next();
			if(result.getString("upwd").equals(upwd))
				return true;				
		}catch (SQLException e) {
			System.out.println("Exception: The database has no such user or user password error");
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean checkLogin(HttpServletRequest request) {
		String uid = null;
		String upwd = null;
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies){
		    if(cookie.getName().equals("id"))
		    	uid = cookie.getValue();
		    if(cookie.getName().equals("ident"))
		    	upwd = cookie.getValue();
		}
		if(uid!=null && upwd!=null && check(request,uid,upwd))
			return true;
		return false;		
	}
}