package wdid;
import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Really Cool Movie");
		resp.getWriter().println("53.3,-14.3");
		resp.getWriter().println("A really cool movie. Some actiony stuff happens.");
	}
}
