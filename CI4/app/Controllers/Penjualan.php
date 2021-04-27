<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Penjualan extends CI_Controller{
 function __construct(){
 parent::__construct();
 }
//untuk get data
function index(){
 $result=$this->db->get('penjualan')->result();
 echo json_encode($result);
}
//untuk save data
function save(){
    $data=array(
 'nama'=>$_POST['nama'],
 'keterangan'=>$_POST['keterangan'],
 'jumlah'=>$_POST['jumlah'],
 'tanggal'=>$_POST['tanggal']
 );
 $this->db->insert('penjualan',$data);
}
//untuk update data
function save_update(){
 $data=array(
 'nama'=>$_POST['nama'],
 'keterangan'=>$_POST['keterangan'],
 'jumlah'=>$_POST['jumlah'],
 'tanggal'=>$_POST['tanggal']
 );
 $this->db->where('id',$_POST['id'])->update('penjualan',$data);
}
//untuk delete data
function delete($id){
$this->db->where('id',$id)->delete('penjualan');
}
}
