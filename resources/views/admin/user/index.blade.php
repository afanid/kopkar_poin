@extends('layout.master')

@section('title')
Manage User
@endsection

@section('css')
<!-- DataTables -->
<link rel="stylesheet" href="{{asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
<link rel="stylesheet" href="{{asset('plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}}">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css">
<style>
    .dt-buttons {
        padding-bottom: 20px;
    }

    .input-group-addon {
        padding: .5rem .75rem;
        margin-bottom: 0;
        font-size: 1rem;
        font-weight: 400;
        line-height: 1.25;
        color: #495057;
        text-align: center;
        background-color: #e9ecef;
        border: 1px solid rgba(0, 0, 0, .15);
        border-radius: .25rem;
    }
</style>
@endsection

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Manage User</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Manage User</li>
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
                    <h3 class="card-title">Daftar Anggota</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <table id="user-table" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama</th>
                                <th>No. Anggota</th>
                                <th>Nomor Telefon</th>
                                <th>Alamat</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<!-- Modal -->
<div class="modal fade" id="user-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><span id="action-modal"></span> User</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" id="user-form" data-id="">
                    @csrf
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" name="email" class="form-control form-control-border" id="email" placeholder="">
                            </div>
                            <div class="form-group">
                                <label>Username <span class="text-danger">*</span> </label>
                                <input type="text" name="username" class="form-control form-control-border" id="username" placeholder="">
                            </div>
                            <div class="form-group">
                                <label>Password <span class="text-danger">*</span> </label>
                                <div class="input-group" id="show_hide_password">
                                    <input type="password" name="password" class="form-control form-control-border" id="password" placeholder="">
                                    <div class="input-group-addon">
                                        <a href=""><i class="fa fa-eye-slash"></i></a>
                                    </div>
                                </div>
                            </div>
                            {{-- <div class="form-group">--}}
                            {{-- <label>Password</label>--}}
                            {{-- <div class="input-group" id="show_hide_password">--}}
                            {{-- <input class="form-control  form-control-border" type="password">--}}
                            {{-- <div class="input-group-addon">--}}
                            {{-- <a href=""><i class="fa fa-eye-slash" aria-hidden="true"></i></a>--}}
                            {{-- </div>--}}
                            {{-- </div>--}}
                            {{-- </div>--}}
                            <div class="form-group">
                                <label>Tanggal Registrasi <span class="text-danger">*</span> </label>
                                <input type="text" name="registered_at" class="form-control form-control-border" id="registered_at" placeholder="">
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <div class="form-group clearfix">
                                    <div class="icheck-primary d-inline" style="margin-right: 10px">
                                        <input type="radio" id="radioPrimary2" name="status" value="0" checked>
                                        <label for="radioPrimary2">
                                            Tidak Aktif
                                        </label>
                                    </div>
                                    <div class="icheck-primary d-inline">
                                        <input type="radio" id="radioPrimary3" name="status" value="1">
                                        <label for="radioPrimary3">
                                            Aktif
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Name Store</label>
                                <input type="text" name="member_id" class="form-control form-control-border" id="member_id" placeholder="">
                            </div>
                            <div class="form-group">
                                <label>Nama <span class="text-danger">*</span> </label>
                                <input type="text" name="name" class="form-control form-control-border" id="name" placeholder="">
                            </div>
                            <div class="form-group">
                                <label>No. Hp <span class="text-danger">*</span> </label>
                                <input type="text" name="phone_number" class="form-control form-control-border" id="phone_number" placeholder="">
                            </div>
                            <div class="form-group">
                                <label>Alamat</label>
                                <input type="text" name="address" class="form-control form-control-border" id="address" placeholder="">
                            </div>
                            <div class="form-group">
                                <label>TMT</label>
                                <input type="text" name="tmt" class="form-control form-control-border" id="tmt" placeholder="">
                            </div>
                        </div>
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
            $('#registered_at').daterangepicker({
                singleDatePicker: true,
                locale: {
                    format: 'YYYY-MM-DD',
                    autoUpdateInput: false,
                }
            })
        });

        $("#show_hide_password a").on('click', function(event) {
            event.preventDefault();
            if ($('#show_hide_password input').attr("type") == "text") {
                $('#show_hide_password input').attr('type', 'password');
                $('#show_hide_password i').addClass("fa-eye-slash");
                $('#show_hide_password i').removeClass("fa-eye");
            } else if ($('#show_hide_password input').attr("type") == "password") {
                $('#show_hide_password input').attr('type', 'text');
                $('#show_hide_password i').removeClass("fa-eye-slash");
                $('#show_hide_password i').addClass("fa-eye");
            }
        });

        var table = $("#user-table").DataTable({
            paging: true,
            processing: true,
            serverSide: true,
            ajax: "{{route('admin.user.ajax')}}",
            responsive: true,
            // lengthChange: false,
            // autoWidth: false,
            dom: `<"row"<"col-md-3" B> <"col-md-1" l> <"col-md-8" f>> rt`, //'Blfrtip',
            buttons: {
                buttons: ["excel", "pdf", "print", {
                    text: '+ Tambah user',
                    className: 'btn-primary',
                    action: function(e, dt, node, config) {
                        $('#action-modal').text('Tambah ')
                        $('#user-modal').modal('show')
                        $("#user-form")[0].reset();
                        $("#user-form").attr('data-id', '');
                    },
                }],
                dom: {
                    button: {
                        className: 'btn'
                    },
                    buttonLiner: {
                        tag: null
                    }
                }
            },
            columnDefs: [{
                    targets: 0,
                    createdCell: function(td, cellData, rowData, row, col) {
                        $(td).text(row + 1)
                    }
                },
                {
                    targets: -1,
                    title: 'Aksi',
                    orderable: false,
                    createdCell: function(td, cellData, rowData, row, col) {
                        $(td).addClass('text-center');
                    },
                    render: function(data, type, full, meta) {
                        return '\
                                    <a href="javascript:void(0);" data-id="' + full.id + '" class="btn-edit btn btn-sm btn-outline-primary btn-icon" title="Edit details">\
                                        <i class="fa fa-edit"></i>\
                                    </a>\
                                    <a href="javascript:void(0);" data-id="' + full.id + '" class="btn-delete btn btn-sm btn-outline-danger btn-icon" title="Delete">\
                                        <i class="fa fa-trash"></i>\
                                    </a>\
                                ';
                    },
                },
            ],
            columns: [{
                    data: 'username'
                },
                {
                    data: 'name'
                },
                {
                    data: 'member_id'
                },
                {
                    data: 'phone_number'
                },
                {
                    data: 'address'
                },
                {
                    data: 'id'
                },
            ]
        });

        $('#user-table').on('click', '.btn-edit', function() {
            var id = $(this).attr("data-id");
            $("#user-modal").modal('show');
            $("#user-modal #action-modal").text('Edit ');
            $("#user-form")[0].reset();
            $("#user-form").attr('data-id', id);
            $.ajax({
                url: "{{url('/user/show')}}" + "/" + id,
                type: 'GET',
                beforeSend: function() {
                    KTApp.block('#user-modal .modal-content');
                },
                success: function(data) {
                    $("#user-form #email").val(data.user.email);
                    $("#user-form #username").val(data.user.username);
                    $("#user-form #password").val(data.user.password);
                    $("#user-form #registered_at").val(data.user.registered_at);
                    $('#user-form input:radio[name=status]').filter(+data.user.status == 1 ? '[value=1]' : '[value=0]').attr('checked', true);

                    $("#user-form #member_id").val(data.user.member_id);
                    $("#user-form #name").val(data.user.name);
                    $("#user-form #phone_number").val(data.user.phone_number);
                    $("#user-form #address").val(data.user.address);
                    $("#user-form #tmt").val(data.user.tmt);

                    $('#user-modal').on('shown.bs.modal', function(event) {
                        KTApp.unblock('#user-modal .modal-content');
                    });

                    KTApp.unblock('#user-modal .modal-content');
                },
                error: function(res, exception) {
                    KTApp.unblock('#user-modal .modal-content');
                    $("#user-modal").modal('hide');
                    swal.fire({
                        text: "Something Wrong, Please check your connection and try again!",
                        icon: "error"
                    });
                }
            });
        });

        $('#user-table').on('click', '.btn-delete', function() {
            var id = $(this).data('id');
            Swal.fire({
                    title: "Delete Entry Guide",
                    text: "Are you sure to delete this data?",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes'
                })
                .then((result) => {
                    if (result.value) {
                        $.ajax({
                            type: "POST",
                            url: "{{url('/user/destroy')}}/" + id,
                            contentType: false,
                            processData: false,
                            beforeSend: function() {
                                swal.fire({
                                    text: "Please Wait...",
                                    allowOutsideClick: false,
                                    allowEscapeKey: false,
                                    allowEnterKey: false,
                                    onOpen: function() {
                                        Swal.showLoading()
                                    }
                                });
                            },
                            success: function(data) {
                                table.ajax.reload();
                                swal.close()
                                swal.fire({
                                    text: data.message,
                                    icon: data.code == 600 ? "warning" : "success"
                                });
                            },
                            error: function(res, exception) {
                                swal.close()
                                swal.fire({
                                    text: "Something Wrong, Please check your connection and try again!",
                                    icon: "error"
                                });
                            }
                        });
                    }
                });
        });

        $('#user-modal').on('click', '#btn_form', function() {
            let data = new FormData($('#user-form')[0])
            let id = $('#user-form').attr("data-id") ?? '';
            if (id != '') {
                data.append("id", id);
            }
            $.ajax({
                url: "{{url('/user/store')}}",
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