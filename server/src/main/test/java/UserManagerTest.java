import model.User;
import model.UserManagerBean;
import org.junit.Assert;
import org.junit.Test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class UserManagerTest {

	@Test
	public void testUpdateUser() throws Exception {
		UserManagerBean userManagerBean = new UserManagerBean();
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("test");
		userManagerBean.setEm(factory.createEntityManager());
		User user = new User();
		user.setId(10L);
		user.setName("bero");
		user.setPhoneNumber("598900310");
		user.setBirthDate("19/50/2016");
		user.setAddress("Muxiani");
		User mergedUser = userManagerBean.updateUser(user);
		Assert.assertTrue(mergedUser.getId() > 0);
	}

}
