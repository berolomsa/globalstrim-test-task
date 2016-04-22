package model;

import javax.ejb.Stateless;
import javax.persistence.*;

@Stateless
public class UserManagerBean {
	@PersistenceContext
	private EntityManager em;

	public User updateUser(User user) {
		return em.merge(user);
	}

}
