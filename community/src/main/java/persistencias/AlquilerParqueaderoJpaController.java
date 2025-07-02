/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencias;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;
import logica.AlquilerParqueadero;

public class AlquilerParqueaderoJpaController implements Serializable {

    private EntityManagerFactory emf;

    public AlquilerParqueaderoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public void create(AlquilerParqueadero alquiler) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(alquiler);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public List<AlquilerParqueadero> findAlquilerParqueaderoEntities() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT a FROM AlquilerParqueadero a", AlquilerParqueadero.class).getResultList();
        } finally {
            em.close();
        }
    }

   
}