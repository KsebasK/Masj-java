/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.*;

@Entity
public class AlquilerParqueadero implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idAlquilerParqueadero;

    private Timestamp fechaIngreso;
    private Timestamp fechaSalida;
    private int totalPago;

    @ManyToOne
    @JoinColumn(name = "idBahia")
    private Parqueadero bahia;

    @ManyToOne
    @JoinColumn(name = "idVisitante")
    private Visitante visitante;

    @ManyToOne
    @JoinColumn(name = "idGuardia")
    private Usuario guardia;

    // Getters y Setters

    public int getIdAlquilerParqueadero() {
        return idAlquilerParqueadero;
    }

    public void setIdAlquilerParqueadero(int idAlquilerParqueadero) {
        this.idAlquilerParqueadero = idAlquilerParqueadero;
    }

    public Timestamp getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Timestamp fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public Timestamp getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(Timestamp fechaSalida) {
        this.fechaSalida = fechaSalida;
    }

    public int getTotalPago() {
        return totalPago;
    }

    public void setTotalPago(int totalPago) {
        this.totalPago = totalPago;
    }

    public Parqueadero getBahia() {
        return bahia;
    }

    public void setBahia(Parqueadero bahia) {
        this.bahia = bahia;
    }

    public Visitante getVisitante() {
        return visitante;
    }

    public void setVisitante(Visitante visitante) {
        this.visitante = visitante;
    }

    public Usuario getGuardia() {
        return guardia;
    }

    public void setGuardia(Usuario guardia) {
        this.guardia = guardia;
    }
}
