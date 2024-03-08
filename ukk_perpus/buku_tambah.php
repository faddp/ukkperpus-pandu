<h1 class="mt-4">Kategori Buku</h1>
<div class="card">
    <div class="card-body">
    <div class="row">    
    <div class="col-md-12"> 
        <form method="post" enctype="multipart/form-data">
            <?php
                if(isset($_POST['submit'])){
                    $id_kategori = $_POST['id_kategori'];
                    $sampul = $_FILES['sampul']['name'];
                    $tmp_name = $_FILES['sampul']['tmp_name'];
                    $target_dir = "images/";
                    move_uploaded_file($tmp_name, "images/".$sampul);
                    $judul = $_POST['judul'];
                    $penulis = $_POST['penulis'];
                    $tahun_terbit = $_POST['tahun_terbit'];
                    $deskripsi = $_POST['deskripsi'];
                    $stok = $_POST['stok'];
                    $query = mysqli_query($koneksi, "INSERT INTO buku(id_kategori, sampul, judul, penulis, tahun_terbit, deskripsi, stok)
                                 VALUES ('$id_kategori', '$sampul', '$judul', '$penulis', '$tahun_terbit', '$deskripsi', '$stok')
                                 ON DUPLICATE KEY UPDATE
                                 sampul = '$sampul', judul = '$judul', penulis = '$penulis', tahun_terbit = '$tahun_terbit', deskripsi = '$deskripsi', stok = '$stok'");
                    if($query) {
                        echo '<script>alert("Tambah data berhasil.");</script>';
                    }else{
                        echo '<script>alert("Tambah data gagal");</script>';
                    }
                  }
                ?>

         <div class="row mb-3">  
             <div class="col-md-2">Kategori</div>
             <div class="col-md-8">
             <select name="id_kategori" class="form-control">
                         <?php
                             $kat = mysqli_query($koneksi, "SELECT*FROM kategori");
                             while($kategori = mysqli_fetch_array($kat)) {
                                ?>
                                <option value="<?php echo $kategori['id_kategori']; ?>"><?php echo $kategori['kategori']; ?></option>
                                <?Php
                        }
                        ?>
                   </select>
         </div>  
         <div class="row mb-3">  
             <div class="col-md-2">Sampul</div>
             <div class="col-md-8"><input type="file" class="form-control" name="sampul"></div>
         </div>  
         <div class="row mb-3">  
             <div class="col-md-2">Judul</div>
             <div class="col-md-8"><input type="text" class="form-control" name="judul"></div>
         </div>  
         <div class="row mb-3">  
             <div class="col-md-2">Penulis</div>
             <div class="col-md-8"><input type="text" class="form-control" name="penulis"></div>
         </div>  
         <div class="row mb-3">  
             <div class="col-md-2">Tahun Terbit</div>
             <div class="col-md-8"><input type="date" class="form-control" name="tahun_terbit"></div>
         </div>     
         <div class="row mb-3">  
             <div class="col-md-2">Deskripsi</div>
             <div class="col-md-8">
                <textarea name="deskripsi" rows="5" class="form-control"></textarea>
        </div>
         <div class="row mb-3">  
             <div class="col-md-2">Stok</div>
             <div class="col-md-8"><input type="number" class="form-control" name="stok"></div>
         </div>  
            </div class="row">
                 <div class="col-md-2"></div>
                 <div class="col-md-8">
                   <button type="submit" class="btn btn-primary" name="submit" value="submit">Simpan</button>
                   <button type="reset" class="btn btn-secondary">Reset</button>
                   <a href="?page=buku" class="btn btn-danger">Kembali</a>
                </div>
           </div>
         </form>
       </div>
    </div>
 </div>
 </div>