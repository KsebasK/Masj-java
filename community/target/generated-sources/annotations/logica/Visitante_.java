package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-06-30T15:54:33")
@StaticMetamodel(Visitante.class)
public class Visitante_ { 

    public static volatile SingularAttribute<Visitante, String> nombresVisitante;
    public static volatile SingularAttribute<Visitante, String> tipoDocumento;
    public static volatile SingularAttribute<Visitante, Integer> numDocumento;
    public static volatile SingularAttribute<Visitante, String> apellidosVisitante;
    public static volatile SingularAttribute<Visitante, Integer> idGuardia;
    public static volatile SingularAttribute<Visitante, Date> horaEntrada;
    public static volatile SingularAttribute<Visitante, Integer> idApartamento;
    public static volatile SingularAttribute<Visitante, Integer> idVisitante;
    public static volatile SingularAttribute<Visitante, Date> horaSalida;

}