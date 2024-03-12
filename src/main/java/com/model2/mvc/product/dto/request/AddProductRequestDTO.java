package com.model2.mvc.product.dto.request;

public class AddProductRequestDTO {
    private String fileName;
    private String manuDate;
    private int price;
    private String prodDetail;
    private String prodName;
    private int stock;
    private Integer categoryNo;

    public AddProductRequestDTO() {
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getManuDate() {
        return manuDate;
    }

    public void setManuDate(String manuDate) {
        this.manuDate = manuDate;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getProdDetail() {
        return prodDetail;
    }

    public void setProdDetail(String prodDetail) {
        this.prodDetail = prodDetail;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Integer getCategoryNo() {
        return categoryNo;
    }

    public void setCategoryNo(Integer categoryNo) {
        this.categoryNo = categoryNo;
    }

    @Override
    public String toString() {
        return "AddProductRequestDTO{" +
               "fileName='" +
               fileName +
               '\'' +
               ", manuDate='" +
               manuDate +
               '\'' +
               ", price=" +
               price +
               ", prodDetail='" +
               prodDetail +
               '\'' +
               ", prodName='" +
               prodName +
               '\'' +
               ", stock=" +
               stock +
               ", categoryNo=" +
               categoryNo +
               '}';
    }
}
