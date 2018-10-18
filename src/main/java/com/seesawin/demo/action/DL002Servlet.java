package com.seesawin.demo.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet(value = "/dl2", name = "dL002Servlet")
public class DL002Servlet extends BaseHttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String fileName = request.getParameter("fileName");
		System.out.println("fileName : " + fileName);

		String action = request.getParameter("action");
		System.out.println("action : " + action);
		
		HttpSession session = request.getSession();
		System.out.println("get sesstion...");
		
		if ("generate".equals(action)) {
			// for loading test
			try {
				Thread.sleep(3000);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			GsonBuilder gb = new GsonBuilder().serializeNulls();
			Gson gson = gb.create();
			try {
				byte[] b = Files.readAllBytes(getFile(fileName).toPath());
				session.setAttribute("exportDate", b);
				
				resultMap.put("ERR_CDE", "00");
				resultMap.put("ERR_MSG", "success");
			} catch (Exception e) {
				e.printStackTrace();
				resultMap.put("ERR_CDE", "01");
				resultMap.put("ERR_MSG", "fail : " + e.getMessage());
			}
			System.out.println("resp : " + gson.toJson(resultMap));
			PrintWriter out = response.getWriter();
			out.write(gson.toJson(resultMap));
		} else {
			/************************************* Export to Browser ************************************/
			ServletOutputStream sos = null;
			String errMsg = "";

			try {
				System.out.println("get file from sesstion...");
				byte[] b = (byte[]) session.getAttribute("exportDate");
				
				response.setContentType("application/vnd.ms-excel; charset=MS950");
				response.setHeader("Content-disposition", "attachment; filename=test.xlsx");

				// write the output to a file
				sos = response.getOutputStream();
				sos.write(b);
				sos.close();
			} catch (Exception e) {
				e.printStackTrace();
				errMsg = "export error!";
			} finally {
				if (sos != null) {
					sos.close();
				}
				response.flushBuffer();
			}

			System.out.println("errMsg : " + errMsg);

			if (!"".equals(errMsg)) {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				out.println("<script language=\"javascript\">");
				out.println("alert(\"" + errMsg + "\");");
				out.println("</script>");
			}
		}

	}
}
