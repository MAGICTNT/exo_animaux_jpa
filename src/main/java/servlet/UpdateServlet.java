package servlet;

import entity.Chien;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.ChienRepository;

import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
    private ChienRepository chienRepository ;
    private Chien chien;
    private String titre;
    public void init(){
        titre = "🐶update des chiens 🐶";
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Récupérer l'ID du chien à partir des paramètres de la requête
        String idChienParam = req.getParameter("idChien");
        req.setAttribute("titre", titre);
        if (idChienParam != null) {
            int idChien = Integer.parseInt(idChienParam);

            // Rechercher le chien correspondant dans la liste (ou base de données)
            Chien chienTrouve = chienRepository.findById(idChien);

            // Si le chien est trouvé, le passer à la JSP
            if (chienTrouve != null) {
                LocalDate currentDate = LocalDate.now();
                req.setAttribute("chien", chienTrouve);
                getServletContext().getRequestDispatcher("/WEB-INF/ajouter.jsp").forward(req, resp);

            }
        }else {
            req.setAttribute("chien", null);

            getServletContext().getRequestDispatcher("/WEB-INF/affichage.jsp").forward(req, resp);
        }

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        doGet(req, resp);
    }
}
