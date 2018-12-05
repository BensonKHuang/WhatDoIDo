package wdid.Servlets;

import wdid.Factory.PlaceFactory;
import wdid.Factory.RecommendationFactory;
import wdid.Recommendations.RecommendationIterator;
import wdid.Users.WDIDUser;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet
public class PlaceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String LAT = "lat";
    private static final String LNG = "long";
    private static final String PLACE = "place";
    private static final String REC = "rec";
    private static final String MSG = "msg";


    private static RecommendationFactory factory;
    private static Map<String, String> MsgMap;

    static {
        factory = new PlaceFactory();

        MsgMap = new HashMap<>();
        MsgMap.put("restaurant", "Why don't you eat at...");
        MsgMap.put("park", "Why don't you go to...");
        MsgMap.put("night_club", "Why don't you party at...");
    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        WDIDUser user = new WDIDUser();
        RecommendationIterator res = null;

        String param = req.getParameter("param");

        if (req.getParameter(LAT) != null
                && !req.getParameter(LAT).isEmpty()
                && req.getParameter(LNG) != null
                && !req.getParameter(LNG).isEmpty()) {
            user.setLatitude(Double.parseDouble(req.getParameter(LAT)));
            user.setLongitude(Double.parseDouble(req.getParameter(LNG)));

            res = factory.getRecommendations(user, param);
        } else if (req.getParameter(PLACE) != null && !req.getParameter(PLACE).isEmpty()) {
            user.setLatitude(null);
            user.setLongitude(null);
            user.setPlace(req.getParameter(PLACE));

            res = factory.getRecommendations(user, param);
        }

        if (res != null && res.hasNext()) {
            req.setAttribute(REC, factory.getRecommendations(user, param));
        }
        req.setAttribute(MSG, MsgMap.get(param));
        resp.setContentType("text/html");
        RequestDispatcher view;
        view = req.getRequestDispatcher("/show.jsp");
        view.forward(req, resp);
    }
}
