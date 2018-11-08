package wdid;
import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FoodServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

//		Food food = getDummyFood();
		req.getSession().setAttribute("food", "MCDs");
		resp.sendRedirect("show.jsp");
	}
	
//	private static Food getDummyFood() {
//		Location location = new Location();
//		Food food = new Food("McDonalds", location, "AMAZING FOOD", 4.9);
//		return food;
//	}
}


