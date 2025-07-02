package persistencias;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;
import logica.AlquilerZonasComunesEntity;

public class AlquilerZonasComunesJpaController implements Serializable {


    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("PersisteUnitPU");
    
    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(AlquilerZonasComunesEntity reserva) {
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

    public List<AlquilerZonasComunesEntity> traerReservasPorResidente(int idResidente) {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<AlquilerZonasComunesEntity> query = em.createQuery(
                "SELECT a FROM AlquilerZonasComunesEntity a WHERE a.residente.idResidente = :idResidente",
                AlquilerZonasComunesEntity.class
            );
            query.setParameter("idResidente", idResidente);
            return query.getResultList();
        } finally {
            if (em.isOpen()) {
                em.close();
            }
        }
    }
}
