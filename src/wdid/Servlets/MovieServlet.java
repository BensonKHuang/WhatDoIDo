package wdid.Servlets;

import wdid.Factory.MovieFactory;
import wdid.Factory.RecommendationFactory;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet
public class MovieServlet extends HttpServlet {
	private static final long serialVersionUID = 2L;

	private static RecommendationFactory factory;
	static {
		factory = new MovieFactory();
	}
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("rec", factory.getRecommendations(null, ""));
		req.setAttribute("msg", "Why don't you go watch...");
		resp.setContentType("text/html");
		RequestDispatcher view;
		view = req.getRequestDispatcher("/show.jsp");
		view.forward(req, resp);
	}
}
