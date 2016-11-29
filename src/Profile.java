import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;

import org.json.JSONException;
import org.json.JSONObject;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;

/**
 * Servlet implementation class Profile
 */
@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	/*
	 * public Profile() { super(); // TODO Auto-generated constructor stub }
	 */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String username = (String) request.getSession().getAttribute("username");
			String password = (String) request.getSession().getAttribute("password");
			System.out.println("Username: " + username + " PAssword: " + password);

			Client client = Client.create();

			String requestString = Constants.SIGNINAPI + username + "/" + password;
			WebResource webResource = client.resource(requestString);

			ClientResponse jsonResponse = webResource.accept("application/json").get(ClientResponse.class);
			if (jsonResponse.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + jsonResponse.getStatus());
			}

			String output = jsonResponse.getEntity(String.class);

			JSONObject jsonObj = new JSONObject(output);
			String name = jsonObj.getString("name");
			username = jsonObj.getString("username");
			String email = jsonObj.getString("email");
			String birthDate = jsonObj.getString("birthDate");
			String lastLoginDate = jsonObj.getString("lastLoginDate");
			String lastLoginTime = jsonObj.getString("lastLoginTime");

			System.out.println("birthdate is: " + birthDate);

			String gender = jsonObj.getString("gender");

			String parsedBirthDate = birthDate.replaceAll("-", "/");
			System.out.println("Output from Server .... \n");
			System.out.println(name + username + email + birthDate + gender);
			request.setAttribute("name", name);
			request.setAttribute("username", username);
			request.setAttribute("email", email);
			request.setAttribute("birthDate", parsedBirthDate);
			request.setAttribute("gender", gender);
			request.setAttribute("lastLoginDate", lastLoginDate);
			request.setAttribute("lastLoginTime", lastLoginTime);
			if (gender.equals("M")) {
				request.setAttribute("gendertype", 1);

			} else {
				request.setAttribute("gendertype", 0);
			}
			request.getRequestDispatcher("/WEB-INF/ProfilePage.jsp").forward(request, response);
			//response.sendRedirect(request.getContextPath() + "/ProfilePage.jsp");
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}
}