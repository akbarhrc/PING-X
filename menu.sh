#!/bin/bash

# Daftar file/script
files=("wiko_soreang.sh" "wiko_bojong.sh")

# Warna ANSI escape codes
WarnaHijau="\033[32m"
WarnaMerah="\033[31m"
WarnaPutih="\033[37m"
WarnaReset="\033[0m"

# Fungsi untuk menampilkan animasi loading
function loading_animation {
    echo -n "Memuat"
    for i in {1..3}
    do
        sleep 0.5
        echo -n "."
    done
    echo ""
}

# Fungsi untuk menampilkan menu
function show_menu {
    clear
    echo -e "${WarnaHijau}========================================="
    echo -e "${WarnaHijau}   AKBAR JAYA CLONE"
    echo -e "${WarnaHijau}=========================================${WarnaReset}"

    # Menampilkan daftar file/script dengan nomor
    for i in "${!files[@]}"; do
        echo "$((i+1)). ${files[$i]}"
    done
    echo "0. Kembali"
    echo ""
}

# Menampilkan menu dan meminta input pengguna
while true; do
    show_menu
    read -p "Masukkan nomor pilihan Anda: " choice

    # Menangani pilihan pengguna
    if [[ $choice =~ ^[0-9]+$ ]]; then
        if ((choice == 0)); then
            echo -e "${WarnaHijau}Kembali ke menu utama...${WarnaReset}"
            break  # Keluar dari menu untuk kembali
        elif ((choice >= 1 && choice <= ${#files[@]})); then
            selected_file="${files[$((choice-1))]}"

            # Menampilkan animasi loading
            loading_animation

            # Mengeksekusi file jika script dapat dijalankan
            if [[ -x "$selected_file" ]]; then
                echo -e "${WarnaHijau}Menjalankan script: $selected_file...${WarnaReset}"
                ./"$selected_file"
            else
                echo -e "${WarnaMerah}File yang dipilih tidak dapat dijalankan: $selected_file${WarnaReset}"
            fi
        else
            echo -e "${WarnaMerah}Pilihan tidak valid!${WarnaReset}"
        fi
    else
        echo -e "${WarnaMerah}Pilihan tidak valid!${WarnaReset}"
    fi
done
