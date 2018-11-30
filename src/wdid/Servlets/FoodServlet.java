package wdid.Servlets;

import wdid.Factory.FoodFactory;
import wdid.Factory.RecommendationFactory;
import wdid.Users.WDIDUser;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet
public class FoodServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  private static RecommendationFactory factory;

  static {
    factory = new FoodFactory();
  }

  public void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    WDIDUser user = new WDIDUser();
    if (req.getParameter("lat") != null
        && !req.getParameter("lat").isEmpty()
        && req.getParameter("long") != null
        && !req.getParameter("long").isEmpty()) {
      user.setLatitude(Float.parseFloat(req.getParameter("lat")));
      user.setLongitude(Float.parseFloat(req.getParameter("long")));
      req.setAttribute("rec", factory.getRecommendations(user));
    }

    req.setAttribute("msg", "Why don't you eat at...");
    resp.setContentType("text/html");
    RequestDispatcher view;
    view = req.getRequestDispatcher("/show.jsp");
    view.forward(req, resp);
  }
}
