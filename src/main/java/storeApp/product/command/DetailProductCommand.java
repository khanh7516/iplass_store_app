package storeApp.product.command;

import java.util.ArrayList;
import java.util.List;

import org.iplass.gem.command.Constants;
import org.iplass.mtp.command.Command;
import org.iplass.mtp.command.RequestContext;
import org.iplass.mtp.command.annotation.CommandClass;
import org.iplass.mtp.command.annotation.CommandConfig;
import org.iplass.mtp.command.annotation.action.ActionMapping;
import org.iplass.mtp.command.annotation.action.Result;
import org.iplass.mtp.command.annotation.action.Result.Type;
import org.iplass.mtp.entity.query.Limit;
import org.iplass.mtp.entity.query.condition.predicate.Equals;

import storeApp.product.dao.EntityDaoHelper;
import storeApp.product.entity.CategoryProduct;
import storeApp.product.entity.Product;
import storeApp.product.entity.ProductImage;

@ActionMapping(name = "store-app/product-detail", 
displayName = "product detail", 
privileged = true, 
result = @Result(type = Type.JSP, value = "/jsp/store-app/ProductsDetailPage.jsp", 
templateName = "store-app/DetailProductsPage"), 
command = @CommandConfig(commandClass = DetailProductCommand.class))
@CommandClass(name = "store-app/product-detail", displayName = "product-detail")
public class DetailProductCommand implements Command {

	private final String PARAM_PRODUCT_ID = "id";
	@SuppressWarnings("unused")
	private final String PRODUCT_CATEGORY_OID = Product.CODE_PRODUCT + "." + CategoryProduct.OID;
	private final String PRODUCT_IMAGE_OID = ProductImage.OID;
	private final int RESULT_LIMIT = 15;
	private final int IMG_LIMIT = 4;

	@Override
	public String execute(RequestContext request) {
		String productId = request.getParam(PARAM_PRODUCT_ID);
		// 対象カテゴリの商品一覧の検索
		Product product = EntityDaoHelper.load(Product.DEFINITION_NAME, productId);
		if (product == null) {
			return Constants.CMD_EXEC_SUCCESS;
		}
		request.setAttribute("productInfo", product);

		
//		 CategoryProduct category = product.getIdCategory(); 
//		 Equals categoryCond = new Equals(PRODUCT_CATEGORY_OID, category.getOid());
//		Equals categoryCond = new Equals(PRODUCT_CATEGORY_OID, product.getIdCategory().getOid());
		
		System.out.print(product.getCategory());
		System.out.print(product.getName());
		System.out.print(product.getProductImg());
		
		// 検索処理の実行
		Limit limit = new Limit(RESULT_LIMIT);
		String[] propertis = new String[] { Product.OID, Product.NAME, Product.PRICE, Product.PRODUCT_IMG};
		List<Product> productList = EntityDaoHelper.searchDistinctEntity(Product.DEFINITION_NAME, null, limit, propertis);
		if (productList.size() > 0) {
			request.setAttribute("productList", productList);
		}
		
		Limit imgLimit = new Limit(IMG_LIMIT);
		String[] imgProperties = new String[] { ProductImage.OID, ProductImage.PRODUCT_IMAGE};
		List<ProductImage> allProductImages = EntityDaoHelper.searchDistinctEntity(ProductImage.DEFINITION_NAME, null, imgProperties);
//		List<ProductImage> imageList = new ArrayList<ProductImage>();
		
//		Equals imgEquals = new Equals(PRODUCT_IMAGE_OID, product.getPro);
//		
//		List<ProductImage> imageList = EntityDaoHelper.searchDistinctEntity(ProductImage.DEFINITION_NAME, imgEquals, imgLimit, imgProperties);
//		if (imageList.size() > 0) {
//			
//		}

		
		request.setAttribute("imageList", product.getProductImg());
		

		return Constants.CMD_EXEC_SUCCESS;
	}
	
}
