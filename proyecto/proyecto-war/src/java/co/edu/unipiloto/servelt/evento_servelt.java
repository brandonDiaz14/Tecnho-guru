/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.unipiloto.servelt;

import co.edu.unipiloto.entitys.Eventos;
import co.edu.unipiloto.session.EventosFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Usuario
 */
@WebServlet(name = "evento_servelt", urlPatterns = {"/evento_servelt"})
public class evento_servelt extends HttpServlet {

    @EJB
    private EventosFacadeLocal eventosFacade;
    private Eventos evento; 

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        String desicion = request.getParameter("action");
        String idstr = request.getParameter("evento_id");
        String nombreEvento = request.getParameter("nombre_evento");
        String tipoEvento = request.getParameter("tipo_evento");
        String lugarEvento = request.getParameter("lugar_evento");
        String horaRetraso = request.getParameter("hora_retraso");
        String latitud = request.getParameter("latitud");
        String longitud = request.getParameter("longitud");
        
        int idEvento = Integer.parseInt(idstr);
        int horaR = Integer.parseInt(horaRetraso);
        System.out.println(desicion);
       
        evento = new Eventos(idEvento,nombreEvento,tipoEvento,lugarEvento,horaR,latitud,longitud);
        if (desicion.equals("Add")){
            eventosFacade.create(evento);
        }else if(desicion.equals("Delete")){
            eventosFacade.remove(evento);
        }else if(desicion.equals("Edit")){
            eventosFacade.edit(evento);
        }
        
        
        request.setAttribute("allEventos", eventosFacade.findAll());
        request.getRequestDispatcher("EventoInfo.jsp").forward(request, response);
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
