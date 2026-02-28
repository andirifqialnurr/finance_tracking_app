# Finance Tracking App - Arsitektur & Flow (v2)

> **Last Updated**: February 28, 2026
> **Status Backend**: Phase 4 — Account Management, Transfer, OneSignal, Advanced Analytics

---

## 📋 Deskripsi Umum

Aplikasi finance tracking pribadi untuk membantu tracking pemasukan dan pengeluaran dengan manajemen akun (Card/Cash/Savings), transfer antar akun, sistem alokasi otomatis dari gaji, kategori pengeluaran kustom, dan notifikasi berbasis jadwal via OneSignal.

---

## 🎯 Fitur Utama

### 1. Account Management (Akun Dana)
- Tiga jenis akun: **Card**, **Cash**, **Savings**
- User bisa punya **lebih dari 1 Card**
- Setiap akun memiliki fitur:
  - **Edit**: Ubah nama, warna, atau keterangan akun
  - **Top Up (Income)**: Tambah saldo masuk ke akun
  - **Spent**: Catat pengeluaran langsung dari akun
  - **Transfer**: Transfer dana ke akun lain
  - **Archive**: Nonaktifkan akun (soft delete)
- **Card** memiliki sub-kategori sumber pendapatan:
  - `SALARY` — Gaji tetap bulanan
  - `PROJECT` — Honorarium / project fee
  - `FREELANCE` — Pendapatan lepas
  - `BUSINESS` — Pendapatan usaha
  - `OTHER` — Lainnya
- **Savings** memiliki:
  - `current_balance` — Saldo terkini
  - `goal_amount` — Target tabungan
  - `goal_label` — Tujuan tabungan (mis: "Liburan Bali", "Gadget Baru")
  - Progress persentase menuju goal
- **Cash** memiliki saldo aktual uang tunai

### 2. Transfer Antar Akun
- Dana dapat dipindahkan bebas antar Card, Cash, dan Savings
- Transfer mencatat: akun sumber, akun tujuan, jumlah, catatan, tanggal
- Transfer tidak mempengaruhi budget allocation — hanya memindahkan saldo fisik
- History transfer tersimpan per akun
- Transfer bisa di-cancel dalam 24 jam (rollback saldo)

### 3. Income Management (Pemasukan)
- Setiap pemasukan **di-link ke akun** sumber dana
- Jika akun tipe `Card` dengan `income_type = SALARY`:
  - **Auto-trigger alokasi budget** ke semua kategori aktif
  - Jika bulan itu belum ada alokasi, otomatis dibuat
  - Jika sudah ada alokasi, sistem memperingatkan dan minta konfirmasi re-alokasi
- Income non-SALARY tidak mentrigger auto-allocation

### 4. Expense Management (Pengeluaran)
- Setiap pengeluaran di-link ke akun sumber dana
- Saldo akun terkurang otomatis setiap expense dicatat
- **Tipe Kategori Pengeluaran:**
  - `SUBSCRIPTION` — Bulanan tetap (Netflix, Spotify)
  - `DAILY_CONTINUOUS` — Harian berulang dengan nominal kustom per hari
  - `USAGE_BASED` — Berbasis penggunaan dengan budget tetap (Bensin, Listrik)
  - `ONE_TIME` — Sekali bayar

- **DAILY_CONTINUOUS custom per bulan**:
  - User menetapkan nominal harian (mis.: Rp 40.000/hari untuk makan)
  - Sistem menghitung otomatis: `daily_amount x days_in_month`
  - Januari (31 hari): Rp 1.240.000
  - Februari (28 hari): Rp 1.120.000
  - Tidak perlu set ulang manual tiap bulan

### 5. Budget Auto-Allocation
- Saat income dari akun SALARY masuk, otomatis alokasikan ke semua kategori aktif
- Alokasi berdasarkan persentase proporsional dari total monthly budget semua kategori
- Validasi tidak ada double-alokasi di bulan yang sama
- Real-time update sisa budget setelah expense dicatat

### 6. Statistics & Analytics
- **Monthly Statistics**: Total income dan expense per bulan
- **Account Balance Overview**: Saldo semua akun real-time
- **Budget Performance**: Kategori over/under budget
- **Spending Patterns**: Trend konsumsi 6 bulan terakhir
- **Transfer History**: Riwayat aliran dana antar akun

### 7. Budget Management
- Auto-Reset tiap awal bulan
- Unused budget: rollover atau reset ke 0 (configurable)
- Budget Alerts: Warning ketika budget hampir habis (configurable threshold)
- Manual Budget Reallocation antar kategori

### 8. Notification & Reminder (OneSignal)
- Reminder jadwal alokasi dana (mis.: "Tanggal 25, setting alokasi gaji")
- Jadwal reminder bisa dikonfigurasi: tanggal berapa, jam berapa
- Alert budget habis/hampir habis
- Reminder goal savings progress
- **Scheduled Fund**: Transfer atau top-up terjadwal ke akun tertentu tiap bulan

---

## 🏗️ Arsitektur Sistem

```
+---------------------------------------------------------+
|                     Mobile/Web App                      |
|                    (Flutter/React)                      |
+---------------------------------------------------------+
                            |
                            | HTTP/REST API
                            v
+---------------------------------------------------------+
|                   Backend API (Go)                      |
|  +----------------------------------------------------+ |
|  |              API Handlers Layer                    | |
|  |  - Account Handler      (NEW)                      | |
|  |  - Transfer Handler     (NEW)                      | |
|  |  - Income Handler       (Updated)                  | |
|  |  - Expense Handler      (Updated)                  | |
|  |  - Category Handler     (Updated)                  | |
|  |  - Budget Handler                                  | |
|  |  - Transaction Handler  (Updated)                  | |
|  |  - Statistics Handler   (NEW)                      | |
|  |  - Analytics Handler                               | |
|  |  - Report Handler                                  | |
|  |  - Alert Handler                                   | |
|  |  - Notification Handler (NEW)                      | |
|  +----------------------------------------------------+ |
|                           |                             |
|  +----------------------------------------------------+ |
|  |           Business Logic Layer                     | |
|  |  - Account Service          (NEW)                  | |
|  |  - Transfer Service         (NEW)                  | |
|  |  - Budget Allocation Service (Updated)             | |
|  |  - Category Service         (Updated)              | |
|  |  - Statistics Service       (NEW)                  | |
|  |  - Notification Service     (NEW - OneSignal)      | |
|  |  - Scheduler Service        (Updated)              | |
|  |  - Analytics Service                               | |
|  |  - Alert Service                                   | |
|  +----------------------------------------------------+ |
|                           |                             |
|  +----------------------------------------------------+ |
|  |              Data Access Layer                     | |
|  |  - Account Repository       (NEW)                  | |
|  |  - Transfer Repository      (NEW)                  | |
|  |  - Notification Repository  (NEW)                  | |
|  |  - Scheduled Fund Repository (NEW)                 | |
|  |  - Income Repository                               | |
|  |  - Expense Repository                              | |
|  |  - Category Repository                             | |
|  |  - Budget Repository                               | |
|  +----------------------------------------------------+ |
+---------------------------------------------------------+
                            |
                            v
+---------------------------------------------------------+
|                PostgreSQL Database                      |
|  - accounts             (NEW)                           |
|  - account_transfers    (NEW)                           |
|  - scheduled_funds      (NEW)                           |
|  - notification_settings (NEW)                          |
|  - incomes              (Updated: +account_id)          |
|  - expenses             (Updated: +account_id)          |
|  - expense_categories   (Updated: +daily_amount)        |
|  - category_budgets     (Updated: +days_in_month)       |
|  - budget_allocations                                   |
|  - budget_reallocations                                 |
|  - budget_alerts                                        |
|  - monthly_reports                                      |
+---------------------------------------------------------+
                            |
                            v
+---------------------------------------------------------+
|              External Services                          |
|  - OneSignal (Push Notifications)                       |
+---------------------------------------------------------+
```

---

## 📊 Database Schema

### Table: `accounts` (NEW)
Menyimpan semua akun dana pengguna

