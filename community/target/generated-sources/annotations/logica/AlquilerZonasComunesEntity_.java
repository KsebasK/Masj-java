package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Residente;
import logica.ZonaComun;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-07-01T19:58:25")
@StaticMetamodel(AlquilerZonasComunesEntity.class)
public class AlquilerZonasComunesEntity_ { 

    public static volatile SingularAttribute<AlquilerZonasComunesEntity, Integer> idAlquilerZonaComun;
    public static volatile SingularAttribute<AlquilerZonasComunesEntity, String> estado;
    public static volatile SingularAttribute<AlquilerZonasComunesEntity, ZonaComun> zonaComun;
    public static volatile SingularAttribute<AlquilerZonasComunesEntity, Integer> cantidadPersonas;
    public static volatile SingularAttribute<AlquilerZonasComunesEntity, Integer> totalPago;
    public static volatile SingularAttribute<AlquilerZonasComunesEntity, Date> fechaAlquiler;
    public static volatile SingularAttribute<AlquilerZonasComunesEntity, String> horaLimite;
    public static volatile SingularAttribute<AlquilerZonasComunesEntity, Residente> residente;

}