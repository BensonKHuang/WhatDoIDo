package wdid.Servlets;

import wdid.Factory.ClubFactory;
import wdid.Factory.FoodFactory;
import wdid.Factory.RecommendationFactory;
import wdid.Recommendations.RecommendationIterator;
import wdid.Users.WDIDUser;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet
public class ClubServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;
  private static final String LAT = "lat";
  private static final String LNG = "long";
  private static final String PLACE = "place";
  private static final String REC = "rec";
  private static final String MSG = "msg";


  private static RecommendationFactory factory;

  static {
    factory = new ClubFactory();
  }

  public void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    WDIDUser user = new WDIDUser();
    RecommendationIterator res = null;

    if (req.getParameter(LAT) != null
        && !req.getParameter(LAT).isEmpty()
        && req.getParameter(LNG) != null
        && !req.getParameter(LNG).isEmpty()) {
      user.setLatitude(Double.parseDouble(req.getParameter(LAT)));
      user.setLongitude(Double.parseDouble(req.getParameter(LNG)));

      res = factory.getRecommendations(user);
    } else if (req.getParameter(PLACE) != null && !req.getParameter(PLACE).isEmpty()) {
      user.setLatitude(null);
      user.setLongitude(null);
      user.setPlace(req.getParameter(PLACE));

      res = factory.getRecommendations(user);
    }

    if (res != null && res.hasNext()) {
      req.setAttribute(REC, factory.getRecommendations(user));
    }
    req.setAttribute(MSG, "Why don't you party at...");
    resp.setContentType("text/html");
    RequestDispatcher view;
    view = req.getRequestDispatcher("/show.jsp");
    view.forward(req, resp);
  }
}
