import 'dart:io';

void main() {
  // Membuat list kosong untuk menyimpan daftar tugas
  List<String> todoList = [];

  // Menu utama
  while (true) {
    print("\n===== Aplikasi To-Do List =====");
    print("1. Tambah Tugas");
    print("2. Lihat Tugas");
    print("3. Hapus Tugas");
    print("4. Keluar");
    stdout.write("Pilih opsi (1/2/3/4): ");
    String? pilihan = stdin.readLineSync();

    if (pilihan == '1') {
      // Tambah tugas baru
      stdout.write("Masukkan nama tugas: ");
      String? tugasBaru = stdin.readLineSync();
      if (tugasBaru != null && tugasBaru.isNotEmpty) {
        todoList.add(tugasBaru);
        print("Tugas '$tugasBaru' berhasil ditambahkan.");
      } else {
        print("Tugas tidak boleh kosong.");
      }
    } else if (pilihan == '2') {
      // Menampilkan daftar tugas
      if (todoList.isEmpty) {
        print("Tidak ada tugas dalam daftar.");
      } else {
        print("\n===== Daftar Tugas =====");
        for (int i = 0; i < todoList.length; i++) {
          print("${i + 1}. ${todoList[i]}");
        }
      }
    } else if (pilihan == '3') {
      // Menghapus tugas berdasarkan nomor urut
      if (todoList.isEmpty) {
        print("Tidak ada tugas untuk dihapus.");
      } else {
        print("\n===== Hapus Tugas =====");
        for (int i = 0; i < todoList.length; i++) {
          print("${i + 1}. ${todoList[i]}");
        }
        stdout.write("Masukkan nomor tugas yang ingin dihapus: ");
        String? inputNomor = stdin.readLineSync();
        int? nomorTugas = int.tryParse(inputNomor ?? '');
        if (nomorTugas != null &&
            nomorTugas > 0 &&
            nomorTugas <= todoList.length) {
          String tugasDihapus = todoList.removeAt(nomorTugas - 1);
          print("Tugas '$tugasDihapus' berhasil dihapus.");
        } else {
          print("Nomor tugas tidak valid.");
        }
      }
    } else if (pilihan == '4') {
      // Keluar dari program
      print("Terima kasih telah menggunakan aplikasi To-Do List.");
      break;
    } else {
      print("Pilihan tidak valid. Silakan coba lagi.");
    }
  }
}
