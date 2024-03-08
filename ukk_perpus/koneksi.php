<?php
session_start();
$koneksi = mysqli_connect('localhost','root','','ukk_perpus');

if (!$koneksi) {
    die("Koneksi database gagal: " . mysqli_connect_error());
}
