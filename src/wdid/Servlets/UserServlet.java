package wdid.Servlets;

import wdid.Factory.FoodFactory;
import wdid.Factory.RecommendationFactory;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 3L;

    private static RecommendationFactory factory;
    static {
        factory = new FoodFactory();
    }
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO: ADD OBJECTIFY HERE TO SAVE USER PREF
        resp.setContentType("text/html");
        RequestDispatcher view;
        view = req.getRequestDispatcher("/user.jsp");
        view.forward(req, resp);
    }
}


