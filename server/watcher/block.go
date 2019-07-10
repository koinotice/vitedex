package main

import (
	"fmt"
	"github.com/koinotice/vitedex/server/models"
)

func main() {
	//api := "https://rinkeby.infura.io/v3/19d753b2600445e292d54b1ef58d4df4"
	//w := wath.NewHttpBasedEthWatcher(context.Background(), api)
	//
	//w.RegisterBlockPlugin(plugin.NewSimpleBlockPlugin(func(block *structs.RemovableBlock) {
	//	fmt.Println(">>", block, block.IsRemoved)
	//}))
	//
	//w.RunTillExit()
	to:="0x1560cb7d3a6fca7b969bebb70d7b8df9221d94a6"
	models.Connect("postgres://pmker:Zheli123@127.0.0.1/pmker?sslmode=disable")
	walletLog := models.WalletDao.FindWalletByErcAddress(to)

	if walletLog == nil {
		fmt.Println("no ")
		//utils.Debugf("Skip useless transaction %s", tx.GetHash())

	} else {
		fmt.Printf("\nfuck t")

		//return true
	}
}

