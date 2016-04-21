import model.User;
import model.UserManagerBean;
import org.junit.Assert;
import org.junit.Test;

public class UserManagerTest {

	@Test
	public void TestManagerBean() throws Exception {
		UserManagerBean userManagerBean = new UserManagerBean();
		User user = new User();
		user.setId(10L);
		user.setName("bero");
		user.setPhoneNumber("598900310");
		user.setBirthDate("19/50/2016");
		user.setIdScan(new byte[5]);
		user.setAddress("Muxiani");
		User mergedUser = userManagerBean.updateUser(user);
		Assert.assertEquals("bero", mergedUser.getName());
	}
}
