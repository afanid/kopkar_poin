@extends('layout.master')

@section('title')
    Keuangan Anggota
@endsection

@section('css')
    <!-- DataTables -->
    <link rel="stylesheet" href="{{asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{asset('plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css">
    <style>
        .dt-buttons{
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
            border: 1px solid rgba(0,0,0,.15);
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
                        <h1 class="m-0">Keuangan Anggota</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item">Keuangan Anggota</li>
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
                        <h3 class="card-title">Data Keuangan Anggota</h3>

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
                        {{--                        <div class="table-responsive">--}}
                        <table id="user-table" width="100%" class="table table-bordered table-striped">
                            <thead class="text-center">
                            <tr>
                                <th style="vertical-align: middle">Nama</th>
                                <th style="vertical-align: middle">Total Simpanan Pokok</th>
                                <th style="vertical-align: middle">Total Simpanan Wajib</th>
                                <th style="vertical-align: middle">Total Simpanan Sukarela</th>
                                <th style="vertical-align: middle">Total Keseluruhan</th>
                            </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                        {{--                        </div>--}}
                    </div>
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
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
            var table = $("#user-table").DataTable({
                paging: true,
                processing: true,
                serverSide: true,
                ajax: "{{route('admin.user.wallet.ajax')}}",
                // responsive: true,
                // lengthChange: false,
                // autoWidth: true,
                dom: `<"row"<"col-md-2" B> <"col-md-2" l> <"col-md-8" f>> rt`,//'Blfrtip',
                buttons: {
                    buttons: ["excel", "pdf", "print"],
                },
                columns: [
                    {
                        data: 'name'
                    },
                    {
                        data: 'wallet.main'
                    },
                    {
                        data: 'wallet.monthly'
                    },
                    {
                        data: 'wallet.other'
                    },
                    {
                        data: 'wallet.total'
                    },
                ],
                columnDefs: [
                    {
                        targets: [1,2,3,4],
                        "defaultContent": "",
                        render: function(data, type, full, meta) {
                            return formatRupiah(String(data), 'Rp. ');
                        },
                    },
                ]
            });

        });
    </script>
@endsection
