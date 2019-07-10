package dex

import (
	"fmt"
	"github.com/ethereum/go-ethereum/common"
	eth "github.com/koinotice/vitedex/ethereum"
	"github.com/koinotice/vitedex/genv/sdk/ethereum"
	"github.com/koinotice/vitedex/plugin"
	"github.com/koinotice/vitedex/server/models"
	"github.com/koinotice/vitedex/structs"
	"strings"
)
type Dex struct {

}
func parseAddress(addString string) string {
	address, err := eth.HashToAddress(common.HexToHash(addString))
	if (err != nil) {
		fmt.Print("error from")

	}
	return strings.ToLower(address.Hex())
}
func Callback(txAndReceipt *structs.RemovableTxAndReceipt) {
	transferEventSig := "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"

	// todo a little weird
	if receipt, ok := txAndReceipt.Receipt.(*ethereum.EthereumTransactionReceipt); ok {
		for _, log := range receipt.Logs {
			if len(log.Topics) == 3 && log.Topics[0] == transferEventSig {
				//fromAddress ,err:=eth.ParseAddress(log.Topics[1])
				//if    err!= nil {
				//	fmt.Printf("%s hex,%s",fromAddress.String(),fromAddress.Hex())
				//}
				address:=log.Address
				hash:=log.TransactionHash
				from :=parseAddress(log.Topics[1])
				to :=parseAddress(log.Topics[2])


				amount, ok := plugin.HexToDecimal(log.Data)

				if ok {


					 walletLog := models.WalletDao.FindWalletByErcAddress(to)
					//
					if walletLog == nil {
						//utils.Debugf("Skip useless transaction %s", tx.GetHash())

					} else {
						fmt.Printf("\nfuck ,hash %s address %s,from %s ,to %s ,amount %s \n",hash,address,from,to,amount)

						//return true
					}
					//fmt.Printf("fuck ,hash %s address %s,from %s ,to %s ,amount %s \n",hash,address,from,to,amount)
					//rst = append(rst, TransferEvent{log.Address, from, to, amount})
				}
			}
		}
	}

}
