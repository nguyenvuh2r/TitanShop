package titan.shop.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import titan.shop.dao.CustomerDao;
import titan.shop.dao.ProductBrandDao;
import titan.shop.dao.ProductCategoriesDao;
import titan.shop.dao.ProductVariantDao;
import titan.shop.exception.CustomError;
import titan.shop.model.Cart;
import titan.shop.model.Customer;
import titan.shop.model.CustomerContact;
import titan.shop.model.CustomerOrder;
import titan.shop.model.Product;
import titan.shop.model.ProductBrand;
import titan.shop.model.ProductCategories;
import titan.shop.model.ProductVariant;
import titan.shop.service.CartItemService;
import titan.shop.service.CustomerContactService;
import titan.shop.service.CustomerOrderService;
import titan.shop.service.CustomerService;
import titan.shop.service.ProductBrandService;
import titan.shop.service.ProductCategoriesService;
import titan.shop.service.ProductService;
import titan.shop.service.ProductVariantService;




@Controller()
@RequestMapping("/admin")
public class AdminHome implements HandlerExceptionResolver{

	@Autowired
	private ProductService productService;
	
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private CustomerOrderService customerOrderService;
	
	@Autowired
	private CartItemService cartItemService;
	
	@Autowired
	private CustomerContactService customerContactService;
	
	
	
	@RequestMapping
	public String adminPage(){
		
		return "admin";
	}
	
	/* Section of product Categories */
	@Autowired
	private ProductCategoriesDao p;
	@RequestMapping("productcategories/{pageNumber}")
	public String productCategories(@PathVariable Integer pageNumber,ModelMap md)
	{
		PageRequest pageRequest= PageRequest.of(pageNumber-1, 2);
		Page<ProductCategories> page = p.findAll(pageRequest) ;
		int currentPageNumber=page.getNumber()+1;
		int beginIndex=Math.max(1, currentPageNumber-6);
		int endIndex=Math.min(beginIndex+10, page.getTotalPages());
		List<ProductCategories> list = new ArrayList<>();
		
		for (ProductCategories productCategories : page) {
			list.add(productCategories);	
		}
		System.out.println(list.get(0).getName());
		md.addAttribute("productcategories", list);
		md.addAttribute("totalPages",page.getTotalPages());
		md.addAttribute("currentPageNumber",currentPageNumber);
		md.addAttribute("beginIndex",beginIndex);
		md.addAttribute("endIndex",endIndex);
		return "categories";
	}
	
	
	/* End Section */
	/* Section of productvariants */
	@Autowired
	private ProductVariantDao pdc;
	@RequestMapping("productvariants/{pageNumber}")
	public String productVariant(@PathVariable Integer pageNumber,ModelMap md)
	{
		PageRequest pageRequest= PageRequest.of(pageNumber-1, 2);
		Page<ProductVariant> page = pdc.findAll(pageRequest) ;
		int currentPageNumber=page.getNumber()+1;
		int beginIndex=Math.max(1, currentPageNumber-6);
		int endIndex=Math.min(beginIndex+10, page.getTotalPages());
		List<ProductVariant> list = new ArrayList<>();
		
		for (ProductVariant productVariant : page) {
			list.add(productVariant);	
		}
		md.addAttribute("productvariants", list);
		md.addAttribute("totalPages",page.getTotalPages());
		md.addAttribute("currentPageNumber",currentPageNumber);
		md.addAttribute("beginIndex",beginIndex);
		md.addAttribute("endIndex",endIndex);
		return "variants";
	}
	
		
	/*  */
	
	
	@RequestMapping("/productManagement/{pageNumber}")
	public String productManagement(@PathVariable Integer pageNumber,Model model){
		
		
		Page<Product> page=productService.getAllProduct(pageNumber);
		
		int currentPageNumber=page.getNumber()+1;
		int beginIndex=Math.max(1, currentPageNumber-6);
		int endIndex=Math.min(beginIndex+10, page.getTotalPages());
		
		
		
      List<Product> products=new ArrayList<>();
		
		
		
		for (Product product : page) {
			products.add(product);
		}
		model.addAttribute("products",products);
		model.addAttribute("totalPages",page.getTotalPages());
		model.addAttribute("currentPageNumber",currentPageNumber);
		model.addAttribute("beginIndex",beginIndex);
		model.addAttribute("endIndex",endIndex);
		
		return "productInventory";
	}
	@Autowired
	private ProductBrandDao pdv;
	@RequestMapping("/productbrand/{pageNumber}")
	public String productBrandManagement(@PathVariable Integer pageNumber,Model model){
		
		PageRequest pageRequest= PageRequest.of(pageNumber-1, 2);
		Page<ProductBrand> page=pdv.findAll(pageRequest);
		System.out.println(page.getNumberOfElements());
		int currentPageNumber=page.getNumber()+1;
		int beginIndex=Math.max(1, currentPageNumber-6);
		int endIndex=Math.min(beginIndex+10, page.getTotalPages());
		
		
		
      List<ProductBrand> productBrand=new ArrayList<>();
		
		
		
		for (ProductBrand productbrand : page) {
			productBrand.add(productbrand);
		}

		model.addAttribute("productbrand",productBrand);
		model.addAttribute("totalPages",page.getTotalPages());
		model.addAttribute("currentPageNumber",currentPageNumber);
		model.addAttribute("beginIndex",beginIndex);
		model.addAttribute("endIndex",endIndex);
		
		return "brand";
	}
	
	
	
	
	@RequestMapping(value="/productManagement/search/{pageNumber}",method=RequestMethod.POST)
	public String productSearch(@RequestParam("searchTerm")String searchTerm,@PathVariable Integer pageNumber,Model model){
		
		
		Page<Product> page=productService.getAllProduct(pageNumber);
		
		int currentPageNumber=page.getNumber()+1;
		int beginIndex=Math.max(1, currentPageNumber-6);
		int endIndex=Math.min(beginIndex+10, page.getTotalPages());
		
		
		
      List<Product> products=new ArrayList<>();
		
		
		
		for (Product product : page) {
			products.add(product);
		}
		
		model.addAttribute("products",products);
		model.addAttribute("totalPages",page.getTotalPages());
		model.addAttribute("currentPageNumber",currentPageNumber);
		model.addAttribute("beginIndex",beginIndex);
		model.addAttribute("endIndex",endIndex);
		
		model.addAttribute("search","search");
		return "productInventory";
	}
	
	
	@Autowired
	private CustomerDao d;
	@RequestMapping("/customerManagement/{pageNumber}")
	public String customerManagement(Model model,@PathVariable Integer pageNumber  ){
		
		PageRequest pageRequest= PageRequest.of(pageNumber-1, 2);
		Page<Customer> page=d.findAll(pageRequest);
		System.out.println(page.getNumberOfElements());
		int currentPageNumber=page.getNumber()+1;
		int beginIndex=Math.max(1, currentPageNumber-6);
		int endIndex=Math.min(beginIndex+10, page.getTotalPages());
		
		
		
      List<Customer> customers=new ArrayList<>();
		
		
		
		for (Customer customer: page) {
			customers.add(customer);
		}

		model.addAttribute("totalPages",page.getTotalPages());
		model.addAttribute("currentPageNumber",currentPageNumber);
		model.addAttribute("beginIndex",beginIndex);
		model.addAttribute("endIndex",endIndex);
		model.addAttribute("customers",customers);
		
		return "customerManagement";
	}
	
	
	@RequestMapping("/customerManagement/address/{customerId}")
	public String customerShippingBillingAddress(@PathVariable("customerId")long customerId,Model model){
		
		
		 Customer customer=customerService.getCustomerBycustomerId(customerId);
		
		 model.addAttribute("customer",customer);
		 
		return "customerAddressDetail";
	}
	
	
	
