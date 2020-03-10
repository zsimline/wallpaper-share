package com.handle;

import javax.sql.*;

import java.util.Date;

import javax.servlet.*;

import javax.naming.*;

import javax.servlet.annotation.WebListener;

@WebListener 
public class AppListener implements ServletContextListener,ServletContextAttributeListener{
   private ServletContext context = null;

   public void contextInitialized(ServletContextEvent sce){

    Context ctx = null;
    DataSource dataSource = null;
    context = sce.getServletContext();
    try{
         if(ctx == null)
            ctx = new InitialContext();
        dataSource = (DataSource)ctx.lookup("java:comp/env/jdbc/sampleDS");
      }catch(NamingException ne){
    	  context.log("Exception:" + ne);
      }
      context.setAttribute("dataSource",dataSource);
      context.log("应用程序已启动："+new Date());
   }

   public void contextDestroyed(ServletContextEvent sce){
       context = sce.getServletContext();
       context.removeAttribute("dataSource");
       context.log("应用程序已关闭："+new Date());
   }

   public void attributeAdded(ServletContextAttributeEvent sce){
         context = sce.getServletContext();
         context.log("添加一个属性："+sce.getName()+"："+sce.getValue());
   }

   public void attributeRemoved(ServletContextAttributeEvent sce){
         context = sce.getServletContext();
         context.log("删除一个属性："+sce.getName()+"："+sce.getValue());
   }

   public void attributeReplaced(ServletContextAttributeEvent sce){
         context = sce.getServletContext();
         context.log("替换一个属性："+sce.getName()+"："+sce.getValue());
   }
}