```sql
id              UUID PRIMARY KEY
name            VARCHAR(100) NOT NULL       -- "BCA Payroll", "Dompet", "Tabungan Bali"
type            VARCHAR(20) NOT NULL        -- "CARD" | "CASH" | "SAVINGS"
income_type     VARCHAR(30)                 -- HANYA type=CARD: "SALARY"|"PROJECT"|"FREELANCE"|"BUSINESS"|"OTHER"
balance         DECIMAL(15,2) DEFAULT 0    -- Saldo terkini
color           VARCHAR(10)                 -- Hex color (#4CAF50)
description     TEXT
is_active       BOOLEAN DEFAULT true
-- Khusus SAVINGS:
goal_amount     DECIMAL(15,2)              -- Target saldo (nullable)
goal_label      VARCHAR(200)               -- Label tujuan (nullable)
created_at      TIMESTAMP
updated_at      TIMESTAMP
```

**Business Rules:**
- `income_type` hanya diisi jika `type = CARD`
- `goal_amount` dan `goal_label` hanya relevan jika `type = SAVINGS`
- Satu user boleh memiliki banyak `CARD`
- Archiving (is_active=false) tidak menghapus histori transaksi

---

### Table: `account_transfers` (NEW)
History semua transfer antar akun

```sql
id                UUID PRIMARY KEY
from_account_id   UUID REFERENCES accounts(id) NOT NULL
to_account_id     UUID REFERENCES accounts(id) NOT NULL
amount            DECIMAL(15,2) NOT NULL
note              TEXT
transfer_date     TIMESTAMP NOT NULL
created_at        TIMESTAMP
updated_at        TIMESTAMP

CONSTRAINT chk_different_accounts CHECK (from_account_id <> to_account_id)
CONSTRAINT chk_amount_positive CHECK (amount > 0)
```

---

### Table: `scheduled_funds` (NEW)
Jadwal top-up atau transfer terjadwal (recurring monthly)

```sql
id                UUID PRIMARY KEY
account_id        UUID REFERENCES accounts(id) NOT NULL    -- Akun tujuan top-up atau sumber transfer
from_account_id   UUID REFERENCES accounts(id)             -- Akun sumber (nullable; untuk TOP_UP = null)
schedule_type     VARCHAR(20) NOT NULL                     -- "TOP_UP" | "TRANSFER"
amount            DECIMAL(15,2) NOT NULL
day_of_month      INT NOT NULL                             -- 1-31; 0 = akhir bulan
description       TEXT
is_active         BOOLEAN DEFAULT true
last_executed_at  TIMESTAMP
next_execute_at   TIMESTAMP NOT NULL                       -- Jadwal eksekusi berikutnya (computed)
created_at        TIMESTAMP
updated_at        TIMESTAMP

CONSTRAINT chk_amount CHECK (amount > 0)
CONSTRAINT chk_day CHECK (day_of_month BETWEEN 0 AND 31)
```

---

### Table: `notification_settings` (NEW)
Konfigurasi reminder & notifikasi via OneSignal

```sql
id                    UUID PRIMARY KEY
type                  VARCHAR(50) NOT NULL     -- "ALLOCATION_REMINDER"|"BUDGET_ALERT"|"SAVINGS_GOAL"|"SCHEDULED_FUND"
title                 VARCHAR(200) NOT NULL
body                  TEXT NOT NULL
day_of_month          INT NOT NULL             -- Tanggal reminder (1-31), 0 = akhir bulan
time_of_day           VARCHAR(5) NOT NULL      -- Format "HH:MM" (e.g., "09:00")
is_enabled            BOOLEAN DEFAULT true
onesignal_player_id   VARCHAR(200) NOT NULL    -- OneSignal Player/Subscription ID perangkat
last_sent_at          TIMESTAMP
created_at            TIMESTAMP
updated_at            TIMESTAMP
```

---

### Table: `incomes` (Updated)
Ditambahkan relasi ke akun sumber dana

```sql
id              UUID PRIMARY KEY
account_id      UUID REFERENCES accounts(id) NOT NULL   -- NEW
source          VARCHAR(100) NOT NULL
amount          DECIMAL(15,2) NOT NULL
date            TIMESTAMP NOT NULL
description     TEXT
created_at      TIMESTAMP
updated_at      TIMESTAMP
```

---

### Table: `expenses` (Updated)
Ditambahkan relasi ke akun sumber dana

```sql
id              UUID PRIMARY KEY
account_id      UUID REFERENCES accounts(id) NOT NULL   -- NEW
category_id     UUID REFERENCES expense_categories(id) NOT NULL
amount          DECIMAL(15,2) NOT NULL
date            TIMESTAMP NOT NULL
description     TEXT
created_at      TIMESTAMP
updated_at      TIMESTAMP
```

---

### Table: `expense_categories` (Updated)
Master kategori pengeluaran — ditambahkan daily_amount

```sql
id                  UUID PRIMARY KEY
name                VARCHAR(100) NOT NULL
type                VARCHAR(50) NOT NULL       -- SUBSCRIPTION | DAILY_CONTINUOUS | USAGE_BASED | ONE_TIME
monthly_budget      DECIMAL(15,2) NOT NULL     -- Default; untuk DAILY_CONTINUOUS di-override tiap bulan
daily_amount        DECIMAL(15,2)              -- NEW: HANYA DAILY_CONTINUOUS; nominal per hari
allocation_priority INT NOT NULL DEFAULT 1
is_active           BOOLEAN DEFAULT true
metadata            JSONB
created_at          TIMESTAMP
updated_at          TIMESTAMP
```

**Logika DAILY_CONTINUOUS Budget Calculation:**
```
effective_monthly_budget = daily_amount x days_in_month(month, year)

Contoh kategori "Makan", daily_amount = 40000:
  - Januari 2026  (31 hari): 40000 x 31 = Rp 1.240.000
  - Februari 2026 (28 hari): 40000 x 28 = Rp 1.120.000
  - Februari 2028 (29 hari): 40000 x 29 = Rp 1.160.000
  - Maret 2026    (31 hari): 40000 x 31 = Rp 1.240.000
```

---

### Table: `category_budgets` (Updated)
Budget real-time per kategori per bulan — ditambahkan snapshot harian

```sql
id                    UUID PRIMARY KEY
category_id           UUID REFERENCES expense_categories(id) NOT NULL
month                 INT NOT NULL
year                  INT NOT NULL
allocated_amount      DECIMAL(15,2) NOT NULL DEFAULT 0
spent_amount          DECIMAL(15,2) NOT NULL DEFAULT 0
remaining_amount      DECIMAL(15,2) NOT NULL DEFAULT 0
effective_daily_amount DECIMAL(15,2)         -- NEW: snapshot daily_amount saat alokasi (DAILY_CONTINUOUS)
days_in_month         INT                    -- NEW: snapshot jumlah hari bulan tsb (DAILY_CONTINUOUS)
created_at            TIMESTAMP
updated_at            TIMESTAMP

UNIQUE(category_id, month, year)
```

---

### Table: `budget_allocations`
History alokasi budget dari income ke kategori

```sql
id               UUID PRIMARY KEY
income_id        UUID REFERENCES incomes(id)
category_id      UUID REFERENCES expense_categories(id)
allocated_amount DECIMAL(15,2) NOT NULL
month            INT NOT NULL
year             INT NOT NULL
created_at       TIMESTAMP
```

---

### Table: `budget_reallocations`
Manual realokasi budget antar kategori

```sql
id                  UUID PRIMARY KEY
from_category_id    UUID REFERENCES expense_categories(id)
to_category_id      UUID REFERENCES expense_categories(id)
amount              DECIMAL(15,2) NOT NULL
reason              TEXT
month               INT NOT NULL
year                INT NOT NULL
created_at          TIMESTAMP
```

---

### Table: `budget_alerts`
Konfigurasi alert per kategori

```sql
id                    UUID PRIMARY KEY
category_id           UUID REFERENCES expense_categories(id) UNIQUE
threshold_percentage  INT NOT NULL DEFAULT 80
is_enabled            BOOLEAN DEFAULT true
last_triggered        TIMESTAMP
created_at            TIMESTAMP
updated_at            TIMESTAMP
```

---

### Table: `monthly_reports`
Snapshot keuangan per bulan

```sql
id                  UUID PRIMARY KEY
month               INT NOT NULL
year                INT NOT NULL
total_income        DECIMAL(15,2)
total_allocated     DECIMAL(15,2)
total_spent         DECIMAL(15,2)
total_remaining     DECIMAL(15,2)
unallocated         DECIMAL(15,2)
savings             DECIMAL(15,2)
top_category        VARCHAR(100)
top_category_amount DECIMAL(15,2)
generated_at        TIMESTAMP
created_at          TIMESTAMP

UNIQUE(month, year)
```

