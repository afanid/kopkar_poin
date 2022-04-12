<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
        <img src="{{asset('dist/img/AdminLTELogo.png')}}" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">Kopkar</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="{{asset('dist/img/user2-160x160.jpg')}}" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block">Alexander Pierce</a>
            </div>
        </div>

        <!-- SidebarSearch Form -->
        {{-- <div class="form-inline">--}}
        {{-- <div class="input-group" data-widget="sidebar-search">--}}
        {{-- <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">--}}
        {{-- <div class="input-group-append">--}}
        {{-- <button class="btn btn-sidebar">--}}
        {{-- <i class="fas fa-search fa-fw"></i>--}}
        {{-- </button>--}}
        {{-- </div>--}}
        {{-- </div>--}}
        {{-- </div>--}}

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column nav-flat nav-child-indent" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                <li class="nav-item">
                    <a href="{{route('admin.dashboard')}}" class="nav-link {{Route::currentRouteName() == 'admin.dashboard' ? 'active' : ''}}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('admin.point.index') }}" class="nav-link {{Route::currentRouteName() == 'admin.point.index' ? 'active' : ''}}">
                        <i class="fa fa-user nav-icon"></i>
                        <p>Manage Poin</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('admin.user.index') }}" class="nav-link {{Route::currentRouteName() == 'admin.user.index' ? 'active' : ''}}">
                        <i class="fa fa-user nav-icon"></i>
                        <p>Manage User</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('admin.meta.index') }}" class="nav-link {{Route::currentRouteName() == 'admin.meta.index' ? 'active' : ''}}">
                        <i class="fa fa-user nav-icon"></i>
                        <p>Manage Meta Data</p>
                    </a>
                </li>

                <li class="nav-item {{(strpos(Route::currentRouteName(), 'admin.payment') === 0) ? 'menu-is-opening menu-open' : ''}}">
                    <a href="#" class="nav-link {{(strpos(Route::currentRouteName(), 'admin.payment') === 0) ? 'active' : ''}}">
                        <i class="fa fa-comment-dollar nav-icon"></i>
                        <p>
                            Pembayaran
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route('admin.payment.main.index')}}" class="nav-link {{Route::currentRouteName() == 'admin.payment.main.index' ? 'active' : ''}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Simpanan Pokok</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('admin.payment.monthly.index')}}" class="nav-link {{Route::currentRouteName() == 'admin.payment.monthly.index' ? 'active' : ''}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Simpanan Wajib</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route('admin.payment.other.index')}}" class="nav-link {{Route::currentRouteName() == 'admin.payment.other.index' ? 'active' : ''}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Simpanan Sukarela</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="{{route('admin.user.wallet.index')}}" class="nav-link">
                        <i class="fa fa-chart-line nav-icon"></i>
                        <p>Keuangan Anggota</p>
                    </a>
                </li>

            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>