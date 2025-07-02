/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.io.Serializable;
import javax.persistence.*;

@Entity
public class Parqueadero implements Serializable {

    @Id
    private int idBahia;

    @Column(nullable = false)
    private String estado;  // "Ocupado" o "Desocupado"

    private String novedad;

    @Temporal(TemporalType.DATE)
    private java.util.Date fechaEntrada;

    @Temporal(TemporalType.DATE)
    private java.util.Date fechaSalida;

    // Getters y Setters

    public int getIdBahia() {
        return idBahia;
    }

    public void setIdBahia(int idBahia) {
        this.idBahia = idBahia;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getNovedad() {
        return novedad;
    }

    public void setNovedad(String novedad) {
        this.novedad = novedad;
    }

    public java.util.Date getFechaEntrada() {
        return fechaEntrada;
    }

    public void setFechaEntrada(java.util.Date fechaEntrada) {
        this.fechaEntrada = fechaEntrada;
    }

    public java.util.Date getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(java.util.Date fechaSalida) {
        this.fechaSalida = fechaSalida;
    }
}