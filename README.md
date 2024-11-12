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


**Tugas Individu 8
- Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
Const digunakan untuk mendeklarasikan objek atau widget yang tidak akan berubah setelah dibuat.

Keuntungan menggunakan const:
1. Mengurangi Penggunaan Memori:
Karena objek const hanya dibuat sekali, penggunaan memori lebih efisien dibandingkan dengan membuat objek baru setiap kali diperlukan.

2. Optimisasi Waktu Eksekusi:
const memungkinkan Flutter melakukan optimisasi pada rendering dan re-building widget. Flutter akan memeriksa apakah objek yang sama digunakan berulang kali dan tidak perlu di-rebuild.

3. Reusabilitas:
Widget atau objek yang dideklarasikan sebagai const dapat digunakan berkali-kali tanpa proses tambahan, yang sangat membantu jika kita menggunakan widget yang sama di banyak tempat.

4. Meminimalisir munculnya bug/error:
Dengan mendeklarasikan sesuatu sebagai const, kita memastikan bahwa objek tersebut tidak akan diubah selama aplikasi berjalan, yang membantu menghindari bugs terkait perubahan yang tidak diinginkan.

Kapan sebaiknya digunakan?
Gunakan const ketika objek atau widget kita tidak berubah setelah pembuatan, seperti widget statis yang sering digunakan di aplikasi. Ini akan menghemat memori, meningkatkan performa, dan memastikan pengelolaan memori yang lebih efisien.

Kapan sebaiknya tidak digunakan?
Hindari const pada widget atau objek yang melibatkan perubahan dinamis atau interaksi pengguna, seperti widget yang bergantung pada state atau input yang berubah, karena ini bisa menyebabkan kesalahan atau kegagalan dalam pembaruan tampilan.

- Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
Di Flutter, Column dan Row adalah dua widget layout yang digunakan untuk menyusun widget lainnya dalam urutan vertikal  (column) dan horizontal (row). 
Perbandingan penggunaan Column dan Row adalah pada Column, arah layoutnya Vertikal (atas ke bawah) dan umumnya penggunaannya untuk mengatur elemen-elemen yang berada di bawah satu sama lain (formulir, daftar vertikal). Sedangkan pada Row, arah layoutnya Horizontal (kiri ke kanan) dan umumnya penggunaannya untuk mengatur elemen-elemen yang berada di samping satu sama lain (tombol, ikon).

Contoh penggunaan column:
Column(
  mainAxisAlignment: MainAxisAlignment.center, // Posisi vertikal tengah
  crossAxisAlignment: CrossAxisAlignment.start, // Posisi horizontal kiri
  children: <Widget>[
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
)

Contoh penggunaan row:
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ruang antar widget
  crossAxisAlignment: CrossAxisAlignment.center, // Posisi vertikal tengah
  children: <Widget>[
    Icon(Icons.star),
    Text('Item 1'),
    Icon(Icons.star),
  ],
)


- Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Elemen Input yang Digunakan:
1. TextFormField untuk "Name":
Digunakan untuk menerima input teks berupa nama produk.

2. TextFormField untuk "Price":
Digunakan untuk menerima input harga produk. 

3. TextFormField untuk "Description":
Digunakan untuk menerima deskripsi produk.

4. Radio untuk "Type":
Digunakan untuk memilih jenis produk (hanya bisa memilih 1).

5. Radio untuk "Materials":
Digunakan untuk memilih jenis material produk (hanya bisa memilih 1).

6. ElevatedButton untuk "Save":
Digunakan untuk memproses data form dan menampilkan dialog jika form berhasil disubmit.
Memiliki aksi onPressed yang akan memvalidasi form dan jika valid, menampilkan data dalam dialog.

Elemen Input Flutter Lain yang Tidak Digunakan:
1. Checkbox:
Jika ingin menambahkan pilihan biner (misalnya, untuk memilih apakah produk dalam keadaan aktif atau tidak), Checkbox bisa digunakan.

2. Switch:
Untuk menggantikan checkbox dalam konteks pilihan on/off, Switch bisa digunakan, misalnya untuk menandai apakah produk sedang dalam diskon atau tidak.

3. DropdownButton:
Jika ingin menambahkan pilihan dari daftar (misalnya, kategori produk), elemen DropdownButton bisa digunakan sebagai alternatif dari TextFormField dengan input bebas.

4. DatePicker:
Jika form perlu memasukkan tanggal (misalnya, tanggal mulai atau berakhirnya diskon atau promo), DatePicker dari paket flutter_datetime_picker bisa digunakan untuk memilih tanggal dengan format yang benar.

5. Slider:
Jika ingin menambahkan input berupa rentang angka (misalnya, untuk memilih rating atau tingkat kepuasan), Slider bisa digunakan.

6. TextField:
Berbeda dengan TextFormField, TextField adalah widget input teks dasar tanpa validasi. Meskipun tidak sepopuler TextFormField yang lebih sering digunakan bersama dengan GlobalKey<FormState>, TextField tetap bisa digunakan jika validasi manual diperlukan.

- Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Untuk membuat aplikasi Flutter yang konsisten, kita bisa menggunakan tema (theme) untuk menyatukan tampilan seluruh aplikasi. Tema memungkinkan kita untuk mengatur elemen-elemen UI seperti warna, font, ukuran teks, dan gaya elemen lainnya di seluruh aplikasi secara konsisten tanpa perlu mengubah setiap elemen UI secara manual. 

Ya, saya menerapkan tema yaitu warna abu-abu di aplikasi saya yang ditunjukkan dengan potongan kode berikut
colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.grey,
        ).copyWith(secondary: const Color.fromARGB(255, 92, 91, 88)),
pada main.dart

- Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
1. Penggunaan Drawer untuk Navigasi
Drawer adalah widget yang digunakan untuk menampilkan menu navigasi di sisi kiri layar (seperti menu samping). Di dalam aplikasi saya, terdapat Drawer yang berisi 2 tombol yaitu Halaman Utama dan Tambah Item yang akan mengarahkan ke halaman sesuai namanya.
2. Navigasi Menggunakan Navigator.pushReplacement
Pada setiap onTap dari ListTile pada Drawer, navigasi dilakukan menggunakan Navigator.pushReplacement. Metode ini berfungsi untuk menggantikan halaman saat ini dengan halaman baru, sehingga halaman sebelumnya tidak akan muncul dalam stack navigasi.
3.  Navigasi Menggunakan Navigator.pushReplacement
Pada onTap dari InkWell pada kartu tambah item, navigasi dilakukan menggunakan Navigator.push. Method push() menambahkan suatu route ke dalam stack route yang dikelola oleh Navigator. Method ini menyebabkan route yang ditambahkan berada pada paling atas stack, sehingga route yang baru saja ditambahkan tersebut akan muncul dan ditampilkan kepada pengguna.