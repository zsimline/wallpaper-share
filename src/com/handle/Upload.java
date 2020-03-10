package com.handle;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.modobj.User;
import com.modobj.Wallpaper;

@WebServlet("/Upload.do")
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Upload() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charser=UTF-8");		
		
		if(!User.checkLogin(request)) {
			response.setStatus(501);
			return;
		}

		String wname = null;
		String wlabel = null;
		Wallpaper wallpaper = new Wallpaper();
	 	
		boolean multipart = ServletFileUpload.isMultipartContent(request);
		if(multipart) {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			try {
				List<FileItem> items = upload.parseRequest(request);
				Iterator<FileItem> iter = items.iterator();
				while(iter.hasNext()) {
					FileItem item = iter.next();
					if(item.isFormField() && item.getFieldName().equals("wname")) {
						wname = new String (item.getString().getBytes("ISO-8859-1"),"UTF-8");
						wallpaper.setWname(wname);
					}
					else if(item.isFormField() && item.getFieldName().equals("wlabel")) {
						wlabel = new String (item.getString().getBytes("ISO-8859-1"),"UTF-8");
						wallpaper.setWlabel(wlabel);
					}
					else {   // 文件上传
						String filename = item.getName();
						String ext = filename.substring(filename.indexOf(".")+1);
						long millis = System.currentTimeMillis();  // 时间戳
						
						// 定义上传文件路径
						String path = request.getSession().getServletContext().getRealPath("/") + "media/"; 
						File file = new File(path,millis + "." + ext);
						
						// 临时文件
						factory.setSizeThreshold(1024*1024*2);
						factory.setRepository(new File("uploadtemp"));
						
						// 单个文件大小不超过5M
						upload.setFileSizeMax(1024*1024*5);
						
						try {
							item.write(file);
							wallpaper.setStpath("media/" + millis + "." + ext);
							wallpaper.setAuthor(User.getIdByCookie(request));
							if(wallpaper.add()) 
								response.setStatus(200);
							else
								response.setStatus(500);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}