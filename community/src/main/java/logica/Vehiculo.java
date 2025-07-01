/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.*;

@Entity
public class Vehiculo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idVehiculo;

    private String placaVehiculo;
    private String marcaVehiculo;
    private String modeloVehiculo;

    @ManyToOne
    @JoinColumn(name = "idBahia")
    private Parqueadero bahia;

    @ManyToOne
    @JoinColumn(name = "idResidente", nullable = true)
    private Residente residente;

    @ManyToOne
    @JoinColumn(name = "idVisitante", nullable = true)
    private Visitante visitante;

    private Timestamp hora_ingreso;
    private Timestamp hora_salida;

    private int valor_pagado;

    
    public int getIdVehiculo() {
        return idVehiculo;
    }

    public void setIdVehiculo(int idVehiculo) {
        this.idVehiculo = idVehiculo;
    }

    public String getPlacaVehiculo() {
        return placaVehiculo;
    }

    public void setPlacaVehiculo(String placaVehiculo) {
        this.placaVehiculo = placaVehiculo;
    }

    public String getMarcaVehiculo() {
        return marcaVehiculo;
    }

    public void setMarcaVehiculo(String marcaVehiculo) {
        this.marcaVehiculo = marcaVehiculo;
    }

    public String getModeloVehiculo() {
        return modeloVehiculo;
    }

    public void setModeloVehiculo(String modeloVehiculo) {
        this.modeloVehiculo = modeloVehiculo;
    }

    public Parqueadero getBahia() {
        return bahia;
    }

    public void setBahia(Parqueadero bahia) {
        this.bahia = bahia;
    }

    public Residente getResidente() {
        return residente;
    }

    public void setResidente(Residente residente) {
        this.residente = residente;
    }

    public Visitante getVisitante() {
        return visitante;
    }

    public void setVisitante(Visitante visitante) {
        this.visitante = visitante;
    }

    public Timestamp getHora_ingreso() {
        return hora_ingreso;
    }

    public void setHora_ingreso(Timestamp hora_ingreso) {
        this.hora_ingreso = hora_ingreso;
    }

    public Timestamp getHora_salida() {
        return hora_salida;
    }

    public void setHora_salida(Timestamp hora_salida) {
        this.hora_salida = hora_salida;
    }

    public int getValor_pagado() {
        return valor_pagado;
    }

    public void setValor_pagado(int valor_pagado) {
        this.valor_pagado = valor_pagado;
    }

    public void setHoraIngreso(Timestamp now) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
