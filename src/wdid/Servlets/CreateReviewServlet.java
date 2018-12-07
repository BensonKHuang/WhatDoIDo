package wdid.Servlets;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.ObjectifyService;
import wdid.Users.Review;
import wdid.Users.WDIDUser;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.googlecode.objectify.ObjectifyService.ofy;

public class CreateReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 3L;

    static {
        ObjectifyService.begin();
        ObjectifyService.register(Review.class);
        ObjectifyService.register(WDIDUser.class);
    }
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        WDIDUser userObj = null;
        if (user != null) {
            userObj = ofy().load().type(WDIDUser.class).id(user.getEmail()).now();
            if (userObj == null) {
                userObj = new WDIDUser(user.getEmail(), user.getNickname());
                ofy().save().entity(userObj).now();
            }
        }

        if(user != null){
            String content = req.getParameter("content");
            Review review = new Review(userObj, content);
            ofy().save().entities(review).now();
            resp.sendRedirect("/reviews.jsp");
        }
        else{
            resp.sendRedirect(userService.createLoginURL(req.getRequestURI()));
        }
    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect("/landing.jsp");
    }
}
