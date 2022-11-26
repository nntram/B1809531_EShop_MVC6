$(document).ready(function () {
    $.fn.setDataTable = function () {
        $("#dataTable").DataTable({
            "language": {
                "search": "<label class='font-weight-bold mb-0'>Tìm kiếm</label>",
                "zeroRecords": "Không tìm thấy dữ liệu phù hợp.",
                "emptyTable": "Không tìm thấy dữ liệu phù hợp.",
                "info": "Hiển thị từ _START_ đến _END_ trong số _TOTAL_ ",
                "infoEmpty": "Không có dữ liệu.",
                "infoFiltered": " - Lọc từ _MAX_ kết quả",
                "lengthMenu": '<label class="font-weight-bold">Số dòng hiể thị <select class = "custom-select custom-select-sm form-control form-control-sm">' +
                    '<option value="10">10</option>' +
                    '<option value="20">20</option>' +
                    '<option value="30">30</option>' +
                    '<option value="40">40</option>' +
                    '<option value="50">50</option>' +
                    '<option value="-1">Tất cả</option>' +
                    '</select> </label>',
                "paginate": {
                    "next": ">",
                    "previous": "<",
                    "first": "<<",
                    "last": ">>"
                },
                "stateSave": true,
            },

        })
    }
    $.fn.filterFunction = function () {

        let brandId = $("#brand").children(":selected").attr('value')
        let categoryId = $("#category").children(":selected").attr('value')

        let id = $("#product-nav>li>a.active").attr("id")
        let data = {
            brand: brandId,
            category: categoryId
        }

        if (id == "getHot") {
            data.isGetHot = true
        }
        if (id == "getOutOfStock") {
            data.isGetOutOfStock = true
        }
        if (id == "getNotInActive") {
            data.isGetNotInActive = true
        }

        $.ajax({
            url: "/Admin/Products/GetOnePage",
            datatype: "json",
            type: "POST",
            data: data,
            async: true,
            success: function (results) {
                $("#dataTable").DataTable().destroy()
                $("#listContainer").html("")
                $("#listContainer").html(results)

                $.fn.setDataTable()

            },
            error: function (xhr) {
                alert('error')
            }
        })
    }

    $.fn.changeNavFunction = function (id) {
        let data
        if (id == "#getAll") {
            data = {}
        }
        if (id == "#getHot") {
            data = { isGetHot: true }
        }
        if (id == "#getOutOfStock") {
            data = { isGetOutOfStock: true }
        }
        if (id == "#getNotInActive") {
            data = { isGetNotInActive: true }
        }

        $.ajax({
            url: "/Admin/Products/GetOnePage",
            datatype: "json",
            type: "POST",
            data: data,
            async: true,
            success: function (results) {
                $("#dataTable").DataTable().destroy()

                $("#listContainer").html("")
                $("#listContainer").html(results)

                $("#category").val("")
                $("#brand").val("")

                $("#product-nav>li>a.active").removeClass("active")
                $(id).addClass("active")

                $.fn.setDataTable()
            },
            error: function (xhr) {
                alert('error')
            }
        })
    }

    $.fn.setDataTable()

    $("#brand").change(function () {
        $.fn.filterFunction()
    })

    $("#category").change(function () {
        $.fn.filterFunction()
    })


    $("#getAll").click(function () {
        $.fn.changeNavFunction("#getAll")
    })

    $("#getHot").click(function () {
        $.fn.changeNavFunction("#getHot")
    })

    $("#getOutOfStock").click(function () {
        $.fn.changeNavFunction("#getOutOfStock")
    })

    $("#getNotInActive").click(function () {
        $.fn.changeNavFunction("#getNotInActive")
    })

})