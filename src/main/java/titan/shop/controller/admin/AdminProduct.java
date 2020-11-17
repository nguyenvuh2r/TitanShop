package titan.shop.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
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
import titan.shop.model.ProductVariant;
import titan.shop.service.ProductBrandService;
import titan.shop.service.ProductCategoriesService;
import titan.shop.service.ProductService;
import titan.shop.service.ProductVariantService;
import titan.shop.validator.ProductFormValidator;

@Controller
@RequestMapping("/admin")
public class AdminProduct implements HandlerExceptionResolver {

	private Path path;

	@Autowired
	private ProductService productService;

	@Autowired
	private ProductBrandService productBrandService;

	@Autowired
	private ProductCategoriesService productCategoriesService;

	@Autowired
	private ProductFormValidator productFormValidator;
	@Autowired
	private ProductCategoriesService pdc;
	@Autowired
	private ProductVariantService pdv;
	/* Handle Product */
	/* Section of variants */
	
	@RequestMapping("/productvariants/addproductvariants")
	public String addProducVariants(ModelMap model) {
		List<ProductCategories> categoriesList = productCategoriesService.getAll();
		
		model.addAttribute("categoriesList", categoriesList);
		model.addAttribute("productvariants", new ProductVariant());
		return "addproductvariants";

	}
	@RequestMapping(value = "/productvariants/addproductvariants",method = RequestMethod.POST)
	public String addProducVariants(ModelMap model,@ModelAttribute(name = "productvariants") ProductVariant pd) {
		ProductCategories p = pdc.getOne(pd.getProductCategories().getProductCategoriesId());
		pd.setProductCategories(p);
		try {
			pdv.save(pd);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}	
		return "redirect:/admin/productvariants/1";

	}
	@RequestMapping("/productvariants/updateproductvariants/{id}")
	public String updateProducVariants(ModelMap model,@PathVariable("id") int id) {
		List<ProductCategories> categoriesList = productCategoriesService.getAll();
		
		model.addAttribute("categoriesList", categoriesList);
		model.addAttribute("productvariants", pdv.getOne(id));
		return "updateproductvariants";

	}
	@RequestMapping(value = "/productvariants/updateproductvariants",method = RequestMethod.POST)
	public String updateProducVariants(ModelMap model,@ModelAttribute("productvariants") ProductVariant pv) {
		try {
			ProductCategories p = pdc.getOne(pv.getProductCategories().getProductCategoriesId());
			pv.setProductCategories(p);
			pdv.save(pv);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return "redirect:/admin/productvariants/1";

	}
	@RequestMapping("/productvariants/deleteproductvariants/{id}")
	public String deleteProducVariants(ModelMap model,@PathVariable("id") int id, HttpServletRequest request)
			throws Exception {
			try {
				pdv.delete(pdv.getOne(id));
			} catch (Exception e) {
				System.out.println("------------------------------------------------------------------");
				throw new DatabaseForeignKeyException();
			}
		return "redirect:/admin/productvariants/1";

	}
	
	/* End section */
	/* Section of product categories */

	@RequestMapping("/productcategories/addproductcategories")
	public String addProductCategories(ModelMap model) {
		model.addAttribute("productcategories", new ProductCategories());
		return "addproductcategories";

	}

	@Autowired
	private ProductCategoriesService pdvc;

	@RequestMapping(value = "/productcategories/addproductcategories", method = RequestMethod.POST)
	public String addProductCategories(ModelMap model,
			@ModelAttribute(name = "productcategories") ProductCategories pc) {
		try {
			pdvc.save(pc);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "redirect:/admin/productcategories/1";

	}

	@RequestMapping("/productcategories/updateproductcategories/{id}")
	public String updateProductCategories(ModelMap model,@PathVariable(name = "id") int id) {

		model.addAttribute("productcategories", pdvc.getOne(id));
		return "updateproductcategories";

	}
	@RequestMapping("/productcategories/updateproductcategories")
	public String updateProductCategories(ModelMap model,@ModelAttribute("productcategories") ProductCategories p) {
		try {
			pdvc.save(p);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

		return "redirect:/admin/productcategories/1";

	}
	@RequestMapping("/productcategories/deleteproductcategories/{id}")
	public String deleteProductCategories(@PathVariable(name = "id") int id, HttpServletRequest request) throws Exception
	{
		try {
			pdvc.delete(pdvc.getOne(id));
		} catch (Exception e) {
			System.out.println("------------------------------------------------------------------");
			throw new DatabaseForeignKeyException();		
		}
		return "redirect:/admin/productcategories/1";
	}
	/* End Section */

	/* Section of Product */
	@RequestMapping("/product/addProduct")
	public String addProduct(ModelMap model) {

		Product product = new Product();
		product.setProductStatus("Brand New");
		
		List<ProductCategories> categoriesList = productCategoriesService.getAll();

		List<ProductBrand> brandsList = productBrandService.getAll();

		model.addAttribute("categoriesList", categoriesList);
		model.addAttribute("brandsList", brandsList);
		model.addAttribute("product", product);
		return "addProduct";

	}

	@RequestMapping(value = "/product/addProduct", method = RequestMethod.POST)
	public String addProductPost(@Valid @ModelAttribute("product") Product product, BindingResult result, Model model,
			HttpServletRequest request) {

		try {
			if (result.hasErrors()) {
				return "addProduct";
			}
			product.setProductCategories(product.getProductCategories());
			productService.addProduct(product);
			MultipartFile productImage=product.getProductImage();
			String rootDir=request.getSession().getServletContext().getRealPath("/");
			path=Paths.get(rootDir+"\\WEB-INF\\resources\\images\\products\\" + product.getProductId() + ".jpg");

			if (productImage != null && !productImage.isEmpty()) {
				try {
					productImage.transferTo(new File(path.toString()));

					// System.out.println("IMage Save at:"+path.toString());
				} catch (Exception e) {

					e.printStackTrace();
					throw new RuntimeException("Product image saving failed!", e);
				}
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

		return "redirect:/admin/productManagement/1";
	}

	@RequestMapping("/product/updateProduct/{productId}")
	public String updateProduct(@PathVariable("productId") long productId, Model model) {
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

			try {

				productImage.transferTo(new File(path.toString()));

				System.out.println("IMage Save at:"+path.toString());
			} catch (Exception e) {

				e.printStackTrace();
				throw new RuntimeException("Product image saving failed", e);
			}
		}

		productService.addProduct(product);

		return "redirect:/admin/productManagement/1";
	}

	@RequestMapping("/product/deleteProduct/{productId}")
	public String deleteProduct(@PathVariable("productId") long productId, Model model, HttpServletRequest request)
			throws Exception {

		try {
			String rootDir = request.getSession().getServletContext().getRealPath("/");
			path = Paths.get(rootDir + "\\WEB-INF\\resources\\images\\" + productId + ".png");

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

	/* End Section */
	/* Section of product brand */
	@RequestMapping("product/addBrand")
	public String addBrand(ModelMap md) {
		List<ProductCategories> categoriesList = productCategoriesService.getAll();
		
		md.addAttribute("categoriesList", categoriesList);
		md.addAttribute("brand", new ProductBrand());
		return "addBrand";
	}

	@RequestMapping(value = "product/addBrand", method = RequestMethod.POST)
	public String addBrands(ModelMap md, @ModelAttribute("brand") ProductBrand br) {

		ProductCategories p = productCategoriesService.getOne(br.getProductCategories().getProductCategoriesId());
		br.setProductCategories(p);
		try {
			productBrandService.save(br);
		} catch (Exception e) {
			e.printStackTrace();

		}

		return "redirect:/admin/productbrand/1";
	}

	@RequestMapping("productBrand/updateProductBrand/{id}")
	public String updateProductBrand(ModelMap md, @PathVariable("id") int id) {
		ProductBrand p = productBrandService.getOne(id);
		
		List<ProductCategories> categoriesList = productCategoriesService.getAll();
		
		md.addAttribute("categoriesList", categoriesList);
		md.addAttribute("brand", p);
		return "updateBrand";
	}

	@RequestMapping("productBrand/updateProductBrand")
	public String updateProductBrands(ModelMap md, @ModelAttribute(name = "brand") ProductBrand pd) {
		ProductCategories p = productCategoriesService.getOne(pd.getProductCategories().getProductCategoriesId());
		pd.setProductCategories(p);
		try {
			productBrandService.save(pd);
		} catch (Exception e) {
			e.printStackTrace();

		}
		return "redirect:/admin/productbrand/1";
	}

	@RequestMapping("/productBrand/deleteProductBrand/{id}")
	public String deleteProductBrand(ModelMap md, @PathVariable("id") int id, HttpServletRequest request) throws Exception {
		try {
			ProductBrand p = productBrandService.getOne(id);
			productBrandService.delete(p);
			
		} catch (Exception e) {
			System.out.println("------------------------------------------------------------------");
			throw new DatabaseForeignKeyException();
		}
		
		return "redirect:/admin/productbrand/1";
	}

	/* End section */
	/* Handle error request */
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		ModelAndView modelAndView = new ModelAndView();
		CustomError error = new CustomError();
		if (ex instanceof DatabaseForeignKeyException) {
			error.setMessage(
					"Có lỗi xảy ra, vui lòng kiểm tra lại!");
			modelAndView.addObject("customError", error);
			modelAndView.setViewName("error_page");
			return modelAndView;
		}
		
		error.setMessage("Có lỗi xảy ra, vui lòng kiểm tra lại!.");
		modelAndView.addObject("customError", error);
		modelAndView.setViewName("error_page");

		return modelAndView;
	}

	/* end section */
	
	/* Get all list from categoryList and variantList */
	@ModelAttribute(name = "categoryList")
	public Map getProduct() {
		Map<Integer, String> categoryList = new LinkedHashMap<Integer, String>();

		List<ProductCategories> cart = pdc.getAll();

		for (int i = 0; i < cart.size(); i++) {
			categoryList.put(cart.get(i).getProductCategoriesId(), cart.get(i).getName());
		}
		return categoryList;
	}

	@ModelAttribute(name = "variantlist")
	public Map getVariant() {
		Map<Integer, String> variantList = new LinkedHashMap<Integer, String>();
		List<ProductVariant> variant = pdv.getAll();
		for (int i = 0; i < variant.size(); i++) {
			variantList.put(variant.get(i).getProductVariantsId(), variant.get(i).getVariant());
		}
		return variantList;
	}

	// end section

	/*
	 * @InitBinder public void initBinder(WebDataBinder binder) {
	 * binder.addValidators(productFormValidator); }
	 */
}
