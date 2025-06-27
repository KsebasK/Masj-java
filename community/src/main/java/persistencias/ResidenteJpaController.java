package persistencias;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;
import javax.persistence.criteria.CriteriaQuery;
import logica.Residente;

public class ResidenteJpaController implements Serializable {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("PersisteUnitPU");
    
    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Residente residente) {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(residente);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void edit(Residente residente) throws Exception {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            residente = em.merge(residente);
            em.getTransaction().commit();
        } catch (Exception ex) {
            throw new Exception("Error al editar residente: " + ex.getMessage());
        } finally {
            em.close();
        }
    }

    public void destroy(int id) throws Exception {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            Residente r = em.getReference(Residente.class, id);
            em.remove(r);
            em.getTransaction().commit();
        } catch (Exception ex) {
            throw new Exception("Error al eliminar residente: " + ex.getMessage());
        } finally {
            em.close();
        }
    }

    public Residente findResidente(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Residente.class, id);
        } finally {
            em.close();
        }
    }

    public List<Residente> findResidentes() {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createQuery("SELECT r FROM Residente r");
            return q.getResultList();
        } finally {
            em.close();
        }
    }
    
    public List<Residente> findResidenteEntities() {
    EntityManager em = getEntityManager();
    try {
        CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
        cq.select(cq.from(Residente.class));
        return em.createQuery(cq).getResultList();
    } finally {
        em.close();
    }
}

}
