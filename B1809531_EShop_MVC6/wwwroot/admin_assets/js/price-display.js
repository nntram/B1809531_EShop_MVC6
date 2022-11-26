$(document).ready(function () {
   

    $.fn.priceDisplay = function (idValue, idDisplay) {       
        const value = $(idValue).val();
        // try to convert to an integer
        const parsed = parseInt(value);
        // check if the integer conversion worked and matches the expected value
        if (!isNaN(parsed)) {
            // update the value
            $(idDisplay).html(new Intl.NumberFormat('en-US').format(value)) ;
        }
        else {
            $(idDisplay).html("Không thể chuyển đổi")
        }

    }


    $.fn.priceDisplay("#Productprice", "#price")
    $.fn.priceDisplay("#Productsaleprice", "#salePrice")

    $('#Productprice').keyup(function () {
        $.fn.priceDisplay("#Productprice", "#price")
    })

    $('#Productsaleprice').keyup(function () {
        $.fn.priceDisplay("#Productsaleprice", "#salePrice")
    })

})
