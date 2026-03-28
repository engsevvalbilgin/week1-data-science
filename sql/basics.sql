-- basics.sql (düzeltilmiş)
CREATE TABLE IF NOT EXISTS urunler (
    urun_id INT PRIMARY KEY,
    ad VARCHAR(50),
    fiyat DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS musteriler (
    musteri_id SERIAL PRIMARY KEY,
    ad VARCHAR(50),
    soyad VARCHAR(50),
    email VARCHAR(100),
    telefon VARCHAR(20),
    adres VARCHAR(200),
    sehir VARCHAR(50),
    ulke VARCHAR(50),
    posta_kodu VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS siparisler (
    siparis_id INT PRIMARY KEY,
    musteri_id INTEGER REFERENCES musteriler(musteri_id),
    urun_id INTEGER REFERENCES urunler(urun_id),
    miktar INTEGER,
    fiyat DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Veri ekleme (sütun listeleri değer sayısıyla eşleşiyor)
INSERT INTO musteriler (ad, soyad, email, telefon, adres, sehir, ulke, posta_kodu, created_at) VALUES
('Ali', 'Yılmaz', 'ali@gmail.com', '555-1234567', 'Cumhuriyet Cad. 10', 'İstanbul', 'Türkiye', '34000', '2026-03-28 10:00:00'),
('Ayşe', 'Kara', 'ayse@gmail.com', '555-1234568', 'Atatürk Cad. 20', 'Ankara', 'Türkiye', '06000', '2026-03-28 10:00:00'),
('Mehmet', 'Demir', 'mehmet@gmail.com', '555-1234569', 'İzmir Cad. 5', 'İzmir', 'Türkiye', '35000', '2026-03-28 10:00:00'),
('Fatma', 'Gül', 'fatma@gmail.com', '555-1234570', 'Bursa Sok. 12', 'Bursa', 'Türkiye', '16000', '2026-03-28 10:00:00'),
('Ahmet', 'Yılmaz', 'ahmet@gmail.com', '555-1234571', 'Cumhuriyet Cad. 15', 'İstanbul', 'Türkiye', '34000', '2026-03-28 10:00:00'),
('Ayşe', 'Kara', 'ayse2@gmail.com', '555-1234572', 'Atatürk Cad. 25', 'Ankara', 'Türkiye', '06000', '2026-03-28 10:00:00'),
('Mehmet', 'Demir', 'mehmet2@gmail.com', '555-1234573', 'İzmir Cad. 10', 'İzmir', 'Türkiye', '35000', '2026-03-28 10:00:00'),
('Fatma', 'Gül', 'fatma2@gmail.com', '555-1234574', 'Bursa Sok. 18', 'Bursa', 'Türkiye', '16000', '2026-03-28 10:00:00'),
('Ahmet', 'Yılmaz', 'ahmet2@gmail.com', '555-1234575', 'Cumhuriyet Cad. 20', 'İstanbul', 'Türkiye', '34000', '2026-03-28 10:00:00'),
('Ayşe', 'Kara', 'ayse3@gmail.com', '555-1234576', 'Atatürk Cad. 30', 'Ankara', 'Türkiye', '06000', '2026-03-28 10:00:00');
INSERT INTO urunler (urun_id, ad, fiyat) VALUES
(1, 'Laptop', 10000),
(2, 'Mouse', 100),
(3, 'Keyboard', 150),
(4, 'Monitor', 700),
(5, 'Printer', 200),
(6, 'Scanner', 300),
(7, 'Speaker', 400),
(8, 'Headphones', 500),
(9, 'Webcam', 600),
(10, 'Microphone', 700);

INSERT INTO siparisler (siparis_id, musteri_id, urun_id, miktar, fiyat) VALUES
(1, 1, 1, 1, 10000),
(2, 1, 2, 2, 200),
(3, 2, 3, 3, 450),
(4, 2, 4, 4, 2800),
(5, 3, 5, 5, 1000),
(6, 3, 6, 6, 1800),
(7, 4, 7, 7, 2400),
(8, 4, 8, 8, 3000),
(9, 5, 9, 9, 3600),
(10, 5, 10, 10, 4200);

SELECT * FROM musteriler;


-- Müşterilerin siparişlerini ve ürün adlarını listeleme (INNER JOIN)
SELECT
    m.musteri_id,
    m.ad AS musteri_ad,
    m.soyad,
    s.siparis_id,
    u.ad AS urun_ad,
    s.miktar,
    s.fiyat
FROM musteriler m
JOIN siparisler s ON m.musteri_id = s.musteri_id
JOIN urunler u ON s.urun_id = u.urun_id
ORDER BY m.musteri_id, s.siparis_id;

-- Her müşterinin toplam harcaması (GROUP BY)
SELECT
    m.musteri_id,
    m.ad || ' ' || m.soyad AS musteri_ad,
    SUM(s.fiyat) AS toplam_harcama
FROM musteriler m
JOIN siparisler s ON m.musteri_id = s.musteri_id
GROUP BY m.musteri_id, musteri_ad
ORDER BY toplam_harcama DESC;

---Ürün başına toplam satış ve kaç müşteri aldığı (GROUP + JOIN)
SELECT
    u.urun_id,
    u.ad AS urun_ad,
    SUM(s.miktar) AS toplam_miktar,
    COUNT(DISTINCT s.musteri_id) AS musteri_sayisi
FROM urunler u
JOIN siparisler s ON u.urun_id = s.urun_id
GROUP BY u.urun_id, u.ad
ORDER BY toplam_miktar DESC;



-- müşterilerin birlikte aldığı ürünleri gösterme
SELECT
    s1.musteri_id,
    u1.ad AS urun1,
    u2.ad AS urun2,
    COUNT(*) AS birlikte_satin_alma
FROM siparisler s1
JOIN siparisler s2 ON s1.musteri_id = s2.musteri_id AND s1.urun_id < s2.urun_id
JOIN urunler u1 ON s1.urun_id = u1.urun_id
JOIN urunler u2 ON s2.urun_id = u2.urun_id
GROUP BY s1.musteri_id, urun1, urun2
ORDER BY s1.musteri_id, birlikte_satin_alma DESC;

