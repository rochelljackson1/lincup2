package com.uh.rachel.util.servlets;

import com.uh.rachel.util.DataHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "requests")
public class insertRequests extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DataHandler.insertRequestsRowByID(
                Integer.parseInt(request.getParameter("requestIdInput")),
                (Integer.parseInt(request.getParameter("orgIdInput"))), (Integer.parseInt(request.getParameter("memberIdInput")))
        );
        response.sendRedirect("./requests.jsp");
    }
}