package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-07-01T22:45:38")
@StaticMetamodel(Parqueadero.class)
public class Parqueadero_ { 

    public static volatile SingularAttribute<Parqueadero, String> estado;
    public static volatile SingularAttribute<Parqueadero, String> novedad;
    public static volatile SingularAttribute<Parqueadero, Integer> idBahia;
    public static volatile SingularAttribute<Parqueadero, Date> fechaSalida;
    public static volatile SingularAttribute<Parqueadero, Date> fechaEntrada;

}