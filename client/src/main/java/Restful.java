import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.jersey.core.header.FormDataContentDisposition;
import com.sun.jersey.multipart.FormDataParam;
import model.User;
import model.UserManagerBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.ws.rs.*;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.*;

@Stateless
@Path("/user")
@Consumes({MediaType.APPLICATION_JSON})
@Produces({MediaType.APPLICATION_JSON})
public class Restful extends Application {

	private static final ObjectMapper mapper = new ObjectMapper();

	private static final Logger log = LoggerFactory.getLogger(Restful.class);

	private UserManagerBean userManagerBean;

	@PostConstruct
	public void init() {
		try {
			userManagerBean = (UserManagerBean)(new InitialContext().lookup("java:global/testTask/server/UserManagerBean"));
		} catch (NamingException e) {
			log.error("Cant inject userManagerBean");
		}
	}

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response createUser(String json) {
		User user;
		try {
			user = mapper.readValue(json, User.class);
			return Response.status(Response.Status.OK).entity(mapper.writeValueAsString(userManagerBean.updateUser(user))).build();
		} catch (IOException e) {
			log.error("Error occur during creating user ");
			return Response.status(Response.Status.BAD_REQUEST).build();
		}
	}

	@POST
	@Path("/upload")
	@Consumes({MediaType.MULTIPART_FORM_DATA})
	public Response uploadPdfFile(@FormDataParam("file") InputStream fileInputStream,
									@FormDataParam("file") FormDataContentDisposition fileMetaData) throws Exception {
		String UPLOAD_PATH = "c:/test/";
		try {
			int read = 0;
			byte[] bytes = new byte[1024];
			OutputStream out = new FileOutputStream(new File(UPLOAD_PATH + fileMetaData.getFileName()));
			while ((read = fileInputStream.read(bytes)) != -1) {
				out.write(bytes, 0, read);
			}
			out.flush();
			out.close();
			String filePath = UPLOAD_PATH + fileMetaData.getFileName();
			return Response.status(Response.Status.OK).entity(filePath).build();
		} catch (IOException ex){
			throw new WebApplicationException(Response.Status.BAD_REQUEST);
		}
	}

	@PUT
	@Path("/update")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response editUser(String json) {
		User user;
		try {
			user = mapper.readValue(json, User.class);
			return Response.status(Response.Status.OK).entity(mapper.writeValueAsString(userManagerBean.updateUser(user))).build();
		} catch (IOException e) {
			log.error("Error occur during editing user ");
			return Response.status(Response.Status.BAD_REQUEST).build();
		}
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response getUser(@QueryParam("id") long id) {
		try {
			return Response.status(Response.Status.OK).entity(mapper.writeValueAsString(userManagerBean.getUser(id))).build();
		} catch (IOException e) {
			log.error("Error occur during editing user ");
			return Response.status(Response.Status.BAD_REQUEST).build();
		}
	}
}
