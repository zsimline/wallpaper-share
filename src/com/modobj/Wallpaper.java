package com.modobj;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.database.Database;

public class Wallpaper {
	private int wid;
	private String wname;
	private String wlabel;
	private String author;
	private String stpath;
	
	public void WallPaper() {
	}
	
	public int getWid() {
		return wid;
	}
	
	public void setWid(int wid) {
		this.wid = wid;
	}
	
	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

	public String getWlabel() {
		return wlabel;
	}

	public void setWlabel(String wlabel) {
		this.wlabel = wlabel;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getStpath() {
		return stpath;
	}

	public void setStpath(String stpath) {
		this.stpath = stpath;
	}
	
	public boolean add() {
		String sql = "insert into wallpapers (wname,wlabel,author,stpath) values('" + 
	  				   wname + "','" + wlabel + "','"+ author + "','"+ stpath + "')"; 
		Database db = new Database();
		int result = db.executeUpdate(sql);
		if(result==1)
			return true;
		else
			return false;
	}
	
	public static boolean delete(int wid) {
		String sql = "delete from wallpapers where wid=" + wid;
		Database db = new Database();
		int result = db.executeUpdate(sql);
		if(result==1)
			return true;
		else
			return false;
	}
	
	public static boolean update(int wid,String wname,String wlabel) {
		String sql = "update wallpapers set wname ='" + wname + "',wlabel='" + wlabel + "' where wid=" + wid; 
		Database db = new Database();
		int result = db.executeUpdate(sql);
		if(result==1)
			return true;
		else
			return false;
	}
		
	public static ArrayList<Wallpaper> display(int p) {
		String sql = "select * from wallpapers limit " + p*15 + "," + (p+1)*15;
		Database db = new Database();
		ResultSet result = db.executeQuery(sql);
		ArrayList<Wallpaper> objlist = new ArrayList<Wallpaper>();
		try {
			while(result.next()) {
				Wallpaper wallpaper = new Wallpaper();
				wallpaper.setWid(Integer.parseInt(result.getString("wid")));
				wallpaper.setWname(result.getString("wname"));
				wallpaper.setStpath(result.getString("stpath"));
				objlist.add(wallpaper);
			}
		} catch(SQLException e) {
			System.out.println("Exception: display wallpaper info error");
			e.printStackTrace();
		}
		return objlist;
	}
	
	public static Wallpaper getInfoById(int wid) {
		String sql = "select * from wallpapers where wid= " + wid;
		Database db = new Database();
		ResultSet result = db.executeQuery(sql);
		Wallpaper wallpaper = null;
		try {
			if(result.next()){
				wallpaper = new Wallpaper();
				wallpaper.setWname(result.getString("wname"));
				wallpaper.setWlabel(result.getString("wlabel"));
				wallpaper.setAuthor(result.getString("author"));
				wallpaper.setStpath(result.getString("stpath"));
			}
		} catch(SQLException e) {
			System.out.println("Exception: display wallpaper info error");
			e.printStackTrace();
		}
		return wallpaper;
	}
	
	public static ArrayList<Wallpaper> displayByLabel(String wlabel, int p) {
		String sql = "select * from wallpapers where wlabel ='" + wlabel + "' limit " + p*15 + "," + (p+1)*15;
		Database db = new Database();
		ResultSet result = db.executeQuery(sql);
		ArrayList<Wallpaper> objlist = new ArrayList<Wallpaper>();
		try {
			while(result.next()) {
				Wallpaper wallpaper = new Wallpaper();
				wallpaper.setWid(Integer.parseInt(result.getString("wid")));
				wallpaper.setWname(result.getString("wname"));
				wallpaper.setStpath(result.getString("stpath"));
				objlist.add(wallpaper);
			}
		} catch(SQLException e) {
			System.out.println("Exception: display wallpaper info error");
			e.printStackTrace();
		}
		return objlist;
	}
	
	public static ArrayList<Wallpaper> displayByUser(String uid, int p) {
		String sql = "select * from wallpapers where author ='" + uid + "' limit " + p*15 + "," + (p+1)*15;
		Database db = new Database();
		ResultSet result = db.executeQuery(sql);
		ArrayList<Wallpaper> objlist = new ArrayList<Wallpaper>();
		try {
			while(result.next()) {
				Wallpaper wallpaper = new Wallpaper();
				wallpaper.setWid(Integer.parseInt(result.getString("wid")));
				wallpaper.setWname(result.getString("wname"));
				wallpaper.setStpath(result.getString("stpath"));
				wallpaper.setWlabel(result.getString("wlabel"));
				objlist.add(wallpaper);
			}
		} catch(SQLException e) {
			System.out.println("Exception: display wallpaper info error");
			e.printStackTrace();
		}
		return objlist;
	}
	
	
}