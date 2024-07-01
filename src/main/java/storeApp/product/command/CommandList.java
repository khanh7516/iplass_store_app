package storeApp.product.command;

import org.iplass.mtp.command.annotation.MetaDataSeeAlso;

@MetaDataSeeAlso({ 
	storeApp.product.command.ProductListCommand.class,
	storeApp.product.command.DetailProductCommand.class,
	storeApp.product.command.HomePageCommand.class,
	storeApp.product.command.UserCategoryWebApi.class,
	storeApp.product.command.resource.DownloadBinaryCommand.class
})
public class CommandList {

}
