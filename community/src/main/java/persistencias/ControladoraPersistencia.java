package persistencias;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import logica.AlquilerParqueadero;
import logica.Vehiculo;
import logica.Parqueadero;
import logica.Apartamento;
import logica.Usuario;
import logica.Visitante;
import persistencia.exceptions.NonexistentEntityException;
import logica.QuejaResidente;
import logica.Residente;

public class ControladoraPersistencia {

    // Crear EntityManagerFactory desde persistence.xml
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("PersisteUnitPU");

    // Inyectar emf al JpaController
    UsuarioJpaController usuJpa = new UsuarioJpaController(emf);
    VisitanteJpaController visitanteJpa = new VisitanteJpaController(emf);
    QuejaResidenteJpaController quejaJpa = new QuejaResidenteJpaController(emf);
    AlquilerParqueaderoJpaController alquilerJpa = new AlquilerParqueaderoJpaController(emf);
    VehiculoJpaController vehiculoJpa = new VehiculoJpaController(emf);
    ResidenteJpaController residenteJpa = new ResidenteJpaController(); 

    
    

    // ================= USUARIO =================

    // CREATE
    public void crearUsuario(Usuario usu) {
        usuJpa.create(usu);
    }

    // READ
    public List<Usuario> traerUsuarios() {
        return usuJpa.findUsuarioEntities();
    }

    // DELETE
    public void borrarUsuario(int idEliminar) {
        try {
            usuJpa.destroy(idEliminar);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario traerUsuario(int idEditar) {
        return usuJpa.findUsuario(idEditar);
    }

    public void editarUsuario(Usuario usu) {
        try {
            usuJpa.edit(usu);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario validarUsuario(String correo, String contrasenaEncriptada) {
        List<Usuario> lista = this.traerUsuarios();
        for (Usuario usu : lista) {
            if (usu.getCorreoElectronico().equalsIgnoreCase(correo)
                    && usu.getContrasena().equals(contrasenaEncriptada)) {
                return usu;
            }
        }
        return null; // No encontrado
    }

    // ================= APARTAMENTO =================

    public List<Apartamento> traerApartamentos() {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createQuery("SELECT a FROM Apartamento a");
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public Apartamento buscarApartamentoPorTorreYApto(String torre, String apartamento) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createQuery("SELECT a FROM Apartamento a WHERE a.torre = :torre AND a.apto = :apartamento");
            query.setParameter("torre", torre);
            query.setParameter("apartamento", apartamento);

            List<Apartamento> resultados = query.getResultList();
            if (resultados.isEmpty()) {
                return null;
            } else {
                return resultados.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            em.close();
        }
    }

    public void crearApartamento(Apartamento apt) {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(apt);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            throw new RuntimeException("Error al crear apartamento: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    // ================= VISITANTE =================

    public void registrarVisitante(Visitante visitante) {
        visitanteJpa.create(visitante);
    }

    public List<Visitante> traerVisitantes() {
        return visitanteJpa.findVisitanteEntities();
    }

    public Visitante buscarVisitante(int id) {
        return visitanteJpa.findVisitante(id);
    }

    // ================= EMF Helper =================

    private EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
   
    // ================= QUEJA =================

public void crearQueja(QuejaResidente queja) {
    quejaJpa.create(queja);
}

public List<QuejaResidente> traerQuejas() {
    return quejaJpa.findQuejaAdminEntities();
}

public QuejaResidente buscarQueja(int id) {
    return quejaJpa.findQuejaAdmin(id);
}

public void borrarQueja(int id) {
    try {
        quejaJpa.destroy(id);
    } catch (Exception e) {
        Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, e);
    }
}

public void editarQueja(QuejaResidente queja) {
    try {
        quejaJpa.edit(queja);
    } catch (Exception e) {
        Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, e);
    }
}


//NO BORRAR SEBASTIAN ACA PUSO PARA QUE LOS REGISTRADOS EN ARRENDATARIOS DE UNA VEZ SE VAYAN A TABLA RESIDENTES

public Usuario traerUsuarioPorCorreo(String correo) {
    EntityManager em = emf.createEntityManager();
    try {
        return em.createQuery("SELECT u FROM Usuario u WHERE u.correoElectronico = :correo", Usuario.class)
                 .setParameter("correo", correo)
                 .getSingleResult();
    } catch (Exception e) {
        e.printStackTrace();
        return null;
    } finally {
        em.close();
    }
}

public void crearResidente(Residente residente) {
    EntityManager em = emf.createEntityManager();
    try {
        em.getTransaction().begin();
        em.persist(residente);
        em.getTransaction().commit();
    } catch (Exception e) {
        if (em.getTransaction().isActive()) em.getTransaction().rollback();
        e.printStackTrace();
    } finally {
        em.close();
    }
}

    public List<Residente> traerResidentes() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT r FROM Residente r", Residente.class).getResultList();
        } finally {
            em.close();
        }
    }

        public List<Residente> traerResidentesConApartamentos() {
            EntityManager em = emf.createEntityManager();
            List<Residente> lista = new ArrayList<>();
            try {
                lista = em.createQuery("SELECT r FROM Residente r JOIN FETCH r.apartamento JOIN FETCH r.usuario", Residente.class)
                          .getResultList();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                em.close();
            }
            return lista;
        }
// ================= PARQUEADERO =================
public List<Parqueadero> traerParqueaderos() {
    EntityManager em = emf.createEntityManager();
    try {
        return em.createQuery("SELECT p FROM Parqueadero p", Parqueadero.class).getResultList();
    } finally {
        em.close();
    }
}

public Parqueadero traerBahiaDisponible() {
    EntityManager em = emf.createEntityManager();
    try {
        List<Parqueadero> bahias = em.createQuery("SELECT p FROM Parqueadero p WHERE p.estado = 'Desocupado'", Parqueadero.class)
                                     .setMaxResults(1)
                                     .getResultList();
        return bahias.isEmpty() ? null : bahias.get(0);
    } finally {
        em.close();
    }
}

public void actualizarParqueadero(Parqueadero p) {
    EntityManager em = emf.createEntityManager();
    try {
        em.getTransaction().begin();
        em.merge(p);
        em.getTransaction().commit();
    } catch (Exception e) {
        if (em.getTransaction().isActive()) em.getTransaction().rollback();
        e.printStackTrace();
    } finally {
        em.close();
    }
}


public void registrarVehiculo(Vehiculo vehiculo) {
    vehiculoJpa.create(vehiculo);
}

public List<Vehiculo> traerVehiculos() {
    return vehiculoJpa.findVehiculoEntities();
}
public Residente traerResidente(int id) {
    return residenteJpa.findResidente(id);
}
public void registrarAlquilerParqueadero(AlquilerParqueadero alquiler) {
    alquilerJpa.create(alquiler);
}
public Residente buscarResidente(int id) {
    return residenteJpa.findResidente(id);
}



}