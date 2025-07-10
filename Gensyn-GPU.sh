#!/bin/bash
set -e

# ===================== COLORS ======================
ORANGE='\033[1;33m'  
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'         

# ===================== ASCII HEADER ======================
echo -e "${ORANGE}"
echo "                                                                                                         "
echo "                    XXXXXXX       XXXXXXX  iiii                         999999999          888888888     "
echo "                    X:::::X       X:::::X i::::i                      99:::::::::99      88:::::::::88   "
echo "                    X:::::X       X:::::X  iiii                     99:::::::::::::99  88:::::::::::::88 "
echo "                    X::::::X     X::::::X                          9::::::99999::::::98::::::88888::::::8"
echo "xxxxxxx      xxxxxxxXXX:::::X   X:::::XXXiiiiiii nnnn  nnnnnnnn    9:::::9     9:::::98:::::8     8:::::8"
echo " x:::::x    x:::::x    X:::::X X:::::X   i:::::i n:::nn::::::::nn  9:::::9     9:::::98:::::8     8:::::8"
echo "  x:::::x  x:::::x      X:::::X:::::X     i::::i n::::::::::::::nn  9:::::99999::::::9 8:::::88888:::::8 "
echo "   x:::::xx:::::x        X:::::::::X      i::::i nn:::::::::::::::n  99::::::::::::::9  8:::::::::::::8  "
echo "    x::::::::::x         X:::::::::X      i::::i   n:::::nnnn:::::n    99999::::::::9  8:::::88888:::::8 "
echo "     x::::::::x         X:::::X:::::X     i::::i   n::::n    n::::n         9::::::9  8:::::8     8:::::8"
echo "     x::::::::x        X:::::X X:::::X    i::::i   n::::n    n::::n        9::::::9   8:::::8     8:::::8"
echo "    x::::::::::x    XXX:::::X   X:::::XXX i::::i   n::::n    n::::n       9::::::9    8:::::8     8:::::8"
echo "   x:::::xx:::::x   X::::::X     X::::::Xi::::::i  n::::n    n::::n      9::::::9     8::::::88888::::::8"
echo "  x:::::x  x:::::x  X:::::X       X:::::Xi::::::i  n::::n    n::::n     9::::::9       88:::::::::::::88 "
echo " x:::::x    x:::::x X:::::X       X:::::Xi::::::i  n::::n    n::::n    9::::::9          88:::::::::88   "
echo "xxxxxxx      xxxxxxxXXXXXXX       XXXXXXXiiiiiiii  nnnnnn    nnnnnn   99999999             888888888     "
echo -e "${NC}"
echo -e "${ORANGE}🚀 Welcome to the xXin98 Setup Script!${NC}"
echo -e "${CYAN}🐦 Follow us on Twitter: @xXin98 ${NC}"
sleep 3

# ===================== HELPER FUNCTIONS ======================
section() {
  echo -e "\n${YELLOW}🔧 $1...${NC}"
}

success() {
  echo -e "${GREEN}✅ $1 selesai!${NC}"
}

# ===================== MAIN SETUP ======================
section "Memperbarui sistem"
apt update && apt upgrade -y
success "Update & upgrade"

section "Menginstal paket umum"
apt install -y screen curl iptables build-essential git wget lz4 jq make gcc nano \
automake autoconf tmux htop nvme-cli libgbm1 pkg-config libssl-dev \
libleveldb-dev tar clang bsdmainutils ncdu unzip
success "Paket umum"

section "Menginstal Python dan pip"
apt install -y python3 python3-pip python3-venv python3-dev
success "Python"

# ===================== FIX Node.js v20.18.0 ======================
section "Menghapus Node.js lama (jika ada)"
apt remove -y nodejs || true
success "Node.js lama dihapus"

section "Menginstal 'n' (Node version manager)"
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o /usr/local/bin/n
chmod +x /usr/local/bin/n
success "n diinstal"

section "Menginstal Node.js versi 20.18.0"
n 20.18.0
success "Node.js v20.18.0 terinstal"

section "Menambahkan Node.js ke PATH (jika perlu)"
export PATH="/usr/local/bin:$PATH"
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
success "PATH disesuaikan"

section "Cek versi akhir Node.js dan npm"
node -v
npm -v

# ===================== Yarn ======================
section "Menginstal Yarn via npm"
npm install -g yarn
yarn -v
success "Yarn (npm)"

section "Menginstal Yarn via install.sh"
curl -o- -L https://yarnpkg.com/install.sh | bash
success "Yarn (install.sh)"

section "Menambahkan Yarn ke PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
echo 'export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
success "PATH Yarn"

# ===================== DONE ======================
echo -e "\n${ORANGE}🎉 Instalasi selesai !${NC}"
