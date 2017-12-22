/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     03/12/2017 21.02.39                          */
/*==============================================================*/


drop table if exists COSTUMER;

drop table if exists INSTANSI;

drop table if exists TIKET;

drop table if exists TRANSAKSI_PEMBELIAN;

/*==============================================================*/
/* Table: COSTUMER                                              */
/*==============================================================*/
create table COSTUMER
(
   ID_CUSTOMER          varchar(50) not null,
   USERNAME             varchar(50) not null,
   PASSWORD             varchar(40) not null,
   NO_HANDPHONE         int not null,
   ALAMAT               varchar(50) not null,
   primary key (ID_CUSTOMER)
);

/*==============================================================*/
/* Table: INSTANSI                                              */
/*==============================================================*/
create table INSTANSI
(
   ID_INSTANSI          int not null,
   USERNAME             varchar(50) not null,
   PASSWORD             varchar(40) not null,
   NO_HANDPHONE         int not null,
   ALAMAT               varchar(50) not null,
   primary key (ID_INSTANSI)
);

/*==============================================================*/
/* Table: TIKET                                                 */
/*==============================================================*/
create table TIKET
(
   HARGA_TIKET          int not null,
   JUMLAH_TIKET         int not null,
   PROMO_TIKET          varchar(50) not null,
   ID_TIKET             varchar(20) not null,
   ID_PESANAN           int,
   primary key (ID_TIKET)
);

/*==============================================================*/
/* Table: TRANSAKSI_PEMBELIAN                                   */
/*==============================================================*/
create table TRANSAKSI_PEMBELIAN
(
   ID_PESANAN           int not null,
   ID_CUSTOMER          varchar(50),
   ID_INSTANSI          int not null,
   JUMLAH_PESANAN       int not null,
   TOTAL                int not null,
   primary key (ID_PESANAN)
);

alter table TIKET add constraint FK_PEMBELIAN foreign key (ID_PESANAN)
      references TRANSAKSI_PEMBELIAN (ID_PESANAN) on delete restrict on update restrict;

alter table TRANSAKSI_PEMBELIAN add constraint FK_MEMESAN foreign key (ID_CUSTOMER)
      references COSTUMER (ID_CUSTOMER) on delete restrict on update restrict;

alter table TRANSAKSI_PEMBELIAN add constraint FK_MENERIMA foreign key (ID_INSTANSI)
      references INSTANSI (ID_INSTANSI) on delete restrict on update restrict;

