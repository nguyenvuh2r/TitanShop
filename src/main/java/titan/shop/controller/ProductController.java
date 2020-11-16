package titan.shop.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import titan.shop.exception.CustomError;
import titan.shop.model.Product;
import titan.shop.model.ProductBrand;
import titan.shop.model.ProductCategories;
import titan.shop.model.ProductVariant;
import titan.shop.service.ProductBrandService;
import titan.shop.service.ProductCategoriesService;
import titan.shop.service.ProductService;


@Controller
@RequestMapping("/product")
public class ProductController  implements HandlerExceptionResolver{

	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductCategoriesService productCategoriesService;
	
	@Autowired
	private ProductBrandService productBrandService;
	
	@RequestMapping("/productList/{productCategory}/{pageNumber}")
	public String getProductByCategory(@PathVariable("pageNumber")int pageNumber,@PathVariable("productCategory")String productCategory,Model model){
		
		
		
		Page<Product> page=productService.getAllProduct(pageNumber);
		
		
		List<Product> products=new ArrayList<>();
		
		for (Product product : page) {
			products.add(product);
		}
		
		int currentPageNumber=page.getNumber()+1;
		int beginIndex=Math.max(1, currentPageNumber-5);
		int endIndex=Math.min(beginIndex+10, page.getTotalPages());
		
		if (products.size()==0) {
			model.addAttribute("msg","No product to show");
		}
		
		model.addAttribute("products",products);
		model.addAttribute("productCategory",productCategory);
		model.addAttribute("totalPages",page.getTotalPages());
		model.addAttribute("currentPageNumber",currentPageNumber);
		model.addAttribute("beginIndex",beginIndex);
		model.addAttribute("endIndex",endIndex);
		
		return "productList";
	}

	@RequestMapping(value="/productList/{productCategory}/{pageNumber}",method=RequestMethod.POST)
	public String getProductBySearch(@RequestParam("searchTerm")String searchTerm,@PathVariable("pageNumber")int pageNumber,@PathVariable("productCategory")String productCategory,Model model){
		
		
		
		Page<Product> page=productService.getAllProduct(1);
		
		List<Product> products=new ArrayList<>();
		
		for (Product product : page) {
			products.add(product);
		}
		
		if (products.size()==0) {
			model.addAttribute("msg","No product to show");
		}
		
		int currentPageNumber=page.getNumber()+1;
		int beginIndex=Math.max(1, currentPageNumber-5);
		int endIndex=Math.min(beginIndex+10, page.getTotalPages());
		
		
		model.addAttribute("products",products);
		model.addAttribute("productCategory",productCategory);
		model.addAttribute("totalPages",page.getTotalPages());
		model.addAttribute("currentPageNumber",currentPageNumber);
		model.addAttribute("beginIndex",beginIndex);
		model.addAttribute("endIndex",endIndex);
		
		
		return "productList";
	}
	
	@RequestMapping("/productList")
	public String getAllProduct(Model model){
		
		List<Product> products=productService.getAllProduct();
		model.addAttribute("products",products);
		
		return "productList";
	}
	
	
	@RequestMapping("/viewProduct/{productId}")
	public String ProductDetailPage(@PathVariable("productId")long productId, Model model){
		
		Product product=productService.getProductById(productId);
		
		
		model.addAttribute("product",product);
		model.addAttribute("search","search");
		return "productDetail";
	}
	
	@RequestMapping("rest/categories/{categoriesId}/brand")
	@ResponseBody
	public List<ProductBrand> getCategories(@PathVariable("categoriesId")int categoriesId) {
		
		ProductCategories categories = productCategoriesService.getOne(categoriesId);
		
		Set<ProductBrand> brandList = categories.getProductBrand();

		return new ArrayList<>(brandList);
	}
	
	@RequestMapping("rest/categories/{categoriesId}/variant")
	@ResponseBody
	public List<ProductVariant> getVariants(@PathVariable("categoriesId")int categoriesId) {
		
		ProductCategories categories = productCategoriesService.getOne(categoriesId);
		
		Set<ProductVariant> variantList = categories.getProductVariant();

		return new ArrayList<>(variantList);
	}
	
	@RequestMapping("rest/{productId}/variant")
	@ResponseBody
	public String getProductVariants(@PathVariable("productId")long productId) {
		
		Product product = productService.getProductById(productId);
		
		String variant = product.getVariants();

		return variant;
	}
	
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		ModelAndView modelAndView=new ModelAndView();
		CustomError error=new CustomError();
		
		error.setMessage("Your request is not valid.Please Enter a valid request.");
		modelAndView.addObject("customError", error);
		modelAndView.setViewName("error_page");
		
		System.out.println(ex);
		
		return modelAndView;
	}
}
