%%
% Metode Newton-Rhapson untuk mencari akar x untuk suatu fungsi f(x). 
% Untuk metode ini, fungsi f(x) harus dicari turunannya secara manual karena
% nyari turunan dari f(x) ternyata agak ribet kalau dan untuk persamaan yang
% rumit, bakal lebih sulit. Hasil turunannya dimasukan ke parameter f_d.
%
% Cara pakenya misalnya:
% Nyari akar buat fungsi: f(x) = e^x - 3x
%     metode_newton_rhapson(@(x) exp(x)-3*x, @(x) x*exp(x)-3, 0.5, 10)
%
% @param f          Fungsi dari persamaan yang akan dicari akar x-nya.
% @param f_d        f'(x) atau turunan dari fungsi f(x).
% @param x_a        Nilai x_i (x awal).
% @param max_iter   Jumlah pengulangan makismal.
%%
function metode_newton_rhapson(f, f_d, x_a, max_iter)
  
  % Label Kepala Tabel
  printf('i \t')
  printf('x_i \t\t x_i+1 \t\t')
  printf('f(x_i) \t f(x_i+1) \t\t')
  printf('error(%%)\n\n')
  
  for i = 1:max_iter
    
    % Kalau nilai f'(x) (turunan dari fungsi f(x)) yang jadi denominatornya)
    % adalah 0, hentikan loop.
    if f_d(x_a) == 0
      printf('\nLoop berhenti. f'(x_i) bernilai 0\n')
      break
      
    else
      % Hitung dengan metode Newton-Rhapson
      x_b = x_a - f(x_a)/f_d(x_a);
      
      % Cetak nilai x_i, x_i+i, dan f(x_i) dan f(x_i+1).
      % Cetak juga nilai errornya (mohon dicek apakah salah caranya?).
      printf('%d \t', i)
      printf('%f \t %f \t', x_a, x_b)
      printf('%f \t %f \t %f \t\t', f(x_a), f(x_b))
      printf('%.2f\n', (abs((x_b - x_a)/x_a) * 100))
      
      % Ganti nilai x_i atau x_a ke nilai x_i+1 atau x_b.
      x_a = x_b;
      
    endif
    
  endfor
  
  % Print hasil (nilai x yang f(x) = 0)
  printf('Answer x = %f\n', x_a)
  
endfunction