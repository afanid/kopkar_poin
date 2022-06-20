<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class PointController extends Controller
{
    public function index(Request $request)
    {
        return view('admin.Point.index');
    }

    public function getpointransaksi(Request $request)
    {

        $error = true;
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => 'http://apidprod.mudahkan.com/v1/transaction?store_id=8cf3f861bcb15e13f844f605ef95656a',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => array(
                'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJsdW1lbi1qd3QiLCJzdWIiOiJhMWY4ZGU3ZWUwNTBmY2UzYjI3ZDFhZDcxOGYyODc0ZCIsImlhdCI6MTY0ODE3Mjg4Mn0.ldreRBPmdUsRdFFrhAbVDIOXuevKhxhZCJUyyO8UHG0'
            ),
        ));

        $response = curl_exec($curl);
        curl_close($curl);
        $data = json_decode($response);   
        if (count(@$data->{'data'}) != 0) {
            // echo '<pre>';
            $data_trx = @$data->{'data'};
            $nominal_min = 10000;
            foreach ($data_trx as $key) {
                $created_at     = Carbon::parse($key->{'created_at'})->format('Y-m-d');
                //echo '<pre>';
                $nominal_awal   = @$key->{'TRANSACTION_TOTAL'};
                // echo '</pre>';
                $db_get         = DB::table('tb_poin_fandi')
                    ->where('id_user', strtolower(@$key->{'created_by'}->{'USER_FULLNAME'}))
                    ->whereDate('tanggal_poin', $created_at)
                    ->where('status', 'aktif')
                    ->get();
                $nom = 0;
                foreach ($db_get as $key2) {
                    $nom +=    @$key2->nominal;
                }

                if ($nominal_awal > $nominal_min) {
                    $ttl_           = floor(($nom + $nominal_awal) / $nominal_min);
                    $db_get         = DB::table('tb_poin_fandi')->where('id_transaksi', @$key->{'TRANSACTION_ID'})->first();
                    if (!$db_get) {
                        DB::table('tb_poin_fandi')->insert(
                            [
                                'jumlah_poin'   => $ttl_,
                                'id_transaksi'  => @$key->{'TRANSACTION_ID'},
                                'tanggal_poin'  => @$created_at,
                                'id_user'       => strtolower(@$key->{'created_by'}->{'USER_FULLNAME'}),
                                'nominal'       => @$key->{'TRANSACTION_TOTAL'},
                                'status'        => 'aktif'
                            ]
                        );
                        $error = false;
                    }
                }
            }
        }
        print json_encode(array('error' => $error));
    }

    public function gettablepoin(Request $request)
    {
        $db_get         = DB::table('tb_poin_fandi')->where('status', 'aktif')->orderBy('tanggal_poin', 'DESC')->paginate(20);
        print json_encode(array('db_get' => $db_get));
    }

    public function editpointransaksi(Request $request)
    {
        DB::table('tb_poin_fandi')->where('id_poin', $request->input('id_poin'))->update([
            'id_transaksi'  => $request->input('id_transaksi'),
            'tanggal_poin'  => $request->input('tanggal_poin'),
            'id_user'       => $request->input('id_user'),
            'nominal'       => $request->input('nominal'),
            'jumlah_poin'   => $request->input('jumlah_poin')
        ]);
        print json_encode(array('error' => false));
    }
    public function hapuspointransaksi(Request $request)
    {
        DB::table('tb_poin_fandi')
            ->where('id_poin', $request->input('id_poin'))
            ->update(['status'  => 'hapus']);
        print json_encode(array('error' => false));
    }
}
