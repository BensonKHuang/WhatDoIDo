package wdid.Servlets;
import java.io.IOException;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.ObjectifyService;
import wdid.Users.WDIDUser;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.googlecode.objectify.ObjectifyService.ofy;

@WebServlet
public class UserServlet extends HttpServlet {
    static {
        ObjectifyService.begin();
        ObjectifyService.register(WDIDUser.class);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        if(user != null) {
            WDIDUser userObj = ofy().load().type(WDIDUser.class).id(user.getEmail()).now();

            /* SETTINGS */
            String gender = req.getParameter("gender");
            String age = req.getParameter("age");

            ObjectifyService.ofy().save().entity(userObj).now();
            resp.sendRedirect("/");
        } else {
            resp.sendRedirect(userService.createLoginURL(req.getRequestURI()));
        }
    }
}


