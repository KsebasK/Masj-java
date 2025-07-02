package persistencias;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;
import logica.QuejaEntity;

public class QuejaResidenteJpaController {

    private final EntityManagerFactory emf;

    public QuejaResidenteJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    // Crear queja
    public void create(QuejaEntity queja) {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(queja);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    // Editar queja
    public void edit(QuejaEntity queja) {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(queja);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    // Eliminar queja
    public void destroy(int id) {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            QuejaEntity queja = em.find(QuejaEntity.class, id);
            if (queja != null) {
                em.remove(queja);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    // Buscar una queja por ID
    public QuejaEntity findQuejaAdmin(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(QuejaEntity.class, id);
        } finally {
            em.close();
        }
    }

    // Traer todas las quejas
    public List<QuejaEntity> findQuejaAdminEntities() {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<QuejaEntity> query = em.createQuery("SELECT q FROM QuejaEntity q", QuejaEntity.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }
}

