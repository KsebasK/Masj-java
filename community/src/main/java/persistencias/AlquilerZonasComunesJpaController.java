package persistencias;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import logica.AlquilerZonasComunes;

public class AlquilerZonasComunesJpaController implements Serializable {

    private EntityManagerFactory emf = null;

    public AlquilerZonasComunesJpaController() {
        this.emf = Persistence.createEntityManagerFactory("communityPU");
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(AlquilerZonasComunes reserva) {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(reserva);
            em.getTransaction().commit();
        } finally {
            if (em.isOpen()) {
                em.close();
            }
        }
    }

    public List<AlquilerZonasComunes> traerReservasPorResidente(int idResidente) {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<AlquilerZonasComunes> query = em.createQuery(
                    "SELECT a FROM AlquilerZonasComunes a WHERE a.idResidente.idResidente = :idResidente",
                    AlquilerZonasComunes.class);
            query.setParameter("idResidente", idResidente);
            return query.getResultList();
        } finally {
            if (em.isOpen()) {
                em.close();
            }
        }
    }

}
