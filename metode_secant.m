%%
% Metode untuk mencari akar x untuk suatu fungsi f(x). Cara pakenya misalnya:
% Nyari akar buat fungsi: f(x) = e^x - 3x
%     metode_secant(@(x) exp(x)-3*x, 1, 2, 10)
%
% @param f          Fungsi dari persamaan yang akan dicari akar x-nya.
% @param x_a        Nilai x_i-1.
% @param x_b        Nilai x_i.
% @param max_iter   Jumlah pengulangan makismal.
%%
function metode_secant(f, x_a, x_b, max_iter)
  
  % Label Kepala Tabel
  printf('i \t')
  printf('x_i-1 \t\t x_i \t\t x_i+1 \t\t')
  printf('f(x_i-1) \t f(x_i) \t f(x_i+1) \t\t')
  printf('error(%%)\n\n')
  
  for i = 1:max_iter
    
    denominator = f(x_b) - f(x_a);
    
    % Kalau pembaginya nilainya 0, loopnya harus berhenti. Soalnya kalau
    % sesuatu dibagi 0 kan tak higga.
    if denominator == 0
      printf('\nLoop berhenti. Pembagi bernilai 0\n')
      break

    else
      % Denominator engga 0, proses hitung nilai x yang baru bisa dilakukan.
      x_baru = x_b - f(x_b) * (x_b - x_a) / denominator;
      
      % Cetak nilai semua x dan semua f(x) nya dalam bentuk tabel.
      printf('%d \t', i)
      printf('%f \t %f \t %f \t', x_a, x_b, x_baru)
      printf('%f \t %f \t %f \t\t', f(x_a), f(x_b), f(x_baru))
      % Cari nilai error.
      printf('%.2f\n', (abs((x_b - x_baru)/x_b) * 100))
      
      % Ganti x_a jadi x_b
      % trus ganti juga x_b jadi x_baru
      x_a = x_b;
      x_b = x_baru;
      
    endif
    
  endfor
  
  % Print hasil (nilai x yang f(x) = 0)
  printf('Answer x = %f\n', x_b)

endfunction