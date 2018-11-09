package wdid.Servlets;

import wdid.Factory.MovieFactory;
import wdid.Factory.RecommendationFactory;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieServlet extends HttpServlet {

	private static final long serialVersionUID = 2L;

	private static RecommendationFactory factory;
	static {
		factory = new MovieFactory();
	}
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Really Cool Movie");
		resp.getWriter().println("53.3,-14.3");
		resp.getWriter().println("A really cool movie. Some actiony stuff happens.");
	}
}
