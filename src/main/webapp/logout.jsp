<%
session.invalidate();
request.setAttribute("errMessage", "Successfully Logged Out!!");
RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
             requestDispatcher.forward(request, response);
//response.sendRedirect("index.jsp");
%>
