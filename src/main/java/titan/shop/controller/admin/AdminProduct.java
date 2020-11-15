package titan.shop.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import titan.shop.exception.CustomError;
import titan.shop.exception.DatabaseForeignKeyException;
import titan.shop.model.Product;
import titan.shop.model.ProductBrand;
import titan.shop.model.ProductCategories;
import titan.shop.service.ProductBrandService;
import titan.shop.service.ProductCategoriesService;
import titan.shop.service.ProductService;
import titan.shop.validator.ProductFormValidator;



@Controller
@RequestMapping("/admin")
public class AdminProduct implements HandlerExceptionResolver{

	private Path path;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductBrandService productBrandService;
	
	@Autowired
	private ProductCategoriesService productCategoriesService;
	
	@Autowired
	private ProductFormValidator productFormValidator;
	
	@RequestMapping("/product/addProduct")
	public String addProduct(Model model){
		
		
		
		Product product=new Product();
		product.setProductStatus("Brand New");
		model.addAttribute("product",product);
		return "addProduct";
	}
	
	
	@RequestMapping(value="/product/addProduct",method=RequestMethod.POST)
	public String addProductPost(@Valid@ModelAttribute("product")Product product,BindingResult result,Model model,HttpServletRequest request){
		
		try {
			if (result.hasErrors()) {
				return "addProduct";
			}
			
			
			
			
			
			
			
			
			productService.addProduct(product);
			
			MultipartFile productImage=product.getProductImage();
			String rootDir=request.getSession().getServletContext().getRealPath("/");
			path=Paths.get(rootDir+"\\WEB-INF\\resources\\images\\products\\" + product.getProductId() + ".jpg");
			
			if (productImage != null && !productImage.isEmpty()) {
				try {
					productImage.transferTo(new File(path.toString()));
					
					//System.out.println("IMage Save at:"+path.toString());
				} catch (Exception e) {
					
					e.printStackTrace();
					throw new RuntimeException("Product image saving failed",e);
				}
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return "redirect:/admin/productManagement/1";
	}
	
	
	@RequestMapping("/product/updateProduct/{productId}")
	public String updateProduct(@PathVariable("productId")long productId, Model model){
		Product product = productService.getProductById(productId);
		
		List<ProductCategories> categoriesList = productCategoriesService.getAll();
		
		List<ProductBrand> brandsList = productBrandService.getAll();
		
		model.addAttribute("categoriesList", categoriesList);
		model.addAttribute("brandsList", brandsList);
		model.addAttribute("product", product);
		return "updateProduct";
	}
	
	@RequestMapping(value="/product/updateProduct", method=RequestMethod.POST)
	public String updateProductPost(@ModelAttribute("product")Product product,BindingResult result,HttpServletRequest request){
		
		if (result.hasErrors()) {
			
			return "addProduct";
		}
		
		
		
		
		
		
		
		
		
		
		MultipartFile productImage=product.getProductImage();
		String rootDir=request.getSession().getServletContext().getRealPath("/");
		path=Paths.get(rootDir+"\\WEB-INF\\resources\\images\\products\\"+product.getProductId()+".jpg");
		
		
		if (productImage!=null && !productImage.isEmpty()) {
			
			//System.out.println("OKKKK--------------------");
			try {
				
				
				productImage.transferTo(new File(path.toString()));
				
				//System.out.println("IMage Save at:"+path.toString());
			} catch (Exception e) {
				
				e.printStackTrace();
				throw new RuntimeException("Product image saving failed",e);
			}
		}
		
		
		
		
		productService.addProduct(product);
		
		
		return "redirect:/admin/productManagement/1";
	}
	
	
	@RequestMapping("/product/deleteProduct/{productId}")
	public String deleteProduct(@PathVariable("productId")long productId,Model model,HttpServletRequest request) throws Exception{
		
		try {
			String rootDir=request.getSession().getServletContext().getRealPath("/");
			path=Paths.get(rootDir+"\\WEB-INF\\resources\\images\\"+productId+".png");
			
			if (Files.exists(path)) {
				
				try {
					Files.delete(path);
				} catch (IOException e) {
				
					e.printStackTrace();
					
					
				}
			}
			
			
			
			
			productService.deleteProduct(productId);
		} catch (Exception e) {
			
			System.out.println("------------------------------------------------------------------");
			throw new DatabaseForeignKeyException();
		}
		
		return "redirect:/admin/productManagement/1";
		
		
	}
	



	
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		ModelAndView modelAndView=new ModelAndView();
		CustomError error=new CustomError();
		if (ex instanceof DatabaseForeignKeyException) {
			
			
			
			error.setMessage("You can not delete a product until you clear customer order.In customer order this product exist.");
			modelAndView.addObject("customError", error);
			modelAndView.setViewName("error_page");
			return modelAndView;
		}
		
		
		
		error.setMessage("Your request is not valid.Please Enter a valid request.");
		modelAndView.addObject("customError", error);
		modelAndView.setViewName("error_page");
		System.out.println(ex);
		
		return modelAndView;
	}
	
	/*
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(productFormValidator);
	}
	*/
}
