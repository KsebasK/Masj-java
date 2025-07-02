package logica;

import java.sql.Timestamp;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Parqueadero;
import logica.Usuario;
import logica.Visitante;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-07-01T22:45:38")
@StaticMetamodel(AlquilerParqueadero.class)
public class AlquilerParqueadero_ { 

    public static volatile SingularAttribute<AlquilerParqueadero, Timestamp> fechaIngreso;
    public static volatile SingularAttribute<AlquilerParqueadero, Integer> idAlquilerParqueadero;
    public static volatile SingularAttribute<AlquilerParqueadero, Parqueadero> bahia;
    public static volatile SingularAttribute<AlquilerParqueadero, Timestamp> fechaSalida;
    public static volatile SingularAttribute<AlquilerParqueadero, Integer> totalPago;
    public static volatile SingularAttribute<AlquilerParqueadero, Usuario> guardia;
    public static volatile SingularAttribute<AlquilerParqueadero, Visitante> visitante;

}