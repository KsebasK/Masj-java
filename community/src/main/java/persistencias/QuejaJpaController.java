package persistencias;

import javax.persistence.*;
import logica.QuejaEntity;

public class QuejaJpaController {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("PersisteUnitPU");

    public void crearQueja(QuejaEntity q) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(q);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
