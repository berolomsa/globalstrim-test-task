//import model.User;
//
//import javax.persistence.EntityManager;
//import javax.persistence.EntityManagerFactory;
//import javax.persistence.Persistence;
//
//public class Main {
//	public static void main(String[] args) {
//		EntityManagerFactory factory = Persistence.createEntityManagerFactory("test");
//		EntityManager theManager = factory.createEntityManager();
//		theManager .getTransaction().begin();
//		User person = new User();
//		person.setName("ana");
//		theManager.persist(person);
//		theManager.getTransaction().commit();
//	}
//}
