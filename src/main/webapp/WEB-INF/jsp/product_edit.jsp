<%--
    Document   : product_edit
    Author     : Andrey Svininykh (svininykh@gmail.com)
    Copyright  : Nord Trading Network
    License    : Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0.html)
--%>

<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<stripes:layout-render name="/WEB-INF/jsp/common/layout_main.jsp"
                       title="Product Edit"
                       pageid="ProductEdit">

    <stripes:layout-component name="button.return">
        <sdynattr:link href="/Presentation.action"
                       class="ui-btn ui-corner-all ui-icon-home ui-btn-icon-notext">
            <stripes:label name="label.home" />
        </sdynattr:link>          
        <sdynattr:link href="/CategoryProductList.action"
                       class="ui-btn ui-corner-all ui-icon-bars ui-btn-icon-left"
                       data-prefetch="true">
            <stripes:param name="category.id" value="${actionBean.product.productCategory.id}"/>
            <c:out value="${actionBean.product.productCategory.name}"/>
        </sdynattr:link>           
    </stripes:layout-component>

    <stripes:layout-component name="header.title">
        <stripes:label name="label.ProductEdit" />
    </stripes:layout-component>

    <stripes:layout-component name="button.action">
        <a href="#delete_product" 
           data-rel="popup" 
           data-position-to="window" 
           data-transition="pop" 
           class="ui-btn ui-corner-all ui-icon-delete ui-btn-icon-left ui-btn-b ui-shadow">
            <stripes:label name="label.delete" />
        </a>
        <div data-role="popup" 
             id="delete_product" 
             data-overlay-theme="b" data-theme="b" 
             data-dismissible="false" style="max-width:400px;">
            <div data-role="header" data-theme="a">
                <h1><stripes:label name="label.dialog.ProductDelete" /></h1>
            </div>
            <div role="main" class="ui-content">
                <h3 class="ui-title">
                    <c:out value="${actionBean.product.name}"/>
                </h3>
                <p><stripes:label name="label.ask.ProductDelete" /></p>
                <stripes:form action="/ProductChange.action?delete">
                    <div>
                        <stripes:hidden name="product.id" value="${actionBean.product.id}"/>
                        <stripes:hidden name="product.name" value="${actionBean.product.name}"/>
                    </div>
                    <sdynattr:submit name="yes" data-theme="a" data-icon="check"/>                    
                </stripes:form>
                <a href="#" 
                   class="ui-btn ui-corner-all ui-icon-forbidden ui-btn-icon-left ui-btn-b ui-shadow" 
                   data-rel="back" 
                   data-transition="flow">
                    <stripes:label name="no" />
                </a>                
            </div>
        </div>        
    </stripes:layout-component>

    <stripes:layout-component name="content">
        <stripes:errors />
        <stripes:messages />
        <stripes:form action="/ProductChange.action?update">
            <div>
                <stripes:hidden name="product.id" value="${actionBean.product.id}"/>
                <stripes:hidden name="product.productCategory.id" value="${actionBean.product.productCategory.id}"/>
                <stripes:hidden name="product.productCategory.name" value="${actionBean.product.productCategory.name}"/>
                <stripes:hidden name="currentCode" value="${actionBean.product.code}"/>
            </div>
            <ul data-role="listview" data-inset="true">  
                <li class="ui-field-contain">
                    <stripes:label name="label.Product.name" for="productName" />
                    <input name="product.name" id="productName" type="text"
                           placeholder="${actionBean.getLocalizationKey("label.ProductName.enter")}" 
                           value="${actionBean.product.name}"
                           data-clear-btn="true">
                </li>
                <li class="ui-field-contain">
                    <stripes:label name="label.Product.code" for="productCode" />
                    <input name="product.code" id="productCode" type="text"
                           placeholder="${actionBean.getLocalizationKey("label.ProductCode.enter")}"
                           value="${actionBean.product.code}"
                           data-clear-btn="true">
                </li>
                <li class="ui-field-contain">
                    <stripes:label name="label.Product.priceBuy" for="productBuyPrice"/>
                    <input name="product.priceBuy" id="productBuyPrice" type="number"
                           placeholder="${actionBean.getLocalizationKey("label.ProductBuyPrice.enter")}"
                           step="0.01"
                           value="${actionBean.product.priceBuy}"
                           data-clear-btn="true">
                </li>                
                <li class="ui-field-contain">
                    <stripes:label name="label.Product.priceSell" for="productSellPrice"/>
                    <input name="product.priceSell" id="productSellPrice" type="number"
                           placeholder="${actionBean.getLocalizationKey("label.ProductSellPrice.enter")}"
                           step="0.01"
                           value="${actionBean.product.priceSell}"
                           data-clear-btn="true">
                </li>
                <li class="ui-body ui-body-b">
                    <fieldset class="ui-grid-a">
                        <div class="ui-block-a">
                            <sdynattr:submit name="update" data-theme="a"/>
                        </div>
                        <div class="ui-block-b">
                            <sdynattr:reset name="clear" data-theme="b"/>
                        </div>
                    </fieldset>
                </li>
            </ul>
        </stripes:form>

    </stripes:layout-component>

    <stripes:layout-component name="footer">

    </stripes:layout-component>
</stripes:layout-render>