---

## 🔄 Flow Diagram

### Flow 1: Buat Akun Baru
```
User Input:
  - type: CARD | CASH | SAVINGS
  - name, color, description
  - income_type (wajib jika CARD)
  - goal_amount, goal_label (opsional; hanya SAVINGS)
  - initial_balance (opsional, default 0)
            |
            v
Validasi:
  - type wajib & valid
  - income_type wajib jika type=CARD
  - goal fields hanya valid jika type=SAVINGS
  - name tidak boleh kosong
            |
            v
INSERT ke `accounts` (is_active=true)
            |
            v
Return created account
```

---

### Flow 2: Top Up Akun (Income ke Akun)
```
User Input:
  - account_id
  - amount, source, date, description
            |
            v
Validasi:
  - account exists & is_active = true
  - amount > 0
            |
            v
BEGIN TRANSACTION
            |
            v
INSERT ke `incomes` (account_id, source, amount, date, description)
            |
            v
UPDATE accounts SET balance = balance + amount WHERE id = account_id
            |
            v
Cek: account.type=CARD AND account.income_type=SALARY?
  |                                                 |
  YES                                              NO
  |                                                 |
  v                                                 v
Cek: sudah ada                            COMMIT, return income
budget_allocations untuk                  + updated account balance
bulan ini dari akun ini?
  |                        |
  BELUM ADA               SUDAH ADA
  |                        |
  v                        v
Trigger Flow 3            COMMIT, return income
(Auto-Allocation)         + warning: "Alokasi bulan ini
                           sudah ada. Lakukan realokasi
                           manual jika diperlukan."
```

---

### Flow 3: Auto-Allocation dari Gaji (SALARY Card Income)
```
Input: income (sudah tersimpan), month, year
            |
            v
Ambil semua expense_categories WHERE is_active = true
            |
            v
Hitung effective_monthly_budget per kategori:
  - type = DAILY_CONTINUOUS:
      days = days_in_month(month, year)
      effective_budget = daily_amount x days
  - Lainnya: monthly_budget (nilai tetap)
            |
            v
total_effective_budget = SUM(effective_budget semua kategori)
            |
            v
Loop setiap kategori:
  allocation_amount = (cat.effective_budget / total_effective_budget) x income.amount

  Apakah category_budget (category_id, month, year) sudah ada?
  |                        |
  BELUM                   SUDAH
  |                        |
  v                        v
CREATE category_budget    UPDATE category_budget
  allocated = allocation    allocated += allocation
  spent = 0                 remaining += allocation
  remaining = allocation
  effective_daily_amount (jika DAILY_CONTINUOUS)
  days_in_month (jika DAILY_CONTINUOUS)

  INSERT ke budget_allocations
    (income_id, category_id, allocation_amount, month, year)
            |
            v
COMMIT
            |
            v
Return allocation breakdown per kategori
```

---

### Flow 4: Catat Pengeluaran (Spent dari Akun)
```
User Input:
  - account_id, category_id, amount, date, description
            |
            v
Validasi:
  - account exists & is_active = true
  - account.balance >= amount  (HARD: error jika tidak cukup)
  - category exists & is_active = true
  - category_budget.remaining >= amount  (SOFT: warning jika tidak cukup, bisa lanjut)
            |
            v
BEGIN TRANSACTION
            |
            v
INSERT ke `expenses` (account_id, category_id, amount, date, description)
            |
            v
UPDATE accounts SET balance = balance - amount WHERE id = account_id
            |
            v
UPDATE category_budgets SET
  spent_amount = spent_amount + amount,
  remaining_amount = remaining_amount - amount
WHERE category_id = ? AND month = ? AND year = ?
            |
            v
COMMIT
            |
            v
Cek alert threshold:
  usage_pct = (spent_amount / allocated_amount) x 100
  Jika usage_pct >= threshold_percentage:
    Update budget_alerts.last_triggered = NOW()
    Return alert dalam response
            |
            v
Return expense + account.balance + budget_remaining + alert (if any)
```

---

### Flow 5: Transfer Antar Akun
```
User Input:
  - from_account_id, to_account_id, amount, note, transfer_date
            |
            v
Validasi:
  - from_account_id != to_account_id  (error jika sama)
  - from_account exists & is_active = true
  - to_account exists & is_active = true
  - from_account.balance >= amount  (error jika tidak cukup)
  - amount > 0
            |
            v
BEGIN TRANSACTION
            |
            v
UPDATE accounts SET balance = balance - amount WHERE id = from_account_id
UPDATE accounts SET balance = balance + amount WHERE id = to_account_id
            |
            v
INSERT ke account_transfers
  (from_account_id, to_account_id, amount, note, transfer_date)
            |
            v
COMMIT
            |
            v
Return transfer record + from_account.balance + to_account.balance
```

---

### Flow 6: Archive Akun
```
User request: POST /accounts/:id/archive
Optional body: { "transfer_remaining_to": "account_uuid" }
            |
            v
Validasi:
  - account exists & is_active = true
  - Jika account.balance > 0 DAN transfer_remaining_to tidak diisi:
      Return 400: "Pindahkan saldo terlebih dahulu atau sertakan transfer_remaining_to"
            |
            v
Jika account.balance > 0 DAN transfer_remaining_to diisi:
  - Validasi target account aktif
  - Jalankan Flow 5 (Transfer) sejumlah sisa saldo
            |
            v
BEGIN TRANSACTION
UPDATE accounts SET is_active = false WHERE id = account_id
COMMIT
            |
            v
Return 200 OK. Semua histori transaksi tetap tersimpan.
```

---

### Flow 7: Scheduled Fund Execution (Cron)
```
Cron trigger: setiap hari pukul 08:00
            |
            v
SELECT * FROM scheduled_funds
  WHERE is_active = true
    AND (day_of_month = DAY(TODAY) OR (day_of_month = 0 AND TODAY = last_day_of_month))
            |
            v
Loop setiap scheduled_fund:
  |
  schedule_type = TOP_UP?                 schedule_type = TRANSFER?
  |                                       |
  v                                       v
Jalankan Flow 2 (Top Up)           Jalankan Flow 5 (Transfer)
account_id = target account        from=from_account, to=account_id
  |                                       |
  v                                       v
UPDATE scheduled_funds:
  last_executed_at = NOW()
  next_execute_at  = same day next month
            |
            v
Kirim push notifikasi OneSignal:
  Jika sukses: "Scheduled fund berhasil: +Rp X ke akun Y"
  Jika gagal (saldo kurang): "Scheduled fund gagal: saldo tidak cukup di akun Z"
```

---

### Flow 8: OneSignal Notification Delivery (Cron)
```
Cron trigger: setiap menit (check time window)
            |
            v
SELECT * FROM notification_settings
  WHERE is_enabled = true
    AND (day_of_month = DAY(TODAY) OR (day_of_month = 0 AND TODAY = last_day_of_month))
    AND time_of_day BETWEEN NOW()-5min AND NOW()+5min
    AND (last_sent_at IS NULL OR DATE(last_sent_at) != TODAY)
            |
            v
Loop setiap notification_setting:
  POST https://onesignal.com/api/v1/notifications
  Headers: Authorization: Basic {ONESIGNAL_REST_API_KEY}
  Body: {
    "app_id": ONESIGNAL_APP_ID,
    "include_player_ids": [setting.onesignal_player_id],
    "headings": {"en": setting.title},
    "contents": {"en": setting.body}
  }
            |
            v
  UPDATE notification_settings SET last_sent_at = NOW()
```

---

### Flow 9: DAILY_CONTINUOUS Budget Per Bulan
```
Saat alokasi budget bulanan dijalankan (Flow 3):
            |
            v
Untuk setiap kategori dengan type = DAILY_CONTINUOUS:
  days = jumlah_hari_bulan(month, year)
       = 28 | 29 | 30 | 31

  effective_budget = category.daily_amount x days

  Simpan ke category_budgets:
    allocated_amount      = proportional_share_of_income
    effective_daily_amount = category.daily_amount (snapshot)
    days_in_month          = days (snapshot)

Catatan: monthly_budget di expense_categories TIDAK dipakai
         untuk DAILY_CONTINUOUS; hanya daily_amount yang jadi acuan.
Contoh "Makan" daily_amount = 40000:
  Jan 2026 (31 hari): Rp 1.240.000 total budget allocated proportionally
  Feb 2026 (28 hari): Rp 1.120.000
  Feb 2028 (29 hari): Rp 1.160.000 (tahun kabisat)
```

