
-- 1. Her müşterinin siparişlerini miktara göre sıralama
SELECT
    s.siparis_id,
    s.musteri_id,
    m.ad AS musteri_ad,
    s.urun_id,
    u.ad AS urun_ad,
    s.miktar,
    s.fiyat,
    ROW_NUMBER() OVER (PARTITION BY s.musteri_id ORDER BY s.fiyat DESC) AS siparis_sirasi,
    SUM(s.fiyat) OVER (PARTITION BY s.musteri_id) AS toplam_harcama
FROM siparisler s
JOIN musteriler m ON s.musteri_id = m.musteri_id
JOIN urunler u ON s.urun_id = u.urun_id
ORDER BY s.musteri_id, siparis_sirasi;

-- 2. Her ürünün satış sırasını bulma
SELECT
    urun_id,
    ad AS urun_ad,
    siparis_id,
    miktar,
    RANK() OVER (PARTITION BY urun_id ORDER BY miktar DESC) AS urun_siparis_rank
FROM siparisler
JOIN urunler USING (urun_id)
ORDER BY urun_id, urun_siparis_rank;

-- 3. Bir müşterinin önceki sipariş fiyatını getirme
SELECT
    siparis_id,
    musteri_id,
    fiyat,
    LAG(fiyat) OVER (PARTITION BY musteri_id ORDER BY created_at) AS onceki_fiyat
FROM siparisler
ORDER BY musteri_id, created_at;