package model;

import javax.ejb.Stateless;
import javax.persistence.*;

@Stateless
public class UserManagerBean {
	private EntityManager entityManager = null;

	public EntityManager getEntityManager() {
		if (entityManager == null) {
			EntityManagerFactory factory = Persistence.createEntityManagerFactory("test");
			entityManager = factory.createEntityManager();
		}
		return entityManager;
	}

	public User updateUser(User user) {
		EntityManager em = getEntityManager();
		return em.merge(user);
	}

}
