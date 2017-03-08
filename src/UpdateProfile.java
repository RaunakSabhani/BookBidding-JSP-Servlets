import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;

/**
 * Servlet implementation class Update Profile
 */
@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Signin.disableCertificateValidation();
		System.out.println("In update Profile");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String gender = request.getParameter("gender");
		
		Client client = Client.create();

		String requestString = Constants.UPDATEAPI;
		System.out.println("request string is: "+requestString);
		WebResource webResource = client
		   .resource(requestString);
		System.out.println("Name is: "+name);
		MultivaluedMap formData = new MultivaluedMapImpl();
		formData.add("username", username);
		formData.add("userid", request.getSession().getAttribute("userid"));
		formData.add("name", name);
		formData.add("email", email);
		formData.add("gender", gender);
		formData.add("secretKey", Constants.secretKey);
		ClientResponse jsonResponse = webResource
		    .type(MediaType.APPLICATION_FORM_URLENCODED_TYPE)
		    .post(ClientResponse.class, formData);


		if (jsonResponse.getStatus() != 200) {
		   throw new RuntimeException("Failed : HTTP error code : "
			+ jsonResponse.getStatus());
		}

		request.getSession().setAttribute("name", name);
		//response.getWriter().println("Success Data");
		//response.getWriter().close();
		//request.getRequestDispatcher("GetProfile.jsp").forward(request, response);
		response.sendRedirect("GetProfile.jsp");
		//request.getRequestDispatcher("/GetProfile.jsp").forward(request, response);
	}

}
