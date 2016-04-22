package model;

import javax.ejb.Stateless;
import javax.persistence.*;

@Stateless
public class UserManagerBean {
	@PersistenceContext
	private EntityManager em;

	public void setEm(EntityManager em) {
		this.em = em;
	}

	public User updateUser(User user) {
		return em.merge(user);
	}

	public User getUser(Long id) {
		return em.find(User.class, id);
	}
}
