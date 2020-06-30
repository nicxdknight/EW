/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import com.DataConnection;
import com.ItemDao;
import com.Order;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "AddMoreServlet", urlPatterns = {"/AddMoreServlet","/add_more.html"})
public class AddMoreServlet extends HttpServlet {
    private final ItemDao itemData;

    public AddMoreServlet() throws ClassNotFoundException, FileNotFoundException {
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
    
    /**
     * Handles the HTTP <code>POST</code> method.
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
        response.setContentType("text/html;charset=UTF-8");
        String email=(String)session.getAttribute("email");
        Order order = new Order();
        order = itemData.checkifexist(email);
        if(order == null){
            order = itemData.newtoCart(email);
        }
       // Order order = itemData.newOrder(request.getUserPrincipal().getName());
       
        int maxItems = itemData.getFullItems().size();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
            for (int i = 1; i <= maxItems; i++) {
                String quantity ;
                quantity = request.getParameter("item_" + i);
                
//              out.println("<p>Item no. " + i + " Quantity:" + quantity + "</p>");
                try {
                    int q = Integer.parseInt(quantity);
                    if (q > 0) {
                        session.setAttribute("id_"+Integer.toString(i), quantity);
                        itemData.addToCart(order.getId(), itemData.getItem(i), q);
//                        out.println("<h2>" + itemData.getItem(i-1) + "</h2><br>");
                    }
                } catch (NumberFormatException e) {

                }
            }
             Double total=0d;
             total = itemData.getCartTotal(order.getId());
             System.out.println(total);

            
            
            session.setAttribute("total", total);

//            response.sendRedirect("thankyou.html?total="+total);
            response.sendRedirect("view_cart.html");
        }
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        String email=(String)session.getAttribute("email");
        Order order = itemData.newtoCart(email); 
        
       // Order order = itemData.newOrder(request.getUserPrincipal().getName());
       
        int maxItems = itemData.getFullItems().size();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
            for (int i = 1; i <= maxItems; i++) {
                String quantity ;
                quantity = request.getParameter("item_" + i);
                
//              out.println("<p>Item no. " + i + " Quantity:" + quantity + "</p>");
                try {
                    int q = Integer.parseInt(quantity);
                    if (q > 0) {
                        session.setAttribute("id_"+Integer.toString(i), quantity);
                        itemData.addToCart(order.getId(), itemData.getItem(i), q);
//                        out.println("<h2>" + itemData.getItem(i-1) + "</h2><br>");
                    }
                } catch (NumberFormatException e) {

                }
            }
             Double total=0d;
             total = itemData.getCartTotal(order.getId());
             System.out.println(total);

            
            
            session.setAttribute("total", total);

//            response.sendRedirect("thankyou.html?total="+total);
            response.sendRedirect("view_cart.html");
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
