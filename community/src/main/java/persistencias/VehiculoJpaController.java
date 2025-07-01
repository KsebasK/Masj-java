/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencias;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;
import logica.Vehiculo;

public class VehiculoJpaController implements Serializable {

    private EntityManagerFactory emf = null;

    public VehiculoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public void create(Vehiculo vehiculo) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(vehiculo);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public List<Vehiculo> findVehiculoEntities() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT v FROM Vehiculo v", Vehiculo.class).getResultList();
        } finally {
            em.close();
        }
    }
}
