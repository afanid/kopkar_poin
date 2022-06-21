@extends('layout.master_user') 
@section('title')
    Dashboard
@endsection 
@section('css') 
@endsection 
@section('content')
<!-- user 12345678 -->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Data Pembayaran Wajib</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Data Pembayaran Wajib</li>
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
                    <h3>Total : {{$ttl}}</h3>
                <table class="table center">
                <tr> 
                    <th>Bulan Ke</th>
                    <th>Tanggal</th> 
                    <th>Nominal</th>   
                </tr>
                @php
                $i=1;
                @endphp
                @foreach(@$main_peyment as $keu)
                <tr>  
                    <td>{{@$keu->payment_month}}</td>
                    <td>{{@$keu->paid_at}}</td>
                    <td>{{@$keu->amount}}</td>   
                </tr>
                @php
                $i++;
                @endphp
                @endforeach
                </table>
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
<script>
    $(document).ready(function () {
 
    })
</script>
@endsection