---

## 🔌 API Endpoints

### Account APIs (NEW)

```
POST   /api/v1/accounts
  Body: {
    "name": "BCA Payroll",
    "type": "CARD",
    "income_type": "SALARY",      -- wajib jika type=CARD
    "balance": 0,
    "color": "#4CAF50",
    "description": "Rekening gaji bulanan"
                                  -- Untuk SAVINGS saja:
    "goal_amount": 10000000,
    "goal_label": "Liburan Bali"
  }
  Validation:
    - type wajib: CARD | CASH | SAVINGS
    - income_type wajib jika type=CARD
    - goal fields hanya valid jika type=SAVINGS
  Response: { "success": true, "data": { ...account } }

GET    /api/v1/accounts
  Query: ?type=CARD&is_active=true
  Response: { "success": true, "data": [ ...accounts ] }

GET    /api/v1/accounts/summary
  Response: {
    "accounts": [
      { "id": "...", "name": "BCA Payroll", "type": "CARD", "income_type": "SALARY", "balance": 5000000 },
      { "id": "...", "name": "Dompet", "type": "CASH", "balance": 500000 },
      { "id": "...", "name": "Tabungan Bali", "type": "SAVINGS", "balance": 5000000,
        "goal_amount": 10000000, "goal_label": "Liburan Bali", "progress_percentage": 50.0 }
    ],
    "total_balance": 10500000
  }

GET    /api/v1/accounts/:id
  Response: {
    "account": { ...account },
    "balance_summary": {
      "current_balance": 5000000,
      "total_income_this_month": 8000000,
      "total_spent_this_month": 1500000,
      "total_transferred_out": 1500000,
      "total_transferred_in": 0
    },
    "savings_progress": {       -- only if type=SAVINGS
      "goal_amount": 10000000,
      "goal_label": "Liburan Bali",
      "progress_percentage": 50.0,
      "remaining_to_goal": 5000000
    }
  }

PATCH  /api/v1/accounts/:id
  Body: {
    "name": "BCA Updated",
    "color": "#2196F3",
    "description": "...",
    "goal_amount": 15000000,    -- only SAVINGS
    "goal_label": "Beli Motor"  -- only SAVINGS
  }
  Note: type dan income_type TIDAK bisa diubah setelah dibuat

POST   /api/v1/accounts/:id/topup
  Body: {
    "amount": 8000000,
    "source": "Gaji Maret 2026",
    "date": "2026-03-25T00:00:00Z",
    "description": "Gaji bulanan"
  }
  Response: {
    "income": { ...income_object },
    "account": { "id": "...", "name": "BCA Payroll", "balance": 8000000 },
    "auto_allocation": {
      "triggered": true,
      "warning": null,           -- atau "Alokasi bulan ini sudah ada."
      "allocations": [
        { "category_id": "...", "category_name": "Makan", "allocated": 1120000, "days_in_month": 28 },
        { "category_id": "...", "category_name": "Netflix", "allocated": 120000 }
      ],
      "total_allocated": 2200000,
      "unallocated": 5800000
    }
  }

POST   /api/v1/accounts/:id/spent
  Body: {
    "category_id": "uuid",
    "amount": 35000,
    "date": "2026-03-10T12:00:00Z",
    "description": "Isi bensin Shell"
  }
  Response: {
    "expense": { ...expense_object },
    "account": { "id": "...", "balance": 7965000 },
    "budget_remaining": 140000,
    "alert": null | {
      "level": "warning",           -- warning (>=threshold) | critical (>=100%)
      "message": "Budget bensin sudah terpakai 85%",
      "percentage_used": 85.0
    }
  }

POST   /api/v1/accounts/:id/transfer
  Body: {
    "to_account_id": "uuid",
    "amount": 500000,
    "note": "Uang harian ke dompet",
    "transfer_date": "2026-03-10T00:00:00Z"
  }
  Response: {
    "transfer": { ...transfer_object },
    "from_account": { "id": "...", "name": "BCA Payroll", "balance": 7465000 },
    "to_account":   { "id": "...", "name": "Dompet", "balance": 500000 }
  }

POST   /api/v1/accounts/:id/archive
  Body: { "transfer_remaining_to": "account_uuid" }   -- opsional; wajib jika balance > 0
  Response: { "success": true, "message": "Account archived successfully" }

GET    /api/v1/accounts/:id/transfers
  Query: ?page=1&limit=20&month=3&year=2026
  Response: {
    "data": [ ...transfers dengan from_account dan to_account populated ],
    "pagination": { ... }
  }
```

---

### Transfer APIs (NEW)

```
GET    /api/v1/transfers
  Query: ?month=3&year=2026&account_id=uuid&page=1&limit=20
  Response: {
    "data": [
      {
        "id": "uuid",
        "from_account": { "id": "...", "name": "BCA Payroll", "type": "CARD" },
        "to_account":   { "id": "...", "name": "Dompet", "type": "CASH" },
        "amount": 500000,
        "note": "Uang harian",
        "transfer_date": "2026-03-10T00:00:00Z",
        "created_at": "..."
      }
    ],
    "pagination": { ... },
    "summary": { "total_transferred": 1000000, "count": 2 }
  }

GET    /api/v1/transfers/:id
  Response: { "success": true, "data": { ...transfer } }

DELETE /api/v1/transfers/:id
  Note: Hanya bisa di-cancel dalam 24 jam setelah dibuat. Rollback kedua saldo akun.
  Response: { "success": true, "message": "Transfer cancelled and balances restored" }
```

---

### Statistics APIs (NEW)

```
GET    /api/v1/statistics/monthly?year=2026
  Response: {
    "year": 2026,
    "monthly": [
      {
        "month": 1,
        "month_label": "January",
        "total_income": 8000000,
        "total_expense": 1500000,
        "net_balance": 6500000,
        "expense_by_category": [
          { "category_id": "...", "category_name": "Makan", "amount": 1120000 },
          { "category_id": "...", "category_name": "Bensin", "amount": 175000 }
        ]
      },
      { "month": 2, ... },
      ...
    ],
    "summary": {
      "total_income_ytd": 16000000,
      "total_expense_ytd": 3100000,
      "avg_monthly_income": 8000000,
      "avg_monthly_expense": 1550000,
      "highest_income_month": "January",
      "highest_expense_month": "February"
    }
  }

GET    /api/v1/statistics/overview?month=3&year=2026
  Response: {
    "period": "March 2026",
    "income": {
      "total": 8000000,
      "by_account": [
        { "account_id": "...", "account_name": "BCA Payroll", "type": "CARD", "amount": 8000000 }
      ]
    },
    "expense": {
      "total": 1200000,
      "by_category": [
        { "category_id": "...", "category_name": "Makan", "amount": 840000 },
        { "category_id": "...", "category_name": "Bensin", "amount": 140000 }
      ],
      "by_account": [
        { "account_id": "...", "account_name": "BCA Payroll", "amount": 900000 },
        { "account_id": "...", "account_name": "Dompet", "amount": 300000 }
      ]
    },
    "transfers": {
      "total_out": 500000,
      "total_in": 0,
      "count": 1
    },
    "accounts": [
      { "name": "BCA Payroll", "type": "CARD", "balance": 5800000 },
      { "name": "Dompet", "type": "CASH", "balance": 200000 },
      { "name": "Tabungan Bali", "type": "SAVINGS", "balance": 5000000,
        "goal_amount": 10000000, "progress_percentage": 50.0 }
    ],
    "total_balance": 11000000,
    "savings_rate": 85.0
  }
```

---

### Scheduled Fund APIs (NEW)

```
POST   /api/v1/scheduled-funds
  Body: {
    "account_id": "uuid",          -- Akun tujuan
    "from_account_id": "uuid",     -- Akun sumber (wajib jika schedule_type=TRANSFER)
    "schedule_type": "TRANSFER",   -- TOP_UP | TRANSFER
    "amount": 1000000,
    "day_of_month": 25,            -- 1-31 atau 0=akhir bulan
    "description": "Auto transfer ke tabungan"
  }
  Response: {
    "scheduled_fund": { ...object },
    "next_execute_at": "2026-04-25T08:00:00Z"
  }

GET    /api/v1/scheduled-funds
  Response: [ ...scheduled_funds ]

PATCH  /api/v1/scheduled-funds/:id
  Body: { "amount": 1500000, "day_of_month": 28, "is_active": false }

DELETE /api/v1/scheduled-funds/:id
```

