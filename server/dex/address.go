package dex

import (
	"github.com/ethereum/go-ethereum/common"
	"github.com/keven/leven/plugin"
	"github.com/keven/leven/structs"
	"strings"
	"fmt"
	eth "github.com/keven/leven/ethereum"
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

	receipt1 := txAndReceipt.Receipt

	for _, log := range receipt1.GetLogs() {
		topics := log.GetTopics()
		if len(topics) == 3 && topics[0] == transferEventSig {

			//fmt.Printf(">> approving to dydx, tx: %s\n", txAndReceipt.Tx.GetTo())
			//fmt.Printf(">> approving to dydx, tx: %s\n", txAndReceipt.Tx.GetFrom())
			//fmt.Printf(">> approving to dydx, tx: %s\n", txAndReceipt.Tx)
			amount, ok := plugin.HexToDecimal(log.GetData())
			if (ok) {

				fmt.Printf(">> tx: %s\n,%s\n,%s\n,amount%s\n", txAndReceipt.Tx.GetHash(),
					txAndReceipt.Tx.GetFrom(), txAndReceipt.Tx.GetTo(), amount)
				//fmt.Printf(">> approving to dydx, tx: %s\n", amount)

			} else {
				fmt.Printf("error %s\n", ok)
			}

		}
	}

}
