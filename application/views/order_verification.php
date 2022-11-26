<div class="container">
  <div class="row">
    <div class="col-md-12" style="margin-top: 60px;">
      <div class="card">
        <div class="card-header">
          Daftar Pesanan
        </div>
        <div class="card-body">
          <?=$this->session->flashdata('message')?>
          <table class="table">
            <thead class="thead-dark">
              <tr>
                <th scope="col">#</th>
                <th scope="col">Tgl Pesan</th>
                <th scope="col">Pemesan</th>
                <th scope="col">Penginapan</th>
                <th scope="col">Paket</th>
                <th scope="col">Total Bayar</th>
                <th scope="col">Status Pembayaran</th>
                <th scope="col">Detail</th>
              </tr>
            </thead>
            <tbody>

              <?php 
              $i=1;
              foreach($list as $l){
                if($l->paket=='harian'){
                  $paket = 'hari';
                }elseif($l->paket=='bulanan'){
                  $paket = 'bulan';
                }else{
                  $paket = 'tahun';
                }
                ?>
                <tr>
                  <th scope="row"><?=$i?></th>
                  <td><?=tanggal($l->tgl_pesan)?></td>
                  <td><?=$l->nama?></td>
                  <td><?=$l->nama_apartemen?></td>
                  <td><?=$l->jumlah_paket?> <?=$paket?></td>
                  <td><?=rupiah($l->total_bayar)?></td>
                  <td><?=status_pembayaran($l->status_pembayaran)?></td>
                  <td><a href="<?=base_url('order/verification_detail/'.$l->id_pesanan)?>" class="btn btn-primary">Detail</a></td>
                </tr>
              <?php 
              $i++;
            } ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>