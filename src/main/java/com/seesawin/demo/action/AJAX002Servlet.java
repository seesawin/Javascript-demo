package com.seesawin.demo.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet(value = "/a2", name = "ajax002")
public class AJAX002Servlet extends BaseHttpServlet {

	private static final long serialVersionUID = 1L;

	private String[] lessons = { "Ajax", "Docker", "Java", "AWS", "GCP", "Linux", "Node.js", "Swift", "Spting Framework" };

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		System.out.println("keyword : " + keyword);

		List<String> lessonList = select(keyword);
		String jsonReturn = new Gson().toJson(lessonList);
		System.out.println("jsonReturn : " + jsonReturn);
		
		PrintWriter out = response.getWriter();
		out.write(jsonReturn);
	}

	private List<String> select(String keyword) {
		List<String> resultList = new ArrayList<String>();
		for (String s : lessons) {
			if (s.toLowerCase().contains(keyword.toLowerCase())) {
				resultList.add(s);
			}
		}
		return resultList;
	}
}