---

### Notification Settings APIs (NEW)

```
POST   /api/v1/notifications/register-device
  Body: { "onesignal_player_id": "device-subscription-id" }
  Note: Register Player ID perangkat. Digunakan untuk semua notifikasi.
  Response: { "success": true }

POST   /api/v1/notifications/settings
  Body: {
    "type": "ALLOCATION_REMINDER",     -- ALLOCATION_REMINDER|BUDGET_ALERT|SAVINGS_GOAL|SCHEDULED_FUND
    "title": "Waktunya Set Alokasi",
    "body": "Gaji sudah masuk, jangan lupa set alokasi budget!",
    "day_of_month": 25,
    "time_of_day": "09:00",
    "is_enabled": true,
    "onesignal_player_id": "player-id"
  }
  Response: { "success": true, "data": { ...notification_setting } }

GET    /api/v1/notifications/settings
GET    /api/v1/notifications/settings/:id
PATCH  /api/v1/notifications/settings/:id
DELETE /api/v1/notifications/settings/:id

POST   /api/v1/notifications/test
  Body: { "onesignal_player_id": "...", "title": "Test", "body": "Hello!" }
  Note: Kirim test notification langsung ke device via OneSignal
  Response: { "success": true, "message": "Test notification sent" }
```

---

### Income APIs (Updated)

```
POST   /api/v1/incomes
  Body: {
    "account_id": "uuid",         -- NEW: Wajib
    "source": "Gaji Maret",
    "amount": 8000000,
    "date": "2026-03-25T00:00:00Z",
    "description": "Gaji bulanan"
  }
  Note: Ini adalah endpoint manual (tidak update saldo akun).
        Gunakan POST /accounts/:id/topup untuk operasi normal + update saldo.

GET    /api/v1/incomes?account_id=uuid&month=3&year=2026&page=1&limit=10&sort=date_desc
GET    /api/v1/incomes/:id
PATCH  /api/v1/incomes/:id    -- Update income + recalculate allocations
DELETE /api/v1/incomes/:id    -- Rollback allocations + restore account balance
```

---

### Expense APIs (Updated)

```
POST   /api/v1/expenses
  Body: {
    "account_id": "uuid",         -- NEW: Wajib
    "category_id": "uuid",
    "amount": 35000,
    "date": "2026-03-10T12:00:00Z",
    "description": "Isi bensin Shell"
  }
  Note: Ini adalah endpoint manual (tidak update saldo akun).
        Gunakan POST /accounts/:id/spent untuk operasi normal + update saldo.

GET    /api/v1/expenses?account_id=uuid&category_id=uuid&month=3&year=2026&page=1&limit=20
GET    /api/v1/expenses/:id
PATCH  /api/v1/expenses/:id    -- Update expense + adjust budget
DELETE /api/v1/expenses/:id    -- Restore budget + restore account balance
```

---

### Category APIs (Updated)

```
POST   /api/v1/categories
  Body: {
    "name": "Makan",
    "type": "DAILY_CONTINUOUS",
    "daily_amount": 40000,         -- NEW: wajib jika type=DAILY_CONTINUOUS
    "monthly_budget": 0,           -- Di-override otomatis untuk DAILY_CONTINUOUS
    "allocation_priority": 1,
    "metadata": {}
  }

GET    /api/v1/categories
  Response: [{
    ...category,
    "effective_monthly_budget": 1120000,  -- Dihitung dari daily x days bulan ini
    "days_in_month": 28
  }]

GET    /api/v1/categories/:id
PATCH  /api/v1/categories/:id
DELETE /api/v1/categories/:id   -- Soft delete (is_active=false)
```

---

### Transaction APIs (Updated)

```
GET    /api/v1/transactions
  Query: ?month=3&year=2026&type=all&account_id=uuid&category_id=uuid&page=1&limit=20&sort=date_desc
  type: all | income | expense | transfer
  Response: {
    "data": [
      { "type": "income",   "account": {...}, "source": "Gaji", "amount": 8000000, "date": "..." },
      { "type": "expense",  "account": {...}, "category": {...}, "amount": 35000, "date": "..." },
      { "type": "transfer", "from_account": {...}, "to_account": {...}, "amount": 500000, "date": "..." }
    ],
    "pagination": { "page": 1, "limit": 20, "total": 150, "total_pages": 8 },
    "summary": {
      "total_income": 8000000,
      "total_expense": 1200000,
      "total_transfer_out": 500000,
      "net_balance": 6800000
    }
  }
```

---

### Budget APIs (tidak berubah)

```
GET    /api/v1/budgets?month=3&year=2026
GET    /api/v1/budgets/summary?month=3&year=2026
POST   /api/v1/budgets/reallocate
GET    /api/v1/budgets/reallocations?month=3&year=2026
DELETE /api/v1/budgets/reallocate/:id
```

---

### Analytics APIs (tidak berubah)

```
GET    /api/v1/analytics/spending-pattern?category_id=uuid&months=6
GET    /api/v1/analytics/category-comparison?month=3&year=2026
GET    /api/v1/analytics/top-spending?month=3&year=2026&limit=5
GET    /api/v1/analytics/budget-performance?year=2026
```

---

### Report APIs (tidak berubah)

```
GET    /api/v1/reports/monthly?month=3&year=2026
GET    /api/v1/reports/monthly/export?month=3&year=2026&format=pdf
GET    /api/v1/reports/yearly?year=2026
GET    /api/v1/reports/yearly/export?year=2026&format=excel
```

---

### Alert APIs (tidak berubah)

```
GET    /api/v1/alerts?status=active
POST   /api/v1/alerts
PATCH  /api/v1/alerts/:id
DELETE /api/v1/alerts/:id
```

---

## 🧩 Go Model Definitions

### models/account.go (NEW)

```go
package models

import (
    "time"
    "github.com/google/uuid"
    "gorm.io/gorm"
)

// Account constants
const (
    AccountTypeCard    = "CARD"
    AccountTypeCash    = "CASH"
    AccountTypeSavings = "SAVINGS"

    CardIncomeTypeSalary    = "SALARY"
    CardIncomeTypeProject   = "PROJECT"
    CardIncomeTypeFreelance = "FREELANCE"
    CardIncomeTypeBusiness  = "BUSINESS"
    CardIncomeTypeOther     = "OTHER"
)

type Account struct {
    ID          uuid.UUID  `gorm:"type:uuid;primary_key" json:"id"`
    Name        string     `gorm:"size:100;not null" json:"name"`
    Type        string     `gorm:"size:20;not null" json:"type"`          // CARD|CASH|SAVINGS
    IncomeType  *string    `gorm:"size:30" json:"income_type,omitempty"`  // SALARY|PROJECT|... (CARD only)
    Balance     float64    `gorm:"type:decimal(15,2);not null;default:0" json:"balance"`
    Color       string     `gorm:"size:10" json:"color"`
    Description string     `gorm:"type:text" json:"description"`
    IsActive    bool       `gorm:"not null;default:true" json:"is_active"`
    GoalAmount  *float64   `gorm:"type:decimal(15,2)" json:"goal_amount,omitempty"`  // SAVINGS only
    GoalLabel   *string    `gorm:"size:200" json:"goal_label,omitempty"`              // SAVINGS only
    CreatedAt   time.Time  `json:"created_at"`
    UpdatedAt   time.Time  `json:"updated_at"`

    Incomes   []Income          `gorm:"foreignKey:AccountID" json:"incomes,omitempty"`
    Expenses  []Expense         `gorm:"foreignKey:AccountID" json:"expenses,omitempty"`
}

func (a *Account) BeforeCreate(tx *gorm.DB) error {
    if a.ID == uuid.Nil {
        a.ID = uuid.New()
    }
    return nil
}

type AccountTransfer struct {
    ID            uuid.UUID `gorm:"type:uuid;primary_key" json:"id"`
    FromAccountID uuid.UUID `gorm:"type:uuid;not null" json:"from_account_id"`
    ToAccountID   uuid.UUID `gorm:"type:uuid;not null" json:"to_account_id"`
    Amount        float64   `gorm:"type:decimal(15,2);not null" json:"amount"`
    Note          string    `gorm:"type:text" json:"note"`
    TransferDate  time.Time `gorm:"not null" json:"transfer_date"`
    CreatedAt     time.Time `json:"created_at"`
    UpdatedAt     time.Time `json:"updated_at"`

    FromAccount Account `gorm:"foreignKey:FromAccountID" json:"from_account,omitempty"`
    ToAccount   Account `gorm:"foreignKey:ToAccountID"   json:"to_account,omitempty"`
}

func (at *AccountTransfer) BeforeCreate(tx *gorm.DB) error {
    if at.ID == uuid.Nil {
        at.ID = uuid.New()
    }
    return nil
}
```

