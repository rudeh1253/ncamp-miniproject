package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.domain.Product;

public class AddPurchaseViewAction extends PurchaseAction {
    private ProductService productService;
    
    public AddPurchaseViewAction() {
        this.productService = ProductService.getInstance();
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Product productToPurchase = this.productService.getProduct(Integer.parseInt(request.getParameter("prod_no")));
        
        request.setAttribute("productToPurchase", productToPurchase);
        request.setAttribute("loginUser", request.getSession().getAttribute("user"));
        return "forward:/purchase/addPurchaseView.jsp";
    }
}
