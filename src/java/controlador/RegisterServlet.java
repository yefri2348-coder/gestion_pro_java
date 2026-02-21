package controlador;

import modelo.Usuario;
import modelo.UsuarioDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        UsuarioDAO dao = new UsuarioDAO();

        if (dao.existeCorreo(correo)) {

            response.sendRedirect("registro.jsp?error=correo");

        } else {

            Usuario user = new Usuario();
            user.setNombre(nombre);
            user.setCorreo(correo);
            user.setPassword(password);

            if (dao.registrar(user)) {
                response.sendRedirect("index.jsp?registro=ok");
            } else {
                response.sendRedirect("registro.jsp?error=1");
            }
        }
    }
}


