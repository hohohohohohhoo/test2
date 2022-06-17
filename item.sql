CREATE TABLE tbl_item(
iId NUMBER,
iName VARCHAR2(60) NOT NULL,
iPrice NUMBER NOT NULL,
iDc NUMBER DEFAULT 0,
iCount NUMBER NOT NULL,
filename VARCHAR2(100),
CONSTRAINT pk_item_iId PRIMARY KEY(iId)
)


CREATE TABLE itemfileupload(
filename VARCHAR2(300),
iId NUMBER,
CONSTRAINT fk_upload_iId FOREIGN KEY (iId) REFERENCES tbl_item(iId)
)

drop table tbl_item