-- cohort_query.sql

-- 1. Müşteri kohortu (kayıt ayı)
SELECT
    DATE_TRUNC('month', created_at) AS cohort_ay,
    COUNT(musteri_id) AS kayit_sayisi
FROM musteriler
GROUP BY cohort_ay
ORDER BY cohort_ay;

-- 2. Cohort bazlı aylık sipariş sayısı
SELECT
    DATE_TRUNC('month', m.created_at) AS cohort_ay,
    DATE_TRUNC('month', s.created_at) AS siparis_ay,
    COUNT(s.siparis_id) AS siparis_sayisi
FROM musteriler m
LEFT JOIN siparisler s ON m.musteri_id = s.musteri_id
GROUP BY cohort_ay, siparis_ay
ORDER BY cohort_ay, siparis_ay;

-- 3. Cohort retention (sipariş sayısı üzerinden)
SELECT
    DATE_TRUNC('month', m.created_at) AS cohort_ay,
    DATE_TRUNC('month', s.created_at) AS siparis_ay,
    COUNT(DISTINCT s.musteri_id) AS aktif_musteri_sayisi
FROM musteriler m
LEFT JOIN siparisler s ON m.musteri_id = s.musteri_id
GROUP BY cohort_ay, siparis_ay
ORDER BY cohort_ay, siparis_ay;