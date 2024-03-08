<h1 class="mt-4">Laporan peminjaman Buku</h1>
<div class="card">
    <div class="card-body">
    <div class="row">
    <div class="col-md-12">
            <a href="cetak.php" target="_blank" class="btn btn-primary"><i class="fa fa-print"></i>Cetak Data</a>
            <table class="table table-bordered" id="datatable" width="100%" cellspacing="0">

                <tr>
                    <th>No</th> 
                    <th>User</th> 
                    <th>Buku</th> 
                    <th>Tanggal Peminjaman</th> 
                    <th>Tanggal Pengembalian</th> 
                    <th>Status Peminjaman</th>
                    <th>Aksi</th>
                </tr>
                <?php
                $i = 1;
                    $query = mysqli_query($koneksi, "SELECT*FROM peminjaman LEFT JOIN user on user.id_user = peminjaman.id_user LEFT JOIN buku on buku.id_buku = peminjaman.id_buku");
                    while($data = mysqli_fetch_array($query)){

                // // Mendapatkan id peminjaman dari parameter URL
                // $id_peminjaman = $_GET['id'];

                // // Mengupdate status peminjaman menjadi "Dikonfirmasi" di database
                // mysqli_query($koneksi, "UPDATE peminjaman SET status_peminjaman = 'Dikonfirmasi' WHERE id_peminjaman = '$id_peminjaman'");

                // // Mengurangi stok buku
                // $data_peminjaman = mysqli_query($koneksi, "SELECT * FROM peminjaman WHERE id_peminjaman = '$id_peminjaman'");
                // $peminjaman = mysqli_fetch_array($data_peminjaman);
                // $id_buku = $peminjaman['id_buku'];
                // mysqli_query($koneksi, "UPDATE buku SET stok = stok - 1 WHERE id_buku = '$id_buku'");

                // // Kembali ke halaman laporan peminjaman setelah konfirmasi
                // header("Location: laporan_peminjaman.php");

                        ?>
                        <tr>
                            <td><?php echo $i++; ?></td>
                            <td><?php echo $data['nama']; ?></td>
                            <td><?php echo $data['judul']; ?></td>
                            <td><?php echo $data['tanggal_peminjaman']; ?></td>
                            <td><?php echo $data['tanggal_pengembalian']; ?></td>
                            <td><?php echo $data['status_peminjaman']; ?></td>
                            <td>
                                <?php if ($data['status_peminjaman'] == 'belum dikonfirmasi' ) { ?>
                                    <a href="?page=peminjaman_konfirmasi&&id=<?php echo $data['id_peminjaman']; ?>" class="btn btn-success">konfirmasi</a>
                                  
                                <?php } ?> 
                                <?php if ($data['status_peminjaman'] == 'dipinjam' ) { ?>
                                    <a href="?page=peminjaman_ubah&&id=<?php echo $data['id_peminjaman']; ?>" class="btn btn-primary">Kembalikan</a>
                                  
                                <?php } ?> 
                                
                            </td>
                        </tr>
                        <?php
                    }
                ?>
        </table>
    </div>
 </div> 
        </div>
</div>
