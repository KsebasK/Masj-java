package logica;

import java.sql.Timestamp;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Parqueadero;
import logica.Residente;
import logica.Visitante;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-07-01T23:08:09")
@StaticMetamodel(Vehiculo.class)
public class Vehiculo_ { 

    public static volatile SingularAttribute<Vehiculo, String> placaVehiculo;
    public static volatile SingularAttribute<Vehiculo, Timestamp> hora_ingreso;
    public static volatile SingularAttribute<Vehiculo, Integer> idVehiculo;
    public static volatile SingularAttribute<Vehiculo, Parqueadero> bahia;
    public static volatile SingularAttribute<Vehiculo, Timestamp> hora_salida;
    public static volatile SingularAttribute<Vehiculo, String> modeloVehiculo;
    public static volatile SingularAttribute<Vehiculo, Visitante> visitante;
    public static volatile SingularAttribute<Vehiculo, Integer> valor_pagado;
    public static volatile SingularAttribute<Vehiculo, String> marcaVehiculo;
    public static volatile SingularAttribute<Vehiculo, Residente> residente;

}