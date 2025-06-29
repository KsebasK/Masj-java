package persistencias;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;
import logica.QuejaAdmin;

public class QuejaAdminJpaController {

    private final EntityManagerFactory emf;

    public QuejaAdminJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    // Crear queja
    public void create(QuejaAdmin queja) {
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
    public void edit(QuejaAdmin queja) {
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
            QuejaAdmin queja = em.find(QuejaAdmin.class, id);
            if (queja != null) {
                em.remove(queja);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    // Buscar una queja por ID
    public QuejaAdmin findQuejaAdmin(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(QuejaAdmin.class, id);
        } finally {
            em.close();
        }
    }

    // Traer todas las quejas
    public List<QuejaAdmin> findQuejaAdminEntities() {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<QuejaAdmin> query = em.createQuery("SELECT q FROM QuejaAdmin q", QuejaAdmin.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }
}

