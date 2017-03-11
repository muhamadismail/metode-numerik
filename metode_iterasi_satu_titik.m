%%
% Metode iterasi satu titik untuk mencari akar x untuk suatu fungsi f(x).
% Sebelumnya, cari dulu g(x) dari f(x). x = g(x). 
% Cara pakenya misalnya:
% Cari akar buat fungsi:  f(x) = e^x - 3x 
%                         g(x) = e^x/3
%     metode_iterasi_satu_titik(@(x) exp(x)-3*x, @(x) exp(x)/3, 0, 10)
%
% @param f          Fungsi dari persamaan yang akan dicari akar x-nya.
% @param g          Fungsi g(x) yang didapat dari f(x). Ubah f(x) kedalam 
%                     bentuk x = g(x).
% @param x_a        Nilai x_i.
% @param max_iter   Jumlah pengulangan makismal.
%%
function metode_iterasi_satu_titik(f, g, x_a, max_iter)
  % Label Kepala Tabel
  printf("i \t")
  printf("x_i \t\t x_i+1 \t\t")
  printf("f(x_i) \t\t")
  printf("error(%%)\n\n")
  
  for i = 1:max_iter
    % Hitung titik x selanjutnya (x_i+1).
    x_b = g(x_a);
    % Hitung nilai error
    error = abs((x_b - x_a)/x_b);
    
    % Cetak nilai semua x dan semua f(x) nya dalam bentuk tabel.
    printf("%d \t", i)
    printf("%f \t %f \t", x_a, x_b)
    printf("%f \t", f(x_a))
    % Print Error.
    printf("%.2f\n", error * 100)
    
    % Ubah nilai x_i menjadi nilai x_i+1 untuk dipakai pada loop selanjutnya
    x_a = x_b;
    
  endfor
  
  % Print hasil (nilai x yang f(x) = 0)
  printf("Answer x = %f\n", x_a)
  
endfunction