create table tb_catalog_stone (
	stone_no bigint not null auto_increment,
    catalog_no bigint not null,
    stone_type varchar(20),
    stone_nm varchar(200),
    bead_cnt int not null default 0,
    purchase_price int not null default 0,
    ston_desc varchar(2000),
	inpt_id varchar(30) not null comment '등록자',
	inpt_dt datetime not null default current_timestamp() comment '등록일',
	updt_id varchar(30) comment '수정자',
	updt_dt datetime comment '수정일',
    primary key (stone_no)
)
comment '스톤정보'
default charset=utf8mb4
engine = InnoDB;
ALTER TABLE tb_catalog_stone ADD INDEX idx1_tb_catalog_stone(catalog_no);