/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencias;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

import logica.Parqueadero;
import persistencia.exceptions.NonexistentEntityException;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;


public class ParqueaderoJpaController implements Serializable {

    public ParqueaderoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }

    private EntityManagerFactory emf;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Parqueadero parqueadero) {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(parqueadero);
            em.getTransaction().commit();
        } finally {
            if (em.isOpen()) {
                em.close();
            }
        }
    }

    public void edit(Parqueadero parqueadero) throws Exception {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            parqueadero = em.merge(parqueadero);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findParqueadero(parqueadero.getIdBahia()) == null) {
                throw new NonexistentEntityException("El parqueadero con id " + parqueadero.getIdBahia() + " no existe.");
            }
            throw ex;
        } finally {
            if (em.isOpen()) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            Parqueadero parqueadero;
            try {
                parqueadero = em.getReference(Parqueadero.class, id);
                parqueadero.getIdBahia();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("El parqueadero con id " + id + " no existe.", enfe);
            }
            em.remove(parqueadero);
            em.getTransaction().commit();
        } finally {
            if (em.isOpen()) {
                em.close();
            }
        }
    }

    public List<Parqueadero> findParqueaderoEntities() {
        return findParqueaderoEntities(true, -1, -1);
    }

    public List<Parqueadero> findParqueaderoEntities(int maxResults, int firstResult) {
        return findParqueaderoEntities(false, maxResults, firstResult);
    }

    private List<Parqueadero> findParqueaderoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery<Parqueadero> cq = em.getCriteriaBuilder().createQuery(Parqueadero.class);
            cq.select(cq.from(Parqueadero.class));
            TypedQuery<Parqueadero> q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Parqueadero findParqueadero(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Parqueadero.class, id);
        } finally {
            em.close();
        }
    }

    public int getParqueaderoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery<Long> cq = em.getCriteriaBuilder().createQuery(Long.class);
            Root<Parqueadero> rt = cq.from(Parqueadero.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            TypedQuery<Long> q = em.createQuery(cq);
            return q.getSingleResult().intValue();
        } finally {
            em.close();
        }
    }
}