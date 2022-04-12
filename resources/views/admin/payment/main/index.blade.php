@extends('layout.master')

@section('title')
Dashboard
@endsection

@section('css')
<link rel="stylesheet" href="{{asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
<link rel="stylesheet" href="{{asset('plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}}">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css">
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
                        <li class="breadcrumb-item active">Simpanan Pokok</li>
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
                    <h3 class="card-title">Data Simpanan Pokok</h3>

                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                            <i class="fas fa-minus"></i>
                        </button>
                        <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="user-table" width="100%" class="table table-bordered table-striped">
                            <thead class="text-center">
                                <tr>
                                    <th rowspan="3" style="vertical-align: middle">Nama</th>
                                    {{-- <th rowspan="3" width="10%" style="vertical-align: middle">Nomor Anggota</th>--}}
                                    <th colspan="14">Angsuran</th>
                                    <th rowspan="3" style="vertical-align: middle">Sisa</th>
                                    <th rowspan="3" style="vertical-align: middle">Ket</th>
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

                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>

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
                        <label>Tanggal Bayar <span class="text-danger">*</span> </label>
                        <input type="text" name="paid_at" class="form-control" id="paid_at" placeholder="">
                    </div>
                    <div class="form-group">
                        <label>Jumlah <span class="text-danger">*</span> </label>
                        <input type="text" name="amount" class="form-control" id="amount" placeholder="">
                    </div>
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
<script src="{{asset('plugins/datatables-buttons/js/buttons.bootstrap4.min.js')}}"></script>
<script src="{{asset('plugins/jszip/jszip.min.js')}}"></script>
<script src="{{asset('plugins/pdfmake/pdfmake.min.js')}}"></script>
<script src="{{asset('plugins/pdfmake/vfs_fonts.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/buttons.html5.min.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/buttons.print.min.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/buttons.colVis.min.js')}}"></script>
<script>
    $(document).ready(function() {
        $('#user-modal').on('shown.bs.modal', function(event) {
            $('#paid_at').daterangepicker({
                singleDatePicker: true,
                locale: {
                    format: 'YYYY-MM-DD',
                    autoUpdateInput: false,
                }
            })
            var rupiah = $('#amount');
            rupiah.on('keyup', function(e) {
                rupiah.val(formatRupiah(rupiah.val(), 'Rp. '));
            });
        });

        var table = $("#user-table").DataTable({
            paging: true,
            processing: true,
            serverSide: true,
            scrollY: "50vh",
            scrollX: true,
            ajax: "{{route('admin.payment.main.ajax')}}",
            responsive: true,
            // lengthChange: false,
            autoWidth: true,
            columnDefs: [{
                    targets: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14],
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
                    targets: [1, 3, 5, 7, 9, 11, 13],
                    "defaultContent": "",
                    render: function(data, type, full, meta) {
                        if (!data && full.main_payment_status) {
                            return '-';
                        }
                        if (!data) {
                            return `<button type="button" class="btn btn-primary btn-add" data-id="${full.id}">+</button>`;
                        }
                        // return `<button type="button" class="btn btn-danger">-</button>`+data;
                        return data
                    },
                },
                {
                    targets: [2, 4, 6, 8, 10, 12, 14],
                    "defaultContent": "",
                    render: function(data, type, full, meta) {
                        if (!data) {
                            return `-`;
                        }
                        // return `<button type="button" class="btn btn-danger">-</button>`+data;
                        return formatRupiah(String(data), 'Rp. ');
                    },
                },
                {
                    targets: 15,
                    render: function(data, type, full, meta) {
                        sum = 0;
                        total = 0;
                        data.forEach(function(item) {
                            sum += item.amount;
                            total = item.config_payment.paid_off_amount;
                        });
                        return formatRupiah(String(total - sum), 'Rp. ');
                    },
                },
                {
                    targets: 16,
                    createdCell: function(td, cellData, rowData, row, col) {
                        $(td).addClass('text-center');
                    },
                    render: function(data, type, full, meta) {
                        sum = 0;
                        total = 0;
                        data.forEach(function(item) {
                            sum += item.amount;
                            total = item.config_payment.paid_off_amount;
                        });
                        sisa = (total - sum)
                        return sisa === 0 && sum > 0 ? '<a class="btn btn-success btn-sm">Lunas</a>' : '<a class="btn btn-warning btn-sm">Belum lunas</a>';
                    },
                },
                {
                    targets: 17,
                    render: function(data, type, full, meta) {
                        sum = 0;
                        data.forEach(function(item) {
                            sum += item.amount;
                        });
                        return formatRupiah(String(sum), 'Rp. ');
                    },
                },
            ],
            columns: [{
                    data: 'name'
                },

                {
                    data: 'main_payment.0.paid_at'
                },
                {
                    data: 'main_payment.0.amount'
                },

                {
                    data: 'main_payment.1.paid_at'
                },
                {
                    data: 'main_payment.1.amount'
                },

                {
                    data: 'main_payment.2.paid_at'
                },
                {
                    data: 'main_payment.2.amount'
                },

                {
                    data: 'main_payment.3.paid_at'
                },
                {
                    data: 'main_payment.3.amount'
                },

                {
                    data: 'main_payment.4.paid_at'
                },
                {
                    data: 'main_payment.4.amount'
                },

                {
                    data: 'main_payment.5.paid_at'
                },
                {
                    data: 'main_payment.5.amount'
                },

                {
                    data: 'main_payment.6.paid_at'
                },
                {
                    data: 'main_payment.6.amount'
                },

                {
                    data: 'main_payment'
                },
                {
                    data: 'main_payment'
                },
                {
                    data: 'main_payment'
                },
            ]
        });

        $('#user-table').on('click', '.btn-add', function() {
            var id = $(this).attr("data-id");
            $('#user-modal').modal('show');
            $("#user-modal #action-modal").text('Angsuran baru');
            $("#user-form")[0].reset();
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
                url: "{{route('admin.payment.main.store')}}",
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
        // setInterval(function() {
        //     getpoin()
        // }, 2000);

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
    });
</script>
@endsection