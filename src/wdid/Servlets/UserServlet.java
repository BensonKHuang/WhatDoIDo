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
            int gender = req.getParameter("gender") != null ? Integer.valueOf(req.getParameter("gender")) : 0;
            int age = req.getParameter("age") != null ? Integer.valueOf(req.getParameter("age")) : 18;

            userObj.gender = gender;
            userObj.age    = age;

            for(int i = 0; i < userObj.diet.length; i++)
                userObj.diet[i] = !(req.getParameter("d" + Integer.toString(i)) == null);
            for(int i = 0; i < userObj.movie.length; i++)
                userObj.movie[i] = !(req.getParameter("e" + Integer.toString(i)) == null);

            ObjectifyService.ofy().save().entity(userObj).now();
            resp.sendRedirect("/user.jsp");
        } else {
            resp.sendRedirect(userService.createLoginURL(req.getRequestURI()));
        }
    }
}


