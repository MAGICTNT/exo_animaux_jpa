package servlet;

import entity.Chien;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.annotations.Parameter;
import repository.ChienRepository;

import java.io.IOException;
import java.util.List;

@WebServlet("/detaille")
public class DetailleServlet extends HttpServlet {
    private ChienRepository chienRepository;
    private String titre;
    private Chien chien;

    public void init(){
        chien = new Chien();
        chienRepository = new ChienRepository();
        titre = "🐶 Détails du chien 🐶";


    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Récupérer l'ID du chien à partir des paramètres de la requête
        String idChienParam = req.getParameter("idChien");
        if (idChienParam != null) {
            int idChien = Integer.parseInt(idChienParam);

            // Rechercher le chien correspondant dans la liste (ou base de données)
            Chien chienTrouve = chienRepository.findById(idChien);


            // Si le chien est trouvé, le passer à la JSP
            if (chienTrouve != null) {
                req.setAttribute("chien", chienTrouve);
            }
        }else {
            req.setAttribute("chien", chien);

        }
        req.setAttribute("titre", titre);
        getServletContext().getRequestDispatcher("/WEB-INF/detaille.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