---

### models/notification.go (NEW)

```go
package models

import (
    "time"
    "github.com/google/uuid"
    "gorm.io/gorm"
)

const (
    ScheduledFundTypeTopUp    = "TOP_UP"
    ScheduledFundTypeTransfer = "TRANSFER"

    NotificationTypeAllocationReminder = "ALLOCATION_REMINDER"
    NotificationTypeBudgetAlert        = "BUDGET_ALERT"
    NotificationTypeSavingsGoal        = "SAVINGS_GOAL"
    NotificationTypeScheduledFund      = "SCHEDULED_FUND"
)

type ScheduledFund struct {
    ID             uuid.UUID  `gorm:"type:uuid;primary_key" json:"id"`
    AccountID      uuid.UUID  `gorm:"type:uuid;not null" json:"account_id"`
    FromAccountID  *uuid.UUID `gorm:"type:uuid" json:"from_account_id,omitempty"`
    ScheduleType   string     `gorm:"size:20;not null" json:"schedule_type"` // TOP_UP|TRANSFER
    Amount         float64    `gorm:"type:decimal(15,2);not null" json:"amount"`
    DayOfMonth     int        `gorm:"not null" json:"day_of_month"` // 1-31; 0=last day
    Description    string     `gorm:"type:text" json:"description"`
    IsActive       bool       `gorm:"not null;default:true" json:"is_active"`
    LastExecutedAt *time.Time `json:"last_executed_at,omitempty"`
    NextExecuteAt  time.Time  `gorm:"not null" json:"next_execute_at"`
    CreatedAt      time.Time  `json:"created_at"`
    UpdatedAt      time.Time  `json:"updated_at"`

    Account     Account  `gorm:"foreignKey:AccountID"     json:"account,omitempty"`
    FromAccount *Account `gorm:"foreignKey:FromAccountID" json:"from_account,omitempty"`
}

func (sf *ScheduledFund) BeforeCreate(tx *gorm.DB) error {
    if sf.ID == uuid.Nil {
        sf.ID = uuid.New()
    }
    return nil
}

type NotificationSetting struct {
    ID                uuid.UUID  `gorm:"type:uuid;primary_key" json:"id"`
    Type              string     `gorm:"size:50;not null" json:"type"`
    Title             string     `gorm:"size:200;not null" json:"title"`
    Body              string     `gorm:"type:text;not null" json:"body"`
    DayOfMonth        int        `gorm:"not null" json:"day_of_month"`
    TimeOfDay         string     `gorm:"size:5;not null" json:"time_of_day"` // "09:00"
    IsEnabled         bool       `gorm:"not null;default:true" json:"is_enabled"`
    OneSignalPlayerID string     `gorm:"size:200;not null" json:"onesignal_player_id"`
    LastSentAt        *time.Time `json:"last_sent_at,omitempty"`
    CreatedAt         time.Time  `json:"created_at"`
    UpdatedAt         time.Time  `json:"updated_at"`
}

func (ns *NotificationSetting) BeforeCreate(tx *gorm.DB) error {
    if ns.ID == uuid.Nil {
        ns.ID = uuid.New()
    }
    return nil
}
```

---

### models/transaction.go (Updated — diff key fields)

```go
// Income — tambah AccountID
type Income struct {
    ID          uuid.UUID  `gorm:"type:uuid;primary_key" json:"id"`
    AccountID   uuid.UUID  `gorm:"type:uuid;not null" json:"account_id"`  // NEW
    Source      string     `gorm:"size:100;not null" json:"source"`
    Amount      float64    `gorm:"type:decimal(15,2);not null" json:"amount"`
    Date        time.Time  `gorm:"not null" json:"date"`
    Description string     `gorm:"type:text" json:"description"`
    CreatedAt   time.Time  `json:"created_at"`
    UpdatedAt   time.Time  `json:"updated_at"`

    Account           Account            `gorm:"foreignKey:AccountID" json:"account,omitempty"`
    BudgetAllocations []BudgetAllocation `gorm:"foreignKey:IncomeID"  json:"allocations,omitempty"`
}

// Expense — tambah AccountID
type Expense struct {
    ID          uuid.UUID  `gorm:"type:uuid;primary_key" json:"id"`
    AccountID   uuid.UUID  `gorm:"type:uuid;not null" json:"account_id"`   // NEW
    CategoryID  uuid.UUID  `gorm:"type:uuid;not null" json:"category_id"`
    Amount      float64    `gorm:"type:decimal(15,2);not null" json:"amount"`
    Date        time.Time  `gorm:"not null" json:"date"`
    Description string     `gorm:"type:text" json:"description"`
    CreatedAt   time.Time  `json:"created_at"`
    UpdatedAt   time.Time  `json:"updated_at"`

    Account  Account         `gorm:"foreignKey:AccountID"  json:"account,omitempty"`
    Category ExpenseCategory `gorm:"foreignKey:CategoryID" json:"category,omitempty"`
}

// ExpenseCategory — tambah DailyAmount
type ExpenseCategory struct {
    ID                 uuid.UUID      `gorm:"type:uuid;primary_key" json:"id"`
    Name               string         `gorm:"size:100;not null" json:"name"`
    Type               string         `gorm:"size:50;not null" json:"type"`
    MonthlyBudget      float64        `gorm:"type:decimal(15,2);not null" json:"monthly_budget"`
    DailyAmount        *float64       `gorm:"type:decimal(15,2)" json:"daily_amount,omitempty"` // NEW
    AllocationPriority int            `gorm:"not null;default:1" json:"allocation_priority"`
    IsActive           bool           `gorm:"not null;default:true" json:"is_active"`
    Metadata           datatypes.JSON `gorm:"type:jsonb" json:"metadata" swaggertype:"object"`
    CreatedAt          time.Time      `json:"created_at"`
    UpdatedAt          time.Time      `json:"updated_at"`
}

// CategoryBudget — tambah EffectiveDailyAmount & DaysInMonth
type CategoryBudget struct {
    ID                   uuid.UUID  `gorm:"type:uuid;primary_key" json:"id"`
    CategoryID           uuid.UUID  `gorm:"type:uuid;not null" json:"category_id"`
    Month                int        `gorm:"not null" json:"month"`
    Year                 int        `gorm:"not null" json:"year"`
    AllocatedAmount      float64    `gorm:"type:decimal(15,2);not null;default:0" json:"allocated_amount"`
    SpentAmount          float64    `gorm:"type:decimal(15,2);not null;default:0" json:"spent_amount"`
    RemainingAmount      float64    `gorm:"type:decimal(15,2);not null;default:0" json:"remaining_amount"`
    EffectiveDailyAmount *float64   `gorm:"type:decimal(15,2)" json:"effective_daily_amount,omitempty"` // NEW
    DaysInMonth          *int       `json:"days_in_month,omitempty"`                                    // NEW
    CreatedAt            time.Time  `json:"created_at"`
    UpdatedAt            time.Time  `json:"updated_at"`

    Category ExpenseCategory `gorm:"foreignKey:CategoryID" json:"category,omitempty"`
}
```

---

## 📂 File & Folder Structure (Updated)

