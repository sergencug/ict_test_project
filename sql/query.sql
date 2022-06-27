--Tamir yerlerine göre ortalama tamire alım süresini (Tamir tarihi ile kayıt girme tarihi
-- arasındaki fark) saat bazında veren SQL’i yazınız.

SELECT SEC_TO_TIME(TIMESTAMPDIFF(SECOND, `service_date`, `history_registration_date`)) as ortalama ,service_repair_places.place_name FROM `service_history` INNER JOIN service_repair_places ON service_history.service_place =service_repair_places.place_id GROUP BY `service_place`;

-- Araç sayılarını, hafta bazında ve araç segmenti (Araç modeli tablosunda tutulmalıdır) bazında
-- veren SQL’i yazınız.

SELECT place_name as ServisYeri, segment, count(`segment`) AracSayisi FROM `service_history` INNER JOIN service_repair_places ON service_history.service_place =service_repair_places.place_id INNER JOIN car_models ON service_history.car_model =car_models.model_id WHERE WEEK(`service_date`) = WEEK(CURRENT_DATE()) GROUP BY `service_place`,car_models.segment;


-- Ay bazında, tamir yerlerinin yoğunluğunu veren SQL’i yazınız. Tamir yerleri tablosunda aylık
-- araç bakım kapasitesi alanı olmalıdır.

SELECT place_name as ServisYeri, COUNT(*) as RandevuSayisi, place_capacity as AylikHacim, ((COUNT(*) * 100) / place_capacity) as YogunlukYuzdesi FROM `service_history` INNER JOIN service_repair_places ON service_history.service_place =service_repair_places.place_id WHERE MONTH(`service_date`) = MONTH(CURRENT_DATE()) GROUP BY `service_place`;

