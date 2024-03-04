package com.model2.mvc.purchase.controller;

import com.model2.mvc.framework.Action;
import com.model2.mvc.purchase.domain.Purchase;
import com.model2.mvc.purchase.dto.request.UpdatePurchaseRequestDTO;
import com.model2.mvc.purchase.service.PurchaseService;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component("updatePurchaseAction")
public class UpdatePurchaseAction extends Action {
    private final PurchaseService purchaseService;

    public UpdatePurchaseAction(PurchaseService purchaseService) {
        this.purchaseService = purchaseService;
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int tranNo = Integer.parseInt(request.getParameter("tranNo"));
        String buyerId = request.getParameter("buyerId");
        String paymentOption = request.getParameter("paymentOption");
        String receiverName = request.getParameter("receiverName");
        String receiverPhone = request.getParameter("receiverPhone");
        String divyAddr = request.getParameter("receiverAddr");
        String divyRequest = request.getParameter("receiverRequest");
        String divyDate = request.getParameter("divyDate");

        UpdatePurchaseRequestDTO requestDTO = new UpdatePurchaseRequestDTO().builder()
                .tranNo(Integer.parseInt(request.getParameter("tranNo")))
                .buyerId(request.getParameter("buyerId"))
                .paymentOption(request.getParameter("paymentOption"))
                .receiverName(request.getParameter("receiverName"))
                .receiverPhone(request.getParameter("receiverPhone"))
                .divyAddr(request.getParameter("receiverAddr"))
                .divyRequest(request.getParameter("receiverRequest"))
                .divyDate(request.getParameter("divyDate"))
                .build();


        Purchase result = this.purchaseService.updatePurchase(requestDTO);

        request.setAttribute("purchaseData", result);
        return "forward:/purchase/updatePurchaseResult.jsp"; // addPurchaseResult jsp
    }
}
