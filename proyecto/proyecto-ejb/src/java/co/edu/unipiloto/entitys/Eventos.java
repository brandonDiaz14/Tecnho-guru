/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.unipiloto.entitys;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Usuario
 */
@Entity
@Table(name = "EVENTOS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Eventos.findAll", query = "SELECT e FROM Eventos e"),
    @NamedQuery(name = "Eventos.findByEventoId", query = "SELECT e FROM Eventos e WHERE e.eventoId = :eventoId"),
    @NamedQuery(name = "Eventos.findByNombreEvento", query = "SELECT e FROM Eventos e WHERE e.nombreEvento = :nombreEvento"),
    @NamedQuery(name = "Eventos.findByTipoEvento", query = "SELECT e FROM Eventos e WHERE e.tipoEvento = :tipoEvento"),
    @NamedQuery(name = "Eventos.findByLugarEvento", query = "SELECT e FROM Eventos e WHERE e.lugarEvento = :lugarEvento"),
    @NamedQuery(name = "Eventos.findByHoraRetraso", query = "SELECT e FROM Eventos e WHERE e.horaRetraso = :horaRetraso")})
    
public class Eventos implements Serializable {

   

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "EVENTO_ID")
    private Integer eventoId;
    @Size(max = 50)
    @Column(name = "NOMBRE_EVENTO")
    private String nombreEvento;
    @Size(max = 50)
    @Column(name = "TIPO_EVENTO")
    private String tipoEvento;
    @Size(max = 50)
    @Column(name = "LUGAR_EVENTO")
    private String lugarEvento;
    @Column(name = "HORA_RETRASO")
    private Integer horaRetraso;
    @Size(max = 50)
    @Column(name = "LATITUD")
    private String latitud;
    @Size(max = 50)
    @Column(name = "LONGITUD")
    private String longitud;

    public Eventos(){
        
    }

    public Eventos(Integer eventoId, String nombreEvento, String tipoEvento, String lugarEvento, Integer horaRetraso,String latitud,String longitud) {
        this.eventoId = eventoId;
        this.nombreEvento = nombreEvento;
        this.tipoEvento = tipoEvento;
        this.lugarEvento = lugarEvento;
        this.horaRetraso = horaRetraso;
        this.latitud = latitud;
        this.longitud = longitud;
    }

    public Eventos(Integer eventoId) {
        this.eventoId = eventoId;
    }

    public Integer getEventoId() {
        return eventoId;
    }

    public void setEventoId(Integer eventoId) {
        this.eventoId = eventoId;
    }

    public String getNombreEvento() {
        return nombreEvento;
    }

    public void setNombreEvento(String nombreEvento) {
        this.nombreEvento = nombreEvento;
    }

    public String getTipoEvento() {
        return tipoEvento;
    }

    public void setTipoEvento(String tipoEvento) {
        this.tipoEvento = tipoEvento;
    }

    public String getLugarEvento() {
        return lugarEvento;
    }

    public void setLugarEvento(String lugarEvento) {
        this.lugarEvento = lugarEvento;
    }

    public Integer getHoraRetraso() {
        return horaRetraso;
    }

    public void setHoraRetraso(Integer horaRetraso) {
        this.horaRetraso = horaRetraso;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (eventoId != null ? eventoId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Eventos)) {
            return false;
        }
        Eventos other = (Eventos) object;
        if ((this.eventoId == null && other.eventoId != null) || (this.eventoId != null && !this.eventoId.equals(other.eventoId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "co.edu.unipiloto.entitys.Eventos[ eventoId=" + eventoId + " ]";
    }

    public String getLatitud() {
        return latitud;
    }

    public void setLatitud(String latitud) {
        this.latitud = latitud;
    }

    public String getLongitud() {
        return longitud;
    }

    public void setLongitud(String longitud) {
        this.longitud = longitud;
    }
    
}
