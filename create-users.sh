#!/bin/bash

USERNAME=${USERNAME:-student}
PASSWORD=${PASSWORD:-password}

# สร้าง host key สำหรับ SSH (ถ้าไม่มี)
if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then
  ssh-keygen -A
fi

# สร้าง user ถ้ายังไม่มี
if ! id "$USERNAME" &>/dev/null; then
  useradd -m -s /bin/bash "$USERNAME"
  echo "$USERNAME:$PASSWORD" | chpasswd
  echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
fi

# เริ่ม sshd
exec /usr/sbin/sshd -D
