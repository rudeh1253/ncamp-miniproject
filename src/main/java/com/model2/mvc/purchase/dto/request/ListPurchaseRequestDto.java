package com.model2.mvc.purchase.dto.request;

import com.model2.mvc.common.SearchCondition;
import com.model2.mvc.user.domain.User;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class ListPurchaseRequestDto {
    private Integer page;
    private Integer pageSize;
    private String searchKeyword;
    private SearchCondition searchCondition;
    private String menu;
    private User user;
}
