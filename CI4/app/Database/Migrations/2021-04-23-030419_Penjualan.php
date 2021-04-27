<?php namespace App\Database\Migrations;
 
use CodeIgniter\Database\Migration;
 
class User extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id'            => [
                'type'              => 'BIGINT',
                'constraint'        => 20,
                'unsigned'          => TRUE,
                'auto_increment'    => TRUE
            ],
            'nama'          => [
                'type'              => 'VARCHAR',
                'constraint'        => 100,
            ],
            'keterangan'        => [
                'type'              => 'VARCHAR',
                'constraint'        => 15
            ],
            'jumlah'       => [
                'type'              => 'DECIMAL',
                'constraint'        => 10,0
            ],
            'tanggal'         => [
                'type'              => 'DATE',
            ]
        ]);
        $this->forge->addKey('id', TRUE);
        $this->forge->createTable('penjualan');
    }
 
    public function down()
    {
        //
    }
}