/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.unipiloto.labjsp;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Noelia
 */
public class NameHandler {

    private String name;
    private String fechaNac;
    private String edadStr;
    int ahoraTime = LocalDateTime.now().getHour();
    LocalDate fecha;

    public NameHandler() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = "Hola Tu nombre es: " + name;
    }

    public String getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(String fechaNac) {
        this.fechaNac = fechaNac;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha() {
        this.fecha = LocalDate.parse(getFechaNac());
    }

    public String getEdadStr() {
        return edadStr;
    }

    public void setEdadStr(String edadStr) {
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate fechaNac = LocalDate.parse(getFechaNac(), fmt);
        LocalDate ahora = LocalDate.now();

        Period periodo = Period.between(fechaNac, ahora);
        this.edadStr = "" + periodo.getYears() + " años";
    }

    public int getAhora() {
        return ahoraTime;
    }

    public void setAhora(int ahoraTime) {
        this.ahoraTime = ahoraTime;
    }
}
