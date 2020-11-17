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
		
		error.setMessage("Có lỗi xảy ra, vui lòng kiểm tra lại!");
		modelAndView.addObject("customError", error);
		modelAndView.setViewName("error_page");
		
		System.out.println(ex);
		
		return modelAndView;
	}
}
