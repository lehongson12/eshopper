$ ->
  $("#categories").dataTable
    processing: true
    serverSide: true
    ajax: $("#categories").data("source")
    pagingType: "simple_numbers"
    columns: [
      {data: "name",bSortable: true, bSearchable: true},
      {data: "description", bSortable: false, bSearchable:false},
      {data: "actions", bSortable: false, bSearchable:false}
    ]
