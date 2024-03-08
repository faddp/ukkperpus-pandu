<h1 class="mt-4">Ulasan Buku</h1>
<div class="card">
    <div class="card-body">
    <div class="row">
    <div class="col-md-12">
            <a href="?page=ulasan_tambah" class="btn btn-primary">+ Tambah Data</a>
            <table class="table table-bordered" id="datatable" width="100%" cellspacing="0">
                <tr>
                    <th>No</th> 
                    <th>User</th> 
                    <th>Buku</th> 
                    <th>Ulasan</th> 
                    <th>Rating</th> 
                    <th>Aksi</th>
                </tr>
                <?php
                $i = 1;
                
                // Cek apakah pengguna adalah admin
                $isAdmin = false;
                if ($_SESSION['user']['level'] == 'admin') {
                    $isAdmin = true;
                }
                
                // Modifikasi query untuk memperoleh semua data ulasan jika pengguna adalah admin
                $query = mysqli_query($koneksi, "SELECT * FROM ulasan LEFT JOIN user ON user.id_user = ulasan.id_user LEFT JOIN buku ON buku.id_buku = ulasan.id_buku");
                if (!$isAdmin) {
                    // Jika pengguna bukan admin, tambahkan kondisi WHERE untuk membatasi data ulasan hanya untuk pengguna tersebut
                    $query = mysqli_query($koneksi, "SELECT * FROM ulasan LEFT JOIN user ON user.id_user = ulasan.id_user LEFT JOIN buku ON buku.id_buku = ulasan.id_buku WHERE user.id_user=".$_SESSION['user']['id_user']);
                }
                
                while($data = mysqli_fetch_array($query)){
                    ?>
                    <tr>
                        <td><?php echo $i++; ?></td>
                        <td><?php echo $data['nama']; ?></td>
                        <td><?php echo $data['judul']; ?></td>
                        <td><?php echo $data['ulasan']; ?></td>
                        <td><?php echo $data['rating']; ?></td>
                        <td>
                            <a href="?page=ulasan_ubah&&id=<?php echo $data['id_ulasan']; ?>" class="btn btn-info">ubah</a>
                            <a onclick="return confirm('Apakah anda yakin menghapus data ini?');" href="?page=ulasan_hapus&&id=<?php echo $data['id_ulasan']; ?>" class="btn btn-danger">Hapus</a>
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