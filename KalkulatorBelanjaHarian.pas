program KalkulatorBelanja; //nama program

uses crt; //untuk clrscr nanti

type //type yang digunakan program
    TBarang = record //record untuk menyimpan data barang
        Nama: string; //untuk menyimpan nama
        Harga: real; //untuk menyimpan harga
        Jumlah: integer; //untuk menyimpan jumlah
    end; //akhir dari record TBarang

var //variabel global yang digunakan
    Barang: array[0..100] of TBarang; //barang tipe data array dari tbarang
    TotalBiaya: real; //totalbiaya jenis data real
    N, i, diskon, tdiskon: integer; //n, i, diskon, tdiskon jenis data integer
    z : char; //z jenis data char


procedure InputBarang(var B: TBarang); // Prosedur untuk memasukkan data barang
begin //memulai prosedur InputBarang
    write('Masukkan nama barang: '); readln(B.Nama); //untuk input nama pada array barang ke-i
    write('Masukkan harga barang: '); readln(B.Harga); //untuk input harga pada array barang ke-i
    write('Masukkan jumlah barang: '); readln(B.Jumlah); //untuk input jumlah pada array barang ke-i
end; //akhir dari prosedur InputBarang


function HitungTotal(var Barang: array of TBarang; N: integer): real; // Fungsi untuk menghitung total biaya belanja
var
    Total: real; //variabel lokal total berjenis data real
begin //memulai fungsi HitungTotal
    Total := 0; //untuk menginisialisasi 0 ke total
    for i := 1 to N do //looping mulai dari 1 hingga ke n
        Total := Total + (Barang[i].Harga * Barang[i].Jumlah); //total diinisialisasi dari nilai total(untuk i = 1, total bernilai 0) ditambah hasil kali harga barang ke-i dan jumlah barang ke-i
    HitungTotal := Total; //HitungTotal diinisialisasi nilai total
end; //akhir dari fungsi HitungTotal


function HitungDiskon(Total: real): real; // Fungsi untuk menghitung diskon
begin //memulai fungsi HitungDiskon
    if Total >= tdiskon then //jika total lebih besar atau sama dengan nilai tdiskon maka
        HitungDiskon := Total * (diskon/100) //HitungDiskon diinisialisasi nilai total dikali diskon dibagi 100
    else //selain total lebih besar atau sama dengan tdiskon
        HitungDiskon := 0; //HitungDiskon diinisialisasi nilai 0
end; //akhir fungsi HitungDiskon


procedure CetakStruk(var Barang: array of TBarang; N: integer; Total: real); // Prosedur untuk menampilkan struk belanja
var
    Diskon: real; //menggunakan variabel lokal diskon berjenis data real
begin //memulai prosedur CetakStruk
    clrscr; //untuk menghapus layar
    writeln('--- STRUK BELANJA ---'); //menulis --- STRUK BELANJA ---
    for i := 1 to N do //perulangan untuk nilai 1 sampai ke n
    begin //memulai looping
        writeln('Barang ', i, ': ', Barang[i].Nama); //menulis Barang (nilai i sekarang) : (nama dari Barang ke-i)
        writeln('   Harga  : ', Barang[i].Harga:0:2); //menulis Harga : (harga dari Barang ke-i (nilai dibatasi 0:2))
        writeln('   Jumlah : ', Barang[i].Jumlah); //menulis Jumlah : (jumlah dari Barang ke-i)
        writeln('  Subtotal: ', (Barang[i].Harga * Barang[i].Jumlah):0:2); //menulis Subtotal: (barang ke-i dikali dengan jumlah barang ke-i)
        writeln; //agar ada kelang
    end; //akhir looping
    Diskon := HitungDiskon(Total); //menginisialisasi diskon dengan nilai dari fungsi HitungDiskon
    writeln('Total Biaya   : ', Total:0:2); //menulis Total Biaya : (nilai total(nilainya dibatasi 0:2))
    writeln('Diskon        : ', Diskon:0:2); //menulis Diskon : (nilai diskon(nilainya dibatasi 0:2))
    writeln('Total Setelah Diskon: ', (Total - Diskon):0:2); //menulis Total Setelah Diskon: (nilai Total dikurang nilai Diskon(nilainya dibatasi 0:2))
    writeln('--- Terima kasih ---'); //menulis ---Terima Kasih---
end; //akhir prosedur CetakStruk

begin //memulai program
    repeat //untuk perulangan (digunakan mengulang program)
    clrscr; //untuk membersihkan layar
    writeln('KALKULATOR BELANJA'); //menulis KALKULATOR BELANJA
    write('Masukkan jumlah barang: '); readln(N); //menulis Masukkan jumlah barang: . Lalu menginput nilai n
    write('Masukkan jumlah diskon: ');readln(diskon); //menulis Masukkan jumlah diskon: . Lalu menginput nilai diskon
    write('Diskon Setelah Total Berapa: ');readln(tdiskon); //menulis Diskon Setelah Total Berapa: . Lalu menginput nilai tdiskon
    
    for i := 1 to N do //perulangan untuk nilai 1 sampai ke nilai n
    begin //memulai looping
        writeln('Barang ke-', i, ':'); //menulis Barang ke-(nilai i) :
        InputBarang(Barang[i]); //parameter aktual untuk memulai prosedur InputBarang dengan isi array Barang ke-i
    end; //akhir looping
    
    TotalBiaya := HitungTotal(Barang, N); //menginisialisasi TotalBiaya dengan nilai dari fungsi HitungTotal 
    CetakStruk(Barang, N, TotalBiaya); //parameter aktual untuk memulai prosedur CetakStruk dengan isi array Barang, nilai N, dan nilai TotalBiaya
    writeln('Apakah anda ingin menghitung lagi?(Y/N)'); //menulis Apakah anda ingin menghitung laig?(Y/N)
    z := readkey; //menginisialisasi nilai z dengan readkey(agar tidak ada di layar)
    z := upcase(z); //menginisialisasi nilai z dengan huruf kapital dari nilai z
    until (z = 'N'); //perulangan program (berhenti jika menginput nilai N)
    writeln('Terima Kasih Telah Menggunakan Kalkulator Belanja'); //jika program berhenti maka akan menulis Terima Kasih Telah Menggunakan Kalkulator Belanja
    readln; //agar program tidak autoclose
end. //akhir dari program
