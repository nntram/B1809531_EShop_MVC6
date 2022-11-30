$(document).ready(function () {    
    $.fn.filterFunction = function () {

        data = {}

        $.ajax({
            url: "/Admin/Products/GetOnePage",
            datatype: "json",
            type: "GET",
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

   
    $('a[id^="cat-"]').click(function () {
        alert('ok')
    })
   

})