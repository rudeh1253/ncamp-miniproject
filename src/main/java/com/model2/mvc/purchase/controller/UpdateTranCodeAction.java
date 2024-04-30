package com.model2.mvc.purchase.controller;

import com.model2.mvc.purchase.domain.TranStatusCode;
import com.model2.mvc.purchase.dto.request.UpdateTranCodeRequestDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateTranCodeAction extends PurchaseAction {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int tranNo = Integer.parseInt(request.getParameter("tranNo"));
        String tranCode = request.getParameter("tranCode");

        super.purchaseService.updateTranCode(new UpdateTranCodeRequestDTO(tranNo,
                                                                          TranStatusCode.getTranCode(tranCode)));

        return "redirect:/listPurchase.do";
    }
}