```
be_finance_tracking_app/
├── main.go                               (Updated: wire new handlers & services)
├── config/config.go                      (Updated: +OneSignal env vars)
├── database/database.go                  (Updated: +AutoMigrate new tables)
├── models/
│   ├── transaction.go                    (Updated: Income+AccountID, Expense+AccountID,
│   │                                               Category+DailyAmount, Budget+DaysInMonth)
│   ├── account.go                        (NEW: Account, AccountTransfer)
│   └── notification.go                   (NEW: ScheduledFund, NotificationSetting)
├── repositories/
│   ├── account_repository.go             (NEW)
│   ├── transfer_repository.go            (NEW)
│   ├── scheduled_fund_repository.go      (NEW)
│   ├── notification_repository.go        (NEW)
│   ├── income_repository.go
│   ├── expense_repository.go
│   ├── category_repository.go
│   ├── budget_repository.go
│   ├── allocation_repository.go
│   ├── reallocation_repository.go
│   └── alert_repository.go
├── services/
│   ├── account_service.go                (NEW: CRUD + operations + archive)
│   ├── transfer_service.go               (NEW: transfer + cancel)
│   ├── scheduled_fund_service.go         (NEW: CRUD + execution)
│   ├── notification_service.go           (NEW: OneSignal HTTP client + CRUD)
│   ├── statistics_service.go             (NEW: monthly+overview stats)
│   ├── income_service.go                 (Updated: +account link, +salary auto-alloc trigger)
│   ├── expense_service.go                (Updated: +account link, +balance deduction)
│   ├── category_service.go               (Updated: +daily_amount compute, +effective budget)
│   ├── budget_service.go
│   ├── analytics_service.go
│   ├── report_service.go
│   ├── alert_service.go
│   ├── transaction_service.go            (Updated: +transfer type in combined view)
│   └── scheduler_service.go              (Updated: +scheduled_fund cron, +notification cron)
├── handlers/
│   ├── account_handler.go                (NEW)
│   ├── transfer_handler.go               (NEW)
│   ├── statistics_handler.go             (NEW)
│   ├── notification_handler.go           (NEW)
│   ├── income_handler.go
│   ├── expense_handler.go
│   ├── category_handler.go
│   ├── budget_handler.go
│   ├── transaction_handler.go
│   ├── analytics_handler.go
│   ├── report_handler.go
│   └── alert_handler.go
├── utils/
│   ├── helpers.go                        (Updated: +DaysInMonth utility)
│   ├── export_pdf.go
│   └── export_excel.go
├── scripts/
│   ├── seed/main.go
│   └── cleanup/main.go
└── test/
    ├── integration/
    │   ├── account_test.go               (NEW: CRUD, topup, spent, transfer, archive)
    │   ├── transfer_test.go              (NEW: transfer flow + cancel + validation)
    │   ├── allocation_flow_test.go       (NEW: salary income -> auto-allocation full flow)
    │   ├── daily_budget_test.go          (NEW: DAILY_CONTINUOUS per Jan/Feb/Mar)
    │   ├── statistics_test.go            (NEW: monthly & overview accuracy)
    │   ├── notification_test.go          (NEW: settings CRUD + test send)
    │   ├── api_integration_test.go
    │   ├── analytics_test.go
    │   ├── report_export_test.go
    │   └── transaction_test.go
    ├── services/
    │   ├── account_service_test.go       (NEW)
    │   ├── transfer_service_test.go      (NEW)
    │   ├── income_service_test.go
    │   └── expense_service_test.go
    └── helpers/
        ├── database_helper.go
        └── http_helper.go
```

---

## ⚙️ Environment Configuration (.env)

```env
# Database
DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=yourpassword
DB_NAME=finance_tracking

# Server
SERVER_PORT=8081

# OneSignal
ONESIGNAL_APP_ID=your-onesignal-app-id
ONESIGNAL_REST_API_KEY=your-onesignal-rest-api-key
ONESIGNAL_API_URL=https://onesignal.com/api/v1
```

---

## 🔐 Business Rules & Constraints

### Account Rules
1. `income_type` WAJIB diisi jika `type = CARD`. Error jika kosong.
2. `goal_amount` dan `goal_label` hanya valid untuk `type = SAVINGS`. Jika diisi untuk CARD/CASH, diabaikan.
3. Archiving TIDAK bisa jika `balance > 0` tanpa menyebutkan `transfer_remaining_to`.
4. Hard delete akun TIDAK diizinkan — hanya archive (is_active=false).
5. `type` dan `income_type` tidak bisa diubah setelah akun dibuat.

### Income & Auto-Allocation Rules
1. Setiap income WAJIB punya `account_id` valid dan aktif.
2. Auto-allocation HANYA terjadi jika akun `type=CARD` dan `income_type=SALARY`.
3. Jika bulan+tahun income belum pernah ada alokasi: auto-allocate dan buat `category_budgets` baru.
4. Jika sudah ada alokasi bulan ini: return `warning` dalam response, tidak auto-allocate ulang.
5. Income non-SALARY: saldo akun bertambah, tidak ada alokasi budget.

### Expense Rules
1. Setiap expense WAJIB punya `account_id` valid dan aktif.
2. `account.balance >= amount` adalah constraint HARD — return 400 jika tidak cukup.
3. `category_budget.remaining >= amount` adalah constraint SOFT — return warning + alert tapi tetap dibuat.
4. Saldo akun berkurang atomis dalam transaksi DB yang sama dengan insert expense.

### DAILY_CONTINUOUS Category Rules
1. `daily_amount` WAJIB > 0 untuk tipe DAILY_CONTINUOUS.
2. `monthly_budget` pada tabel `expense_categories` DIABAIKAN untuk DAILY_CONTINUOUS.
3. Saat alokasi bisnis: `effective_budget = daily_amount × days_in_month(month, year)`.
4. Snapshot `effective_daily_amount` dan `days_in_month` disimpan di `category_budgets` tiap bulan.
5. Jika user update `daily_amount`, perubahan berlaku bulan BERIKUTNYA (tidak retroaktif).

### Transfer Rules
1. `from_account_id != to_account_id` — HARD constraint.
2. `from_account.balance >= amount` — HARD constraint.
3. Transfer bisa di-cancel dalam 24 jam. Rollback kedua saldo akun dalam satu transaksi DB.
4. Transfer tidak mempengaruhi `category_budgets` atau `budget_allocations`.

### Scheduled Fund Rules
1. `day_of_month = 0` berarti hari terakhir bulan (`last_day_of_month`).
2. Jika `day_of_month = 31` dan bulan tidak punya 31 hari, eksekusi di hari terakhir bulan.
3. Jika saldo tidak cukup saat eksekusi, schedule DI-SKIP dan kirim notifikasi error ke device.
4. `next_execute_at` di-update ke bulan berikutnya setelah eksekusi berhasil atau gagal.

### Notification Rules
1. OneSignal Player ID HARUS didaftarkan via `POST /notifications/register-device`.
2. Notifikasi hanya dikirim SEKALI per hari (cek `last_sent_at`).
3. Cron check setiap menit; kirim hanya jika `time_of_day` dalam window ±5 menit.

---

## 🧪 Testing Strategy

### Test Matrix per Endpoint

#### POST /api/v1/accounts
| Input | Expected |
|-------|----------|
| type=CARD, income_type=SALARY | 201, account created |
| type=CARD, income_type kosong | 400 "income_type required for CARD" |
| type=SAVINGS, goal_amount=10jt | 201, savings dengan goal |
| type=CASH | 201, cash account |
| name kosong | 400 |

#### POST /api/v1/accounts/:id/topup
| Input | Expected |
|-------|----------|
| CARD SALARY, belum ada alokasi bulan ini | 201, allocation triggered, warning=null |
| CARD SALARY, sudah ada alokasi bulan ini | 201, allocation.triggered=false, warning!=null |
| CARD PROJECT | 201, no allocation |
| CASH | 201, no allocation |
| account tidak aktif | 400 "Account is archived" |
| amount = 0 | 400 |
| account tidak ditemukan | 404 |

#### POST /api/v1/accounts/:id/spent
| Input | Expected |
|-------|----------|
| saldo cukup, budget cukup | 201, expense + saldo berkurang |
| saldo cukup, budget >80% terpakai | 201 + alert.level="warning" |
| saldo cukup, budget >100% terpakai | 201 + alert.level="critical" |
| saldo TIDAK cukup | 400 "Insufficient account balance" |
| category tidak aktif | 400 "Category is inactive" |
| account tidak aktif | 400 "Account is archived" |
| category_id tidak ada | 404 |

#### POST /api/v1/accounts/:id/transfer
| Input | Expected |
|-------|----------|
| saldo cukup, akun tujuan aktif | 201, kedua saldo terupdate |
| saldo TIDAK cukup | 400 "Insufficient balance" |
| from = to (sama) | 400 "Cannot transfer to the same account" |
| akun tujuan tidak aktif | 400 "Destination account is archived" |
| amount = 0 | 400 |

