package model;

import javax.ejb.Stateless;
import javax.persistence.*;

@Stateless
public class UserManagerBean {
	private EntityManager getEntityManager() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("test");
		return factory.createEntityManager();
	}

	void updateUser(User user) {
		EntityManager em = getEntityManager();
		if (user.getId() == null) {
			em.persist(user);
		} else {
			em.merge(user);
		}
	}

}
