package models

import (
	//"database/sql"
	"fmt"
	"time"
)

type IWalletDao interface {
	FindWalletByErcAddress(walletHash string) *Wallet
	InsertWallet(wallet *Wallet) error
	UpdateWallet(wallet *Wallet) error
	Count() int
	//FindWalletByID(id int64) *Wallet
}

type Wallet struct {
	ID          int64  `json:"id"              db:"id" primaryKey:"true"  autoIncrement:"true" gorm:"primary_key"`
	EthAddress  string `json:"eth_address"        db:"eth_address"`
	ViteAddress string `json:"vite_address" db:"vite_address"`

	UpdatedAt time.Time `json:"updatedAt"       db:"createdAt"`
	CreatedAt time.Time `json:"createdAt"       db:"updatedAt"`
}

func (Wallet) TableName() string {
	return "wallets"
}

var WalletDao IWalletDao
var WalletDaoPG IWalletDao

func init() {
	WalletDao = &walletDaoPG{}
	WalletDaoPG = WalletDao
}

type walletDaoPG struct {
}

func (walletDaoPG) FindWalletByErcAddress(address string) *Wallet {
	var wallet Wallet

	fmt.Print("fuck")
	fmt.Print(address)
	DB.Where("eth_address = ?", address).First(&wallet)

	if wallet.EthAddress == "" {
		return nil
	}



	return &wallet
}

func (walletDaoPG) InsertWallet(wallet *Wallet) error {
	return DB.Create(wallet).Error
}

func (walletDaoPG) UpdateWallet(wallet *Wallet) error {
	return DB.Save(wallet).Error
}

func (walletDaoPG) Count() int {
	var count int
	DB.Model(&Wallet{}).Count(&count)
	return count
}

//func (walletDaoPG) FindWalletByID(id int64) *Wallet {
//	var wallet Wallet
//
//	DB.Where("id = ?", id).Find(&wallet)
//	if wallet.Status == "" {
//		return nil
//	}
//
//	return &wallet
//}
