/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import com.DataConnection;
import com.ItemDao;
import com.Items;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author harsh
 */
@WebServlet(name = "RemoveFromCart", urlPatterns = {"/RemoveFromCart", "/remove_from_cart.html"})
public class RemoveFromCart extends HttpServlet {
    private final ItemDao itemData;

    public RemoveFromCart() throws ClassNotFoundException, FileNotFoundException {
        this.itemData = DataConnection.getItemDao();
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        HttpSession session=request.getSession();
        String name = (String) session.getAttribute("email");
        String itemid = request.getParameter("id");
        List<Items> itemsList = itemData.getFullItems();
        int id = Integer.parseInt(itemid);
        System.out.println("item ka id " + itemid);
//        for(Items item: itemsList){
//            if(itemname.equals(item.getName())){
//                System.out.println(itemname);
//                System.out.println(item.getName());
//                id = item.getId();
//                itemData.removeFromCart(id,itemData.getItem(id),name);
//            }
//        }
        itemData.removeFromCart(id,itemData.getItem(id),name);
        
        //System.out.println("fetched name + " + itemname);
       
       response.sendRedirect("view_cart.html");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

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
