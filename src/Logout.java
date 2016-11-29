import java.io.IOException;
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
 * Servlet implementation class Logout
 */
@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In logout");
		Date loginDate = new Date(request.getSession().getCreationTime());
		System.out.println(loginDate + "\n");
		SimpleDateFormat localDateFormat = new SimpleDateFormat("HH:mm:ss");
		String lastLoginTime = localDateFormat.format(loginDate);
		localDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		String lastLoginDate = localDateFormat.format(loginDate);
		System.out.println(lastLoginTime + "\n" +lastLoginDate);
		
		String username = (String) request.getSession().getAttribute("username");
		String password = (String) request.getSession().getAttribute("password");
		request.getSession().invalidate();
		
		Client client = Client.create();

		String requestString = Constants.UPDATELOGINDETAILSAPI;
		WebResource webResource = client
		   .resource(requestString);

		MultivaluedMap formData = new MultivaluedMapImpl();
		formData.add("username", username);
		formData.add("password", password);
		formData.add("date", lastLoginDate);
		formData.add("time", lastLoginTime);
		ClientResponse jsonResponse = webResource
		    .type(MediaType.APPLICATION_FORM_URLENCODED_TYPE)
		    .post(ClientResponse.class, formData);


		if (jsonResponse.getStatus() != 200) {
		   throw new RuntimeException("Failed : HTTP error code : "
			+ jsonResponse.getStatus());
		}
		
		response.sendRedirect("LoginPage.jsp");
	}
}
