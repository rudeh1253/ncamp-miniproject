package com.model2.mvc.product.controller.editor;

import org.springframework.stereotype.Component;

import java.beans.PropertyEditorSupport;

@Component
public class CategoryNoEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        if (text.equals("-1")) {
            this.setValue(null);
        } else {
            this.setValue(Integer.parseInt(text));
        }
    }
}
