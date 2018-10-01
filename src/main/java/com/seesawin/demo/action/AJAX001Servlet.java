package com.seesawin.demo.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet(value = "/a1", name = "ajax001")
public class AJAX001Servlet extends BaseHttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String body = getBody(request);
		System.out.println("body : " + body);

		GsonBuilder gb = new GsonBuilder().serializeNulls();
		Gson gson = gb.create();

		// json to Map
		Map<String, Object> json = gson.fromJson(body, Map.class);
		String keyword = (String) json.get("keyword");
		String other = (String) json.get("other");
		System.out.println("keyword : " + keyword);
		System.out.println("other : " + other);
		
	}
}
