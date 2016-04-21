import model.User;
import model.UserManagerBean;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.MediaType;

@Stateless
@LocalBean
@Path("/user")
@Consumes({MediaType.APPLICATION_JSON})
@Produces({MediaType.APPLICATION_JSON})
public class Restful extends Application {
	@Inject
	private UserManagerBean userManagerBean;

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	public User create(User user) {
		return userManagerBean.updateUser(user);
	}

	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public User editUser(User user) {
		return userManagerBean.updateUser(user);
	}

}
