**Tugas Individu 7
- Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

Stateless widget adalah komponen yang tidak dapat berubah setelah dibuat. Setelah sebuah stateless widget dirender, UI-nya akan tetap sama dan tidak akan merespons interaksi atau perubahan data. Contoh stateful widget adalah teks pada demo flutter yang menampilkan angka yang menghitung berapa kali tombol ditekan.

Stateful widget adalah komponen yang dapat berubah ketika terjadi interaksi dari user. Stateful widget memiliki status yang dapat diubah, dan UI akan di-render ulang setiap kali statusnya diperbarui melalui metode setState(). Contoh stateless widget adalah teks judul, gambar dan ikon, atau komponen apapun yang tidak berubah.

Perbedaan:
---Stateless Widget	
1. Tidak memiliki status atau keadaan.	
2. Dibangun satu kali, tanpa perubahan data.	
3. Tidak memiliki metode setState().	
4. Digunakan untuk elemen statis.	

---Stateful Widget
1. Memiliki status atau keadaan yang dapat berubah.
2. Dibangun ulang setiap kali status diperbarui.
3. Menggunakan setState() untuk memperbarui UI.
4. Digunakan untuk elemen yang memerlukan interaksi dan perubahan UI.

- Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

1. MaterialApp: Widget utama untuk mengatur aplikasi Flutter, seperti judul, tema, dan halaman awal aplikasi. Di sini, MaterialApp mengatur tema aplikasi dan menampilkan MyHomePage sebagai halaman beranda.

2. Scaffold: Struktur dasar dari setiap halaman dalam aplikasi. Scaffold menyediakan AppBar, body, dan fitur lain yang mendukung pembuatan layout dasar halaman.

3. AppBar: Header yang muncul di bagian atas halaman, menampilkan judul aplikasi "Abibas Shoes" dengan warna dan gaya yang diatur sesuai tema.

4. Padding: Memberikan ruang di sekitar widget dalam body halaman agar terlihat lebih rapi dan berjarak.

5. Column: Widget untuk menyusun widget secara vertikal. Di sini, Column digunakan untuk menampilkan InfoCard dan GridView pada MyHomePage.

6. Row: Digunakan dalam Column untuk menyusun tiga InfoCard secara horizontal.

7. InfoCard: Stateless widget khusus yang menampilkan informasi seperti NPM, nama, dan kelas. Setiap InfoCard menggunakan Card untuk menampilkan teks dengan judul (title) dan isi (content) di dalamnya.

8. SizedBox: Digunakan untuk memberikan jarak vertikal antara elemen-elemen, seperti jarak antara InfoCard dan elemen berikutnya dalam Column.

9. Text: Widget untuk menampilkan teks statis. Teks ini muncul di berbagai bagian aplikasi, seperti pada judul, konten kartu, dan nama item.

10. GridView.count: Mengatur layout dalam bentuk grid dengan jumlah kolom tertentu (dalam hal ini, 3 kolom). GridView.count digunakan untuk menampilkan ItemCard secara rapi dalam grid pada halaman.

11. ItemCard: Stateless widget khusus yang mewakili setiap item di halaman utama, dengan ikon, teks, dan warna latar belakang. ItemCard menampilkan ikon dan nama item di dalam kartu, dengan fungsi onTap yang menampilkan pesan menggunakan SnackBar.

12. Material: Menerapkan desain material pada ItemCard agar bisa memiliki properti seperti warna dan border radius yang melengkung.

13. InkWell: Membuat ItemCard menjadi interaktif dengan menambahkan efek saat ditekan (tap) dan fungsi onTap untuk menampilkan pesan SnackBar.

14. Container: Memberikan struktur pada widget dengan padding, warna, dan properti lainnya di dalam ItemCard dan InfoCard.

15. Icon: Menampilkan ikon dalam setiap ItemCard, yang disesuaikan dengan ikon masing-masing item.

16. SnackBar: Menampilkan pesan sementara di bagian bawah layar saat sebuah ItemCard ditekan.

- Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

Fungsi setState() digunakan dalam widget stateful untuk memperbarui UI ketika ada perubahan pada data. Fungsi ini memberi tahu Flutter bahwa ada perubahan pada state, sehingga framework perlu me-render ulang bagian UI yang terdampak.

Variabel yang terdampak setState() biasanya adalah:
1. Variabel lokal dalam kelas stateful widget: Variabel ini berada di dalam kelas State dan digunakan dalam build() untuk menampilkan UI.
2. Data yang dipakai untuk menentukan kondisi tampilan: Seperti status login pengguna, mode gelap atau terang, item dalam shopping cart, dll.

- Jelaskan perbedaan antara const dengan final.
const dan final sama-sama immutable (tidak bisa diubah)
1. final
---Inisialisasi variabel final bisa dilakukan pada saat runtime, yaitu ketika program dijalankan.
---final cocok digunakan jika nilai variabel hanya ditentukan sekali, tetapi baru akan diketahui saat program berjalan.

2. const
---Variabel const nilainya sudah harus ditentukan pada compile-time (sebelum program dijalankan).
---const hanya bisa digunakan untuk nilai yang benar-benar tetap dan diketahui pada saat compile-time, seperti angka, string literal, atau objek yang ditandai dengan const.
---const lebih efisien karena Dart dapat mengoptimalkan penggunaan nilai-nilai konstan ini di memori

- Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial).
    • Membuat sebuah program Flutter baru dengan tema E-Commerce yang sesuai dengan tugas-tugas sebelumnya.
        - buat folder baru bernama abibas_shoes
        - menjalankan command flutter create
        - menjalankan git init dan menghubungkan dengan repo remote bernama abibas-shoes-mobile
        - menerapkan best practice dengan membuat menu.dart dan konfigurasi awal
    • Membuat tiga tombol sederhana dengan ikon dan teks untuk:
        • Melihat daftar produk (Lihat Daftar Produk)
        • Menambah produk (Tambah Produk)
        • Logout (Logout)
            -menambahkan class baru ItemHomePage yang berisi atribut dari card yaitu nama dan ikon
            -membuat list yang menyimpan instance dari ItemHomePage, yaitu 3 tombol tersebut
            -membuat class ItemCard yang akan menampilkan kartu dengan ikon dan nama
            -pada widget dari class MyHomePage, tambahkan GridView untuk menampilkan ItemCard dalam bentuk grid 3 kolom
    •Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).
        - menambahkan atribut warna pada class ItemHomePage
        - beri warna yang berbeda antar tombol pada list ItemHomePage yang ditampilkan widget MyHomePage.
        - alih-alih menggunakan warna tema, gunakan atribut warna setiap kartu di ItemCard
    •Memunculkan Snackbar dengan tulisan:
        •"Kamu telah menekan tombol Lihat Daftar Produk" ketika tombol Lihat Daftar Produk ditekan.
        •"Kamu telah menekan tombol Tambah Produk" ketika tombol Tambah Produk ditekan.
        •"Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.
            -Pada widget dari ItemCard, tambahkan onTap di child, lalu atur ScaffoldMessenger untuk menampilkan pesan sesuai nama tombol yang ditekan, menggunakan ${item.name}