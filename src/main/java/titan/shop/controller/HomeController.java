package titan.shop.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import titan.shop.exception.CustomError;
import titan.shop.model.Customer;
import titan.shop.model.CustomerContact;
import titan.shop.model.Product;
import titan.shop.model.ProductBrand;
import titan.shop.model.ProductCategories;
import titan.shop.service.CustomerContactService;
import titan.shop.service.CustomerService;
import titan.shop.service.ProductBrandService;
import titan.shop.service.ProductCategoriesService;
import titan.shop.service.ProductService;

@Controller
public class HomeController implements HandlerExceptionResolver{
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private CustomerContactService customerContactService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/")
	public String homePage(Model model,HttpSession ss){
		Page<Product> page = productService.getAllProduct(1);
	  
		List<Product> products=new ArrayList<>();
		
		for (Product product : page) {
			products.add(product);
		}
		
		model.addAttribute("products", products);
		ss.setAttribute("cats", pd.getAll());
		return "home";
	}
	@Autowired
	ProductCategoriesService pd;
	@GetMapping("/getca")
	@ResponseBody
	public List<ProductCategories> list()
	{
		return pd.getAll();
	}
   @Autowired
   private ProductBrandService pbd;
   
   @GetMapping("/test")
   @ResponseBody
   public List<ProductBrand> getTest()
   {
	   return pbd.getAll();
   }
	
   
   @RequestMapping("/login")
   public String login(
           @RequestParam(value="error", required = false)
           String error,
           @RequestParam(value="logout", required = false)
           String logout,
           Model model){

       if(error != null){
           model.addAttribute("error", "Invalid username and password");
       }

       if (logout !=null){
           model.addAttribute("msg", "You have been logged out successfully");
       }

       return "login";
   }
   
   @RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null){    
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		
		cancelCookie(request, response);
		return "redirect:/login?logout";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
	}
   
   
   
   void cancelCookie(HttpServletRequest request, HttpServletResponse response)
   {
     String cookieName = "remember-me";
     Cookie cookie = new Cookie(cookieName, null);
     cookie.setMaxAge(0);
     cookie.setPath(StringUtils.hasLength(request.getContextPath()) ? request.getContextPath() : "/");
     response.addCookie(cookie);
   }
   
   @RequestMapping("/about")
	public String aboutPage(){
		
		return "about";
	}
   
   
   
   @RequestMapping(value="/contact",method=RequestMethod.GET)
  	public String contact(){
  		
  		return "contact";
  	}
   
   
   @RequestMapping(value="/contact",method=RequestMethod.POST)
 	public String contactPost(@AuthenticationPrincipal User activeUser,@RequestParam("message")String message,Model model){
	   Customer customer = customerService.findCustomerByUsername(activeUser.getUsername());
	   
	   CustomerContact customerContact=new CustomerContact();
	   customerContact.setContactInfo(message);
	   customerContact.setCustomer(customer);
	   customerContact.setDate(new Date());
	   
	   customerContactService.addNewMessage(customerContact);
	   
	   model.addAttribute("msg","Message is sent to the green online shop");
	   
 		return "contact";
 	}
   
   
   
 
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		ModelAndView modelAndView=new ModelAndView();
		CustomError error=new CustomError();
	
		
		error.setMessage("Your request is not valid.Please Enter a valid request.");
		modelAndView.addObject("customError", error);
		modelAndView.setViewName("error_page");
		
		return modelAndView;
	}
   
}
