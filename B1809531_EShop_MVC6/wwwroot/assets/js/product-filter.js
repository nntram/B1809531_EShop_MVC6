$(document).ready(function () {

    const params = new Proxy(new URLSearchParams(window.location.search), {
        get: (searchParams, prop) => searchParams.get(prop),
    });

    let brand = params.brand;
    let category = params.category;

    if (brand) {
        var brandid = "#brand-" + brand
        $('.sidebar__item#brand ul li a').removeClass("active")
        $(brandid).addClass("active")
    }

    if (category) {
        var catid = "#cat-" + category
        $('.sidebar__item#cat ul li a').removeClass("active")
        $(catid).addClass("active")
    }

    $.fn.filterFunction = function (data) {
        $.ajax({
            url: "/Home/GetOnePage",
            datatype: "json",
            type: "GET",
            data: data,
            async: true,
            success: function (results) {
                $("#_listContainer").html("")
                $("#_listContainer").html(results)

            },
            error: function (xhr) {
                alert('error')
            }
        })
    }

    $('a[id^="cat-"]').click(function () {
        var id = this.dataset.id
        var itemid = "#" + this.id
        $('.sidebar__item#cat ul li a').removeClass("active")
        $(itemid).addClass("active")

        var data = $.fn.getDataFilter()
        $.fn.filterFunction(data)
    })

    $('a[id^="brand-"]').click(function () {
        var id = this.dataset.id
        var itemid = "#" + this.id
        $('.sidebar__item#brand ul li a').removeClass("active")
        $(itemid).addClass("active")

        var data = $.fn.getDataFilter()
        $.fn.filterFunction(data)

    })

    $.fn.getDataFilter = function () {
        var brand = $('.sidebar__item#brand ul li a.active').data('id');
        var cat = $('.sidebar__item#cat ul li a.active').data('id');
        var order = $(".nice-select .option.selected").data('value');

        var data = {
            brand: brand,
            category: cat,
            orderBy: order
        }

        return data;
    }

    $(".filter__sort .nice-select .option").click(function () {
        var orderValue = this.dataset.value

        var data = $.fn.getDataFilter()
        //gán lại orderBy vì .option.selected thay đổi sau khi click
        data.orderBy = orderValue

        $.fn.filterFunction(data)
    })


})