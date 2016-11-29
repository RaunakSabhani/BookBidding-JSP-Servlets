

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Client client = Client.create();

		//String requestString = "http://localhost:8080/Jersey/rest/ctofservice1/signin/" + username + "/password";
		String requestString = "http://localhost:8080/Jersey/rest/ctofservice1/signup";
		WebResource webResource = client
		   .resource(requestString);

		/*ClientResponse jsonResponse = webResource.accept("application/json")
                   .get(ClientResponse.class);*/
		MultivaluedMap formData = new MultivaluedMapImpl();
		formData.add("userName", username);
		formData.add("password", password);
		formData.add("firstName", "Parag");
		formData.add("lastName", "Dakle");
		formData.add("password", password);
		formData.add("email", "raunak@google.com");
		ClientResponse jsonResponse = webResource
		    .type(MediaType.APPLICATION_FORM_URLENCODED_TYPE)
		    .post(ClientResponse.class, formData);


		if (jsonResponse.getStatus() != 200) {
		   throw new RuntimeException("Failed : HTTP error code : "
			+ jsonResponse.getStatus());
		}

		String output = jsonResponse.getEntity(String.class);

		System.out.println("Output from Server .... \n");
		System.out.println(output);

		PrintWriter out = response.getWriter();
		out.println( "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" +" +
                "http://www.w3.org/TR/html4/loose.dtd\">\n" +
            "<html> \n" +
              "<head> \n" +
                "<meta http-equiv=\"Content-Type\" content=\"text/html; " +
                  "charset=ISO-8859-1\"> \n" +
                "<title> Crunchify.com JSP Servlet Example  </title> \n" +
              "</head> \n" +
              "<body> <div align='center'> \n" +
                "<style= \"font-size=\"12px\" color='black'\"" + "\">" +
                  "Username: " + username + " <br> " + 
                  "Password: " + password +
              "</font></body> \n" +
            "</html>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
