# จำลอง server ubuntu มากกว่า 1 ในเครื่อง โดยใช้ docker

## หากมี username password ใหม่ ให้ทำ

```bash

# 1. สร้าง users.txt ตามฟอร์แมต (username password)

student01 S1n7xxXx@01

# 2. รัน generate
./generate-compose.sh > docker-compose.yml

# 3. สั่งรัน Docker Compose
docker compose up -d --build

# 4. SSH เข้าใช้งาน

ssh student01@localhost -p 2201

```

### โครงสร้างไฟล์ Dockerfile

```bash

ubuntu-class/
├── create-users.sh         # สคริปต์สร้าง user ภายใน container
├── docker-compose.yml      # ไฟล์ compose ที่ generate แล้ว
├── Dockerfile              # Image base ที่ใช้รัน sshd + สร้าง user
├── generate-compose.sh     # สคริปต์สำหรับสร้าง docker-compose.yml จาก users.txt
├── readme.md               # อธิบายวิธีใช้ ระบบทั้งหมด
└── users.txt               # รายชื่อ user และ password

```
