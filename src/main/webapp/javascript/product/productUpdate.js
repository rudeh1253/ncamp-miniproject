function validateForm() {
    const prodNameForm = $("input[name=prodName]");
    const priceForm = $("input[name=price]");
    const stockForm = $("input[name=stock]");

    if (!prodNameForm.val()) {
        alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
        return false;
    }
    if (!priceForm.val()) {
        alert("������ �ݵ�� �Է��Ͽ��� �մϴ�.");
        return false;
    }
    if (!stockForm.val()) {
        alert("����� �ݵ�� �Է��Ͽ��� �մϴ�.");
        return false;
    }
    return true;
}

$(() => {
    const contextPath = $("body").data("context-path");

    $(".btn--submit").on("click", () => {
        if (validateForm()) {
            $("form[name=product-update-form]")
                .attr("action", `${contextPath}/products/update`)
                .attr("method", "POST")
                .trigger("submit");
        }
    });

    $(".btn--cancel").on("click", () => {
        history.go(-1);
    });

    const manuDateForm = $("#manu-date");
    manuDateForm.datepicker();
    manuDateForm
        .datepicker("option", "dateFormat", "yy-mm-dd");
});