import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.jaxrs.JacksonJaxbJsonProvider;
import org.json.JSONException;
import org.json.JSONObject;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.GenericType;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.json.JSONConfiguration;

/**
 * Servlet implementation class GetPost
 */
@WebServlet("/GetPost")
public class GetPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    /*public Profile() {
        super();
        // TODO Auto-generated constructor stub
    }*/

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Signin.disableCertificateValidation();
		Long postId = Long.parseLong(request.getParameter("postid"));
		//String password = request.getParameter("password");
		
		String requestString = Constants.GETPOSTAPI + postId;
		ClientConfig config = new DefaultClientConfig();
	    config.getClasses().add(JacksonJaxbJsonProvider.class);
	    config.getFeatures().put(JSONConfiguration.FEATURE_POJO_MAPPING, Boolean.TRUE);

		Client client = Client.create(config);
		WebResource webResource = client.resource(requestString);

		ClientResponse jsonResponse = webResource.accept("application/json").get(ClientResponse.class);
		if (jsonResponse.getStatus() != 200) {
			throw new RuntimeException("Failed : HTTP error code : " + jsonResponse.getStatus());
		}

		HashMap output = jsonResponse.getEntity(new GenericType<HashMap>(){});

		
			String date = (String) output.get("date");
			String bookName = (String) output.get("bookname");
			String authorName = (String) output.get("authorname");
			String publisherName = (String) output.get("publishername");
			String postOwner = (String) output.get("postowner").toString();
			Double price = (Double) output.get("price");
			System.out.println("Postowner is: "+postOwner);
			System.out.println("Logged in user is: "+request.getSession().getAttribute("userid"));
			
			if(postOwner != request.getSession().getAttribute("userid"))
			{
				System.out.println("Should work in main page");
			}
			request.setAttribute("bookname", bookName);
			request.setAttribute("authorname", authorName);
			request.setAttribute("publishername", publisherName);
			request.setAttribute("price", Double.toString(price));
			request.setAttribute("postdate", date);
			request.setAttribute("postowner", postOwner);
			request.setAttribute("postid", postId);
			request.setAttribute("sessionuser", request.getSession().getAttribute("userid"));
			
			requestString = Constants.GETBIDSAPI + postId;
			webResource = client.resource(requestString);

			jsonResponse = webResource.accept("application/json")
	                   .get(ClientResponse.class);

			if (jsonResponse.getStatus() != 200) {
			   throw new RuntimeException("Failed : HTTP error code : "
				+ jsonResponse.getStatus());
			}
			ArrayList<HashMap> listBids = jsonResponse.getEntity(new GenericType<ArrayList<HashMap>>(){});

			//JSONObject jsonObj = new JSONObject(output);
			System.out.println("Output is "+listBids);
			request.setAttribute("listBids", listBids);

		request.getRequestDispatcher("SinglePost.jsp").forward(request, response);
	}
}