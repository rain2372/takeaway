DROP VIEW IF EXISTS `menu_booking`;
CREATE VIEW menu_booking
AS
SELECT a.*,b.type,b.bookingno
FROM booking_price a
LEFT JOIN booking b
ON a.bookingid = b.id;

DROP VIEW IF EXISTS `address_booking`;
CREATE VIEW address_booking
AS
SELECT a.*,b.id as address_id
FROM booking a
LEFT JOIN address b
ON a.addressname = b.name;

DROP VIEW IF EXISTS `c_material`;
CREATE VIEW c_material
AS
SELECT a.*,b.no,b.name as cname
FROM material a
LEFT JOIN material_category b
ON a.cate_id = b.id;

DROP VIEW IF EXISTS `c_orderlist`;
CREATE VIEW c_orderlist
AS
SELECT a.*,b.unit,b.no,b.cname
FROM orderlist a
LEFT JOIN c_material b
ON a.name = b.name;

DROP VIEW IF EXISTS `c_putin`;
CREATE VIEW c_putin
AS
SELECT a.*,b.unit,b.cname
FROM putin a
LEFT JOIN c_material b
ON a.name = b.name;

DROP VIEW IF EXISTS `c_stock`;
CREATE VIEW c_stock
AS
SELECT a.*,b.unit,b.no
FROM stock a
LEFT JOIN c_material b
ON a.name = b.name;

DROP VIEW IF EXISTS `c_putout`;
CREATE VIEW c_putout
AS
SELECT a.*,b.unit,b.cname
FROM putout a
LEFT JOIN c_material b
ON a.name = b.name;

alter table booking_price add CONSTRAINT FK_PRICE_BOOKING FOREIGN KEY (bookingid) REFERENCES booking (id) ON DELETE CASCADE ON UPDATE NO ACTION;
alter table material add constraint unique_name UNIQUE(name);