	@RequestMapping("/customerOrder")
	public String customerOrder(Model model){
		
		
		List<CustomerOrder> customerOrders=customerOrderService.getAllCustomerOrder();
		model.addAttribute("orders",customerOrders);
		return "orderList";
	}
	
	
	
	@RequestMapping("/customerOrder/deletOrder/{customerOrderId}")
	public String deleteCustomerOrder(@PathVariable("customerOrderId")long customerOrderId,Model model){
		
		
		CustomerOrder customerOrder=customerOrderService.getCustomerOrderById(customerOrderId);
		
		Cart cart=customerOrder.getCart();
		cartItemService.removeAllCartItems(cart);
		customerOrderService.deleteCustomerOrderById(customerOrderId);
		
		return "redirect:/admin/customerOrder";
	}
	
	
	
	@RequestMapping("/customerOrder/productList/{customerOrderId}")
	public String getCustomerOrderProduct(@PathVariable("customerOrderId")long customerOrderId,Model model){
		
		
		CustomerOrder customerOrder=customerOrderService.getCustomerOrderById(customerOrderId);
		
		
		//List<CartItem> cartItems=customerOrder.getCart().getCartItems();
		
		
		model.addAttribute("order",customerOrder);
		
		return "orderDetails";
	}
	
	
	
	
	@RequestMapping("/customerMessages/{pageNumber}")
	public String customerMessage(@PathVariable Integer pageNumber,Model model){
		
		
		
		
		
		
      Page<CustomerContact> page=customerContactService.getAllCustomerMessage(pageNumber);
		
		int currentPageNumber=page.getNumber()+1;
		int beginIndex=Math.max(1, currentPageNumber-5);
		int endIndex=Math.min(beginIndex+10, page.getTotalPages());
		
		
		
      List<CustomerContact> customerContacts=new ArrayList<>();
		
		
		
		for (CustomerContact contact : page) {
			customerContacts.add(contact);
		}
		
		
		if (customerContacts.size()==0) {
			model.addAttribute("msg","No Customer Message To show");
		}
		
		model.addAttribute("customerContacts",customerContacts);
		model.addAttribute("totalPages",page.getTotalPages());
		model.addAttribute("currentPageNumber",currentPageNumber);
		model.addAttribute("beginIndex",beginIndex);
		model.addAttribute("endIndex",endIndex);
		
		
		return "customerMessage";
	}
	
	
	@RequestMapping("/customerMessages/deleteMessage")
	public String customerMessageDelete(@RequestParam("customerMessageId")int customerMessageId,@RequestParam("currentPageNumber")int currentPageNumber){
		
		
		
		
		customerContactService.deleteMessageById(customerMessageId);
		
     
		
		
		return "redirect:/admin/customerMessages/"+currentPageNumber;
	}
	
	
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		ModelAndView modelAndView=new ModelAndView();
		CustomError error=new CustomError();
	
		
		error.setMessage("Có lỗi xảy ra, vui lòng kiểm tra lại!");
		modelAndView.addObject("customError", error);
		modelAndView.setViewName("error_page");
		
		System.out.println(ex);
		
		return modelAndView;
	}
	
}
