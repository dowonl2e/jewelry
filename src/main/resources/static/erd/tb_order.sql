create table tb_order (
	order_no bigint not null auto_increment comment '주문번호(PK)',
	order_type varchar(10) not null comment '주문구분(CUSTOMER:고객주문 / READMAKE:기성주문)',
    store_cd bigint not null comment '매장코드',
    receipt_dt datetime default CURRENT_TIMESTAMP() comment '접수일',
    expected_ord_dt datetime comment '주문예상일',
    customer_no BIGINT default 0 comment '고객번호(FK)',
    customer_nm varchar(80) not null default 0 comment '고객명',
    customer_cel varchar(50) comment '연락처',
    order_step varchar(4) not null default 'A' comment '주문단계',
    del_yn varchar(4) default 'N' not null comment '삭제여부',
	inpt_id varchar(30) not null comment '등록자',
	inpt_dt datetime not null default current_timestamp() comment '등록일',
	updt_id varchar(30) comment '수정자',
	updt_dt datetime comment '수정일',
    primary key (order_no)
)
comment '주문관리'
default charset=utf8mb4
engine = InnoDB;
ALTER TABLE tb_order ADD INDEX idx1_tb_order(customer_no);

