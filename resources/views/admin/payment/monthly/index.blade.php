@extends('layout.master')

@section('title')
Simpanan Wajib
@endsection

@section('css')
<link rel="stylesheet" href="{{asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
<link rel="stylesheet" href="{{asset('plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}}">

@endsection

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Pembayaran</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item">Pembayaran</li>
                        <li class="breadcrumb-item active">Simpanan Wajib</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Data Simpanan Wajib</h3>

                    <div class="card-tools">
                        <button type="button" class="btn btn-primary btn-add-manual"><i class="fas fa-plus"></i> Tambah Simpanan</button>

                        {{-- <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">--}}
                        {{-- <i class="fas fa-minus"></i>--}}
                        {{-- </button>--}}
                        {{-- <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">--}}
                        {{-- <i class="fas fa-times"></i>--}}
                        {{-- </button>--}}
                    </div>
                </div>
                <div class="card-body">
                    {{-- <div class="table-responsive">--}}
                    <table id="user-table" width="100%" class="table table-bordered table-striped">
                        <thead class="text-center">
                            <tr>
                                <th rowspan="3" style="vertical-align: middle">Nama</th>
                                {{-- <th rowspan="3" width="10%" style="vertical-align: middle">Nomor Anggota</th>--}}
                                <th colspan="24">Bulan</th>
                                <th rowspan="3" style="vertical-align: middle">Sisa</th>
                                <th rowspan="3" style="vertical-align: middle">Ket</th>
                                <th rowspan="3" style="vertical-align: middle">Jumlah</th>
                                <th rowspan="3" style="vertical-align: middle">Jumlah</th>
                                <th rowspan="3" style="vertical-align: middle">Jumlah</th>
                            </tr>
                            <tr>
                                <th colspan="2">1</th>
                                <th colspan="2">2</th>
                                <th colspan="2">3</th>
                                <th colspan="2">4</th>
                                <th colspan="2">5</th>
                                <th colspan="2">6</th>
                                <th colspan="2">7</th>
                                <th colspan="2">8</th>
                                <th colspan="2">9</th>
                                <th colspan="2">10</th>
                                <th colspan="2">11</th>
                                <th colspan="2">12</th>
                            </tr>
                            <tr>
                                <th>TGL</th>
                                <th>JML</th>

                                <th>TGL</th>
                                <th>JML</th>

                                <th>TGL</th>
                                <th>JML</th>

                                <th>TGL</th>
                                <th>JML</th>

                                <th>TGL</th>
                                <th>JML</th>

                                <th>TGL</th>
                                <th>JML</th>

                                <th>TGL</th>
                                <th>JML</th>

                                <th>TGL</th>
                                <th>JML</th>

                                <th>TGL</th>
                                <th>JML</th>

                                <th>TGL</th>
                                <th>JML</th>

                                <th>TGL</th>
                                <th>JML</th>

                                <th>TGL</th>
                                <th>JML</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                    {{-- </div>--}}
                </div>
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>

<!-- Modal -->
<div class="modal fade" id="user-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-md modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><span id="action-modal"></span></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" id="user-form" data-id="" data-userId="">
                    @csrf
                    <div class="form-group">
                        <label>Tanggal Bayar<span class="text-danger">*</span> </label>
                        <input type="text" name="paid_at" class="form-control" id="paid_at" placeholder="">
                    </div>
                    <div class="form-group">
                        <label>Bulan Ke-<span class="text-danger">*</span> </label>
                        <input type="text" name="payment_month" class="form-control" id="payment_month" placeholder="" readonly>
                    </div>
                    {{-- <div class="form-group">--}}
                    {{-- <label>Tahun yang dibayar<span class="text-danger">*</span> </label>--}}
                    <input type="hidden" name="payment_year" class="form-control" id="payment_year" placeholder="">
                    {{-- </div>--}}
                    {{-- <div class="form-group">--}}
                    {{-- <label>Jumlah <span class="text-danger">*</span> </label>--}}
                    {{-- <input type="text" name="amount" class="form-control" id="amount" placeholder="">--}}
                    {{-- </div>--}}
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                <button type="button" id="btn_form" class="btn btn-primary"><i class="fa fa-save"></i> Save</button>
            </div>
        </div>
    </div>
</div>

<!-- /.content-wrapper -->
@endsection

@section('script')
<!-- DataTables  & Plugins -->
<script src="{{asset('plugins/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{asset('plugins/datatables-responsive/js/dataTables.responsive.min.js')}}"></script>
<script src="{{asset('plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/dataTables.buttons.min.js')}}"></script>
<script>
    $(document).ready(function() {
        // setInterval(function() {
        //     getpoin()
        // }, 2000);
        //getpoin();
        function getpoin() {
            console.log('test');
            const fomrdt = new FormData();
            fomrdt.append('_token', '{{csrf_token()}}');
            fetch("{{url('point/simpan-poin')}}", {
                method: 'POST',
                body: fomrdt
            }).then(res => res.json()).then(data => {

            });

        }
        $('#user-modal').on('shown.bs.modal', function(event) {
            $('#payment_month').daterangepicker({
                singleDatePicker: true,
                locale: {
                    format: 'MM',
                    autoUpdateInput: true,
                }
            });

            $('#paid_at').daterangepicker({
                singleDatePicker: true,
                locale: {
                    format: 'YYYY-MM-DD',
                    autoUpdateInput: true,
                }
            });

            // var rupiah = $('#amount');
            // rupiah.on('keyup', function(e){
            //     rupiah.val(formatRupiah(rupiah.val(), 'Rp. '));
            // });
        });

        var table = $("#user-table").DataTable({
            paging: true,
            processing: true,
            serverSide: true,
            scrollY: "50vh",
            scrollX: true,
            ajax: "{{route('admin.payment.monthly.ajax')}}",
            scrollCollapse: true,

            fixedColumns: true,
            fixedHeader: true,
            // responsive: true,
            // lengthChange: false,
            // autoWidth: true,
            columns: [{
                    data: 'name'
                },

                // 1
                {
                    data: 'monthly_payment.0.paid_at'
                },
                {
                    data: 'monthly_payment.0.amount'
                },

                // 2
                {
                    data: 'monthly_payment.1.paid_at'
                },
                {
                    data: 'monthly_payment.1.amount'
                },

                // 3
                {
                    data: 'monthly_payment.2.paid_at'
                },
                {
                    data: 'monthly_payment.2.amount'
                },

                // 4
                {
                    data: 'monthly_payment.3.paid_at'
                },
                {
                    data: 'monthly_payment.3.amount'
                },

                // 5
                {
                    data: 'monthly_payment.4.paid_at'
                },
                {
                    data: 'monthly_payment.4.amount'
                },

                // 6
                {
                    data: 'monthly_payment.5.paid_at'
                },
                {
                    data: 'monthly_payment.5.amount'
                },

                // 7
                {
                    data: 'monthly_payment.6.paid_at'
                },
                {
                    data: 'monthly_payment.6.amount'
                },

                // 8
                {
                    data: 'monthly_payment.7.paid_at'
                },
                {
                    data: 'monthly_payment.7.amount'
                },

                // 9
                {
                    data: 'monthly_payment.8.paid_at'
                },
                {
                    data: 'monthly_payment.8.amount'
                },

                // 10
                {
                    data: 'monthly_payment.9.paid_at'
                },
                {
                    data: 'monthly_payment.9.amount'
                },

                // 11
                {
                    data: 'monthly_payment.10.paid_at'
                },
                {
                    data: 'monthly_payment.10.amount'
                },

                // 12
                {
                    data: 'monthly_payment.11.paid_at'
                },
                {
                    data: 'monthly_payment.11.amount'
                },

                {
                    data: 'monthly_total'
                },
                {
                    data: 'last_year_1'
                },
                {
                    data: 'last_year_2'
                },
                {
                    data: 'last_year_3'
                },
                {
                    data: 'total_all'
                },
            ],
            columnDefs: [{
                    targets: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24],
                    "defaultContent": "",
                    orderable: false,
                    createdCell: function(td, cellData, rowData, row, col) {
                        if (cellData) {
                            $(td).css('writing-mode', 'sideways-lr');
                            $(td).css('vertical-align', 'bottom');
                        } else {
                            $(td).css('vertical-align', 'middle');
                        }
                        $(td).addClass('text-center');
                    },
                },
                {
                    targets: [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23],
                    "defaultContent": "",
                    orderable: false,
                    render: function(data, type, full, meta) {
                        col = 0;
                        array = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23]
                        col = array.indexOf(meta.col) + 1;

                        if (!data) {
                            return `<button type="button" class="btn btn-primary btn-add" data-id="${full.id}" data-month="${col}">+</button>`;
                        }
                        // return `<button type="button" class="btn btn-danger">-</button>`+data;
                        return data
                    },
                },
                {
                    targets: [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24],
                    "defaultContent": "",
                    orderable: false,
                    render: function(data, type, full, meta) {
                        if (!data || data === 0) {
                            return `-`;
                        }
                        // return `<button type="button" class="btn btn-danger">-</button>`+data;
                        return formatRupiah(String(data), 'Rp. ');
                    },
                },
                {
                    targets: 25,
                    title: 'Total simpanan wajib ' + new Date().getFullYear(),
                    // orderable: false,
                    createdCell: function(td, cellData, rowData, row, col) {
                        $(td).addClass('text-center');
                    },
                    render: function(data, type, full, meta) {
                        return formatRupiah(String(data), 'Rp. ');
                    },
                },
                {
                    targets: 26,
                    title: 'Total simpanan wajib ' + ((new Date().getFullYear()) - 1),
                    // orderable: false,
                    createdCell: function(td, cellData, rowData, row, col) {
                        $(td).addClass('text-center');
                    },
                    render: function(data, type, full, meta) {
                        return formatRupiah(String(data), 'Rp. ');
                    },
                },
                {
                    targets: 27,
                    title: 'Total simpanan wajib ' + ((new Date().getFullYear()) - 2),
                    // orderable: false,
                    createdCell: function(td, cellData, rowData, row, col) {
                        $(td).addClass('text-center');
                    },
                    render: function(data, type, full, meta) {
                        return formatRupiah(String(data), 'Rp. ');
                    },
                },
                {
                    targets: 28,
                    title: 'Total simpanan wajib ' + ((new Date().getFullYear()) - 3),
                    // orderable: false,
                    createdCell: function(td, cellData, rowData, row, col) {
                        $(td).addClass('text-center');
                    },
                    render: function(data, type, full, meta) {
                        return formatRupiah(String(data), 'Rp. ');
                    },
                },
                {
                    targets: 29,
                    title: 'Total simpanan wajib Keseluruhan',
                    // orderable: false,
                    createdCell: function(td, cellData, rowData, row, col) {
                        $(td).addClass('text-center');
                    },
                    render: function(data, type, full, meta) {
                        return formatRupiah(String(data), 'Rp. ');
                    },
                },
            ]
        });

        $('#user-table').on('click', '.btn-add', function() {
            var id = $(this).attr("data-id");
            $('#user-modal').modal('show');
            $("#user-modal #action-modal").text('Angsuran baru');
            $("#user-form")[0].reset();
            $('#payment_month').val($(this).attr("data-month"));
            $('#payment_year').val(new Date().getFullYear());
            $("#user-form").attr('data-userId', id);
            $('#user-modal').on('shown.bs.modal', function(event) {
                KTApp.unblock('#user-modal .modal-content');
            });
        });

        $('#user-modal').on('click', '#btn_form', function() {
            let data = new FormData($('#user-form')[0])
            let id = $('#user-form').attr("data-id") ?? '';
            let user_id = $('#user-form').attr("data-userId") ?? '';

            if (id != '') data.append("id", id);
            if (user_id != '') data.append("user_id", user_id);

            $.ajax({
                url: "{{route('admin.payment.monthly.store')}}",
                type: 'POST',
                data: data,
                contentType: false,
                processData: false,
                beforeSend: function() {
                    $('#btn_form').attr('disabled', 'disabled')
                    KTApp.block('#user-modal .modal-content', {
                        overlayColor: '#000000',
                        message: 'Please wait...',
                    });
                },
                success: function(data) {
                    table.ajax.reload();
                    KTApp.unblock('#user-modal .modal-content');
                    $("#user-modal").modal('hide');
                    $('#btn_form').removeAttr('disabled');
                    swal.fire({
                        text: data.message,
                        icon: data.code == 600 ? "warning" : "success"
                    });
                },
                error: function(res, exception) {
                    KTApp.unblock('#user-modal .modal-content');
                    $('#btn_form').removeAttr('disabled');
                    if (res.responseJSON.code) {
                        swal.fire({
                            text: res.responseJSON.error,
                            icon: "warning"
                        });
                    } else {
                        swal.fire({
                            text: "Something Wrong, Please check your connection and try again!",
                            icon: "error"
                        });
                    }
                }
            });
        });
    });
</script>
@endsection