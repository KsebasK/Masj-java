/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencias;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;
import logica.Visitante;

public class VisitanteJpaController implements Serializable {

    private EntityManagerFactory emf;

    // Constructor por defecto para uso directo
    public VisitanteJpaController() {
        this.emf = Persistence.createEntityManagerFactory("PersisteUnitPU");
    }

    // Constructor para pasar un EntityManagerFactory manualmente
    public VisitanteJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Visitante visitante) {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(visitante);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public List<Visitante> findVisitanteEntities() {
        EntityManager em = getEntityManager();
        try {
            Query q = em.createQuery("SELECT v FROM Visitante v");
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Visitante findVisitante(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Visitante.class, id);
        } finally {
            em.close();
        }
    }
}