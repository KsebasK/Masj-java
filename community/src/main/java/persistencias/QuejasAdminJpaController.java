package persistencias;

import logica.QuejasAdmin;
import java.io.Serializable;
import java.util.List;
import javax.persistence.*;
import javax.persistence.criteria.CriteriaQuery;

public class QuejasAdminJpaController implements Serializable {

    private EntityManagerFactory emf;

    public QuejasAdminJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    // ✅ Método para obtener todas las quejas
    public List<QuejasAdmin> findQuejasAdminEntities() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(QuejasAdmin.class));
            return em.createQuery(cq).getResultList();
        } finally {
            em.close();
        }
    }

    // ✅ Método para buscar una queja por ID
    public QuejasAdmin findQuejasAdmin(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(QuejasAdmin.class, id);
        } finally {
            em.close();
        }
    }

    // ✅ Método para actualizar una queja
    public void edit(QuejasAdmin queja) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = null;
        try {
            tx = em.getTransaction();
            tx.begin();
            em.merge(queja);  // merge actualiza
            tx.commit();
        } catch (Exception ex) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            throw new RuntimeException("Error al editar la queja: " + ex.getMessage());
        } finally {
            em.close();
        }
    }
}
