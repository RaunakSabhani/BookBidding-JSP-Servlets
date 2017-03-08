
public class Constants {

	public static final String secretKey = "abcd";
	
	public static final String SIGNINAPI = "https://localhost:8453/Jersey/rest/bookbids/signin/" +secretKey + "/";
	public static final String SIGNUPAPI = "https://localhost:8453/Jersey/rest/bookbids/signup";
	public static final String UPDATEAPI = "https://localhost:8453/Jersey/rest/bookbids/updateUser";
	public static final String UPDATELOGINDETAILSAPI = "https://localhost:8453/Jersey/rest/bookbids/updateLoginDetails";
	public static final String ADDPOSTAPI = "https://localhost:8453/Jersey/rest/bookbids/addPost";
	public static final String GETMYPOSTSAPI = "https://localhost:8453/Jersey/rest/bookbids/getMyPosts/" +secretKey + "/";
	public static final String GETPOSTAPI = "https://localhost:8453/Jersey/rest/bookbids/getPost/" + secretKey + "/";
	public static final String ADDBIDAPI = "https://localhost:8453/Jersey/rest/bookbids/addBid";
	public static final String GETBIDSAPI = "https://localhost:8453/Jersey/rest/bookbids/getBids/" + secretKey + "/";
	public static final String GETPOSTSBYNAMEAPI = "https://localhost:8453/Jersey/rest/bookbids/getPostsByName/" + secretKey + "/";
	public static final String GETPROFILEAPI = "https://localhost:8453/Jersey/rest/bookbids/getprofile/" + secretKey + "/";
	public static final String GETHOMEPOSTSAPI = "https://localhost:8453/Jersey/rest/bookbids/getPosts/" + secretKey + "/";
	public static final String ADDSHOPPINGCARTAPI = "https://localhost:8453/Jersey/rest/bookbids/addShoppingCart/";
	public static final String GETMYCART = "https://localhost:8453/Jersey/rest/bookbids/getMyCart/" + secretKey + "/";
	public static final String DELETEITEMCART = "https://localhost:8453/Jersey/rest/bookbids/deleteItemCart/";
	public static final String UPDATEITEMCART = "https://localhost:8453/Jersey/rest/bookbids/updateItemCart/";
	public static final String SUBMITSHOPPINGCARTAPI = "https://localhost:8453/Jersey/rest/bookbids/submitShoppingCart/";
	
	
}
