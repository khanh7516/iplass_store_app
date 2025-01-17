package storeApp.product.util;

import org.iplass.mtp.entity.BinaryReference;
import org.iplass.mtp.entity.Entity;
import org.iplass.mtp.web.template.TemplateUtil;

public class URLHelper {
	
	private final static String PACKAGE_URL_ROOT = "/store-app/";
	private final static String PRODUCT_DETAIL_URL_PATH = PACKAGE_URL_ROOT + "product-detail?id=%s";
	private final static String CATEGORY_PAGE_URL_PATH = PACKAGE_URL_ROOT + "ProductListCommand?idCategory=%s&page=%s";
	private final static String BINARY_RESOUCE_URL_PATH = PACKAGE_URL_ROOT + "resource/bin?id=%d&type=%s";

	public static String getProductDetailPath(String productId) {
		return TemplateUtil.getTenantContextPath() + String.format(PRODUCT_DETAIL_URL_PATH, productId);
	}
	
	public static String getProductByCategoryPath(String categoryId, String page) {
		return TemplateUtil.getTenantContextPath() + String.format(CATEGORY_PAGE_URL_PATH, categoryId, page);
	}
	
	public static String getProductImageResource(Entity product, String type) {
		BinaryReference br = product.getValue("productImage");
	    if (br == null) {
	        return TemplateUtil.getStaticContentPath() + "/images/defaultImageForProduct.png";
	    }
	    return TemplateUtil.getTenantContextPath() + getBinaryResoucePath(br.getLobId(), type);
		
	}
	
	private static String getBinaryResoucePath(long lobId, String type) {
		return String.format(BINARY_RESOUCE_URL_PATH, lobId, type);
	}	
}
