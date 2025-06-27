package persistencias;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;
import javax.persistence.criteria.CriteriaQuery;
import logica.Apartamento;

public class ApartamentoJpaController implements Serializable {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("PersisteUnitPU");

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Apartamento apartamento) {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(apartamento);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void edit(Apartamento apartamento) throws Exception {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            apartamento = em.merge(apartamento);
            em.getTransaction().commit();
        } catch (Exception ex) {
            throw new Exception("Error al editar apartamento: " + ex.getMessage());
        } finally {
            em.close();
        }
    }

    public void destroy(int id) throws Exception {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            Apartamento apto = em.getReference(Apartamento.class, id);
            em.remove(apto);
            em.getTransaction().commit();
        } catch (Exception ex) {
            throw new Exception("Error al eliminar apartamento: " + ex.getMessage());
        } finally {
            em.close();
        }
    }

    public List<Apartamento> findApartamentos() {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createQuery("SELECT a FROM Apartamento a");
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Apartamento findApartamento(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Apartamento.class, id);
        } finally {
            em.close();
        }
    }
    
    public Apartamento findByTorreYApto(String torre, String apto) {
    EntityManager em = getEntityManager();
    try {
        TypedQuery<Apartamento> query = em.createQuery(
            "SELECT a FROM Apartamento a WHERE a.torre = :torre AND a.apto = :apto", Apartamento.class);
        query.setParameter("torre", torre);
        query.setParameter("apto", apto);

        List<Apartamento> resultados = query.getResultList();
        return resultados.isEmpty() ? null : resultados.get(0);
    } finally {
        em.close();
    }
}
public List<Apartamento> findApartamentoEntities() {
    EntityManager em = getEntityManager();
    try {
        CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
        cq.select(cq.from(Apartamento.class));
        return em.createQuery(cq).getResultList();
    } finally {
        em.close();
    }
}
}
