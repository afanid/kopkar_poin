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
                <a href="#" class="d-block">{{Auth::user()->name}}</a>
            </div>
        </div> 
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column nav-flat nav-child-indent" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item">
                    <a href="{{route('user.dashboard')}}" class="nav-link {{Route::currentRouteName() == 'user.dashboard' ? 'active' : ''}}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('user.poinuser') }}" class="nav-link {{Route::currentRouteName() == 'user.poin' ? 'active' : ''}}">
                        <i class="fa fa-user nav-icon"></i>
                        <p>Manage Poin</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('user.pembayaranuser') }}" class="nav-link {{Route::currentRouteName() == 'user.pembayaran' ? 'active' : ''}}">
                        <i class="fa fa-user nav-icon"></i>
                        <p>Pembayaran </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('user.keuanganuser') }}" class="nav-link {{Route::currentRouteName() == 'user.keuangan' ? 'active' : ''}}">
                        <i class="fa fa-user nav-icon"></i>
                        <p>Keuangan anggota</p>
                    </a>
                </li>

                 

            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>