#### POST /api/v1/accounts/:id/archive
| Input | Expected |
|-------|----------|
| saldo = 0 | 200 |
| saldo > 0, transfer_remaining_to valid | 200 + saldo pindah |
| saldo > 0, tidak ada transfer_remaining_to | 400 |
| saldo > 0, transfer_remaining_to tidak aktif | 400 |
| akun sudah archived | 400 |

#### DAILY_CONTINUOUS Allocation
| Kondisi | Expected |
|---------|----------|
| Januari 2026 (31 hari), daily=40000 | allocated proportional, days_in_month=31, effective_daily=40000 |
| Februari 2026 (28 hari), daily=40000 | allocated proportional, days_in_month=28 |
| Februari 2028 (29 hari), daily=40000 | days_in_month=29 |
| Update daily_amount, jalankan alokasi bulan depan | Pakai nilai baru |

#### DELETE /api/v1/transfers/:id
| Kondisi | Expected |
|---------|----------|
| Transfer < 24 jam | 200, kedua saldo di-rollback |
| Transfer > 24 jam | 400 "Cannot cancel transfer after 24 hours" |
| Transfer tidak ada | 404 |

---

## 📅 Endpoint Map Lengkap (v2)

| Method | Endpoint | Keterangan |
|--------|----------|------------|
| **ACCOUNTS** | | |
| POST | `/accounts` | Buat akun baru |
| GET | `/accounts` | List semua akun |
| GET | `/accounts/summary` | Ringkasan saldo semua akun |
| GET | `/accounts/:id` | Detail akun + balance summary |
| PATCH | `/accounts/:id` | Update nama/warna/goal akun |
| POST | `/accounts/:id/topup` | Top Up + auto-allocation jika SALARY |
| POST | `/accounts/:id/spent` | Catat pengeluaran dari akun |
| POST | `/accounts/:id/transfer` | Transfer ke akun lain |
| POST | `/accounts/:id/archive` | Archive akun |
| GET | `/accounts/:id/transfers` | History transfer akun ini |
| **TRANSFERS** | | |
| GET | `/transfers` | List semua transfer |
| GET | `/transfers/:id` | Detail transfer |
| DELETE | `/transfers/:id` | Cancel transfer (dalam 24 jam) |
| **STATISTICS** | | |
| GET | `/statistics/monthly` | Grafik income & expense per bulan (yearly) |
| GET | `/statistics/overview` | Overview keuangan bulan tertentu |
| **SCHEDULED FUNDS** | | |
| POST | `/scheduled-funds` | Buat jadwal top-up/transfer |
| GET | `/scheduled-funds` | List semua jadwal |
| PATCH | `/scheduled-funds/:id` | Update jadwal |
| DELETE | `/scheduled-funds/:id` | Hapus jadwal |
| **NOTIFICATIONS** | | |
| POST | `/notifications/register-device` | Daftar OneSignal Player ID |
| POST | `/notifications/settings` | Buat konfigurasi reminder |
| GET | `/notifications/settings` | List konfigurasi reminder |
| GET | `/notifications/settings/:id` | Detail konfigurasi |
| PATCH | `/notifications/settings/:id` | Update konfigurasi |
| DELETE | `/notifications/settings/:id` | Hapus konfigurasi |
| POST | `/notifications/test` | Kirim test notification |
| **INCOMES** | | |
| POST | `/incomes` | Buat income record (manual) |
| GET | `/incomes` | List incomes |
| GET | `/incomes/:id` | Detail income |
| PATCH | `/incomes/:id` | Update income |
| DELETE | `/incomes/:id` | Hapus income + rollback |
| **CATEGORIES** | | |
| POST | `/categories` | Buat kategori |
| GET | `/categories` | List kategori |
| GET | `/categories/:id` | Detail kategori |
| PATCH | `/categories/:id` | Update kategori |
| DELETE | `/categories/:id` | Archive kategori |
| **EXPENSES** | | |
| POST | `/expenses` | Buat expense record (manual) |
| GET | `/expenses` | List expenses |
| GET | `/expenses/:id` | Detail expense |
| PATCH | `/expenses/:id` | Update expense |
| DELETE | `/expenses/:id` | Hapus expense + restore |
| **BUDGETS** | | |
| GET | `/budgets` | Budget per kategori per bulan |
| GET | `/budgets/summary` | Ringkasan budget bulan ini |
| POST | `/budgets/reallocate` | Manual realokasi budget |
| GET | `/budgets/reallocations` | History realokasi |
| DELETE | `/budgets/reallocate/:id` | Cancel realokasi |
| **TRANSACTIONS** | | |
| GET | `/transactions` | Combined income+expense+transfer |
| **ANALYTICS** | | |
| GET | `/analytics/spending-pattern` | Trend spending 6 bulan per kategori |
| GET | `/analytics/category-comparison` | Bulan ini vs bulan lalu |
| GET | `/analytics/top-spending` | Top kategori pengeluaran |
| GET | `/analytics/budget-performance` | Performa budget per tahun |
| **REPORTS** | | |
| GET | `/reports/monthly` | Laporan bulanan lengkap |
| GET | `/reports/monthly/export` | Export PDF/Excel bulanan |
| GET | `/reports/yearly` | Laporan tahunan |
| GET | `/reports/yearly/export` | Export PDF/Excel tahunan |
| **ALERTS** | | |
| GET | `/alerts` | List budget alerts |
| POST | `/alerts` | Buat alert |
| PATCH | `/alerts/:id` | Update alert |
| DELETE | `/alerts/:id` | Hapus alert |

> Semua endpoint berada di bawah base path `/api/v1`.

---

## 📋 Catatan Implementasi

### Standard Response Format
```json
{ "success": true, "message": "...", "data": { ... } }
{ "success": false, "error": "error message here" }
```

### HTTP Methods
- Buat data baru: `POST`
- Ambil list/detail: `GET`
- Update sebagian: `PATCH` (bukan PUT)
- Hapus: `DELETE`

### Date Format
- Body/JSON: RFC3339 → `"2026-03-25T00:00:00Z"`
- Query param: YYYY-MM-DD → `?start_date=2026-03-25`

### Pagination
```json
{ "data": [...], "pagination": { "page": 1, "limit": 20, "total": 150, "total_pages": 8 } }
```

---

## 📅 Development Phases (Updated)

### Phase 1–3: SELESAI
- Core backend: Income, Expense, Category, Budget, Analytics, Reports, Alerts
- Export PDF/Excel, Scheduler, 18/21 Integration tests passing

### Phase 4: Account, Transfer, Statistics, OneSignal (CURRENT)
- [ ] DB migrations: accounts, account_transfers, scheduled_funds, notification_settings
- [ ] Column migrations: account_id di incomes & expenses; daily_amount di categories; days_in_month di category_budgets
- [ ] Account model, repository, service, handler
- [ ] Transfer model, repository, service, handler
- [ ] Update Income service: account link + salary trigger
- [ ] Update Expense service: account link + balance deduction
- [ ] Update Category service: DAILY_CONTINUOUS compute
- [ ] Statistics service & handler
- [ ] Scheduled fund service + cron
- [ ] OneSignal notification service
- [ ] Notification settings CRUD
- [ ] Update Scheduler: scheduled_fund cron + notification cron
- [ ] Integration tests per endpoint (semua kondisi)

### Phase 5: Frontend Mobile (Flutter)

### Phase 6: Optimization & Production (Docker, JWT, Redis)

---

## ✅ Prinsip Arsitektur

| Prinsip | Implementasi |
|---------|-------------|
| **Single Source of Truth** | Account balance = akumulasi semua topup - spent - transfer out + transfer in |
| **Transactional Integrity** | Semua mutasi saldo dalam satu DB transaction (ACID) |
| **Separation of Concerns** | Handler → Service → Repository; tiap layer punya tanggungjawab tunggal |
| **Audit Trail** | Setiap mutasi saldo tercatat: income, expense, transfer |
| **Non-Destructive** | Tidak ada hard delete untuk akun dan histori transaksi |
| **Automation** | Salary income → auto-allocate; scheduled fund → auto-execute; cron → auto-notify |
| **Flexibility** | DAILY_CONTINUOUS budget otomatis menyesuaikan panjang bulan |
| **Fail-Safe** | Hard constraint pada saldo akun; soft warning pada budget kategori |
