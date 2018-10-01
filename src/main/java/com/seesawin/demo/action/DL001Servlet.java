package com.seesawin.demo.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/dl1", name = "dL001Servlet")
public class DL001Servlet extends BaseHttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String fileName = request.getParameter("fileName");
		System.out.println("fileName : " + fileName);

		/************************************* Export to Browser ************************************/
		ServletOutputStream sos = null;
		String errMsg = "";

		try {
			byte[] b = Files.readAllBytes(getFile(fileName).toPath());

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
