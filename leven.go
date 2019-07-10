package main

import (
	"context"
	"github.com/ethereum/go-ethereum/common"
	"github.com/koinotice/vitedex/genv/sdk/ethereum"
	"github.com/koinotice/vitedex/plugin"
	"github.com/koinotice/vitedex/structs"
	"strings"

	//"github.com/koinotice/vitedex/genv/sdk"
	//"context"
	"fmt"
 	watch "github.com/koinotice/vitedex/watch"
	//"github.com/koinotice/vitedex/plugin"
	//
	//"github.com/shopspring/decimal"
	 eth "github.com/koinotice/vitedex/ethereum"


)

func parseAddress(addString string)string{
	address ,err:=eth.HashToAddress(common.HexToHash(addString))
	if(err!=nil){
		fmt.Print("error from")

	}
	return strings.ToLower(address.Hex())
}
 func  ccc(txAndReceipt *structs.RemovableTxAndReceipt) {
	transferEventSig := "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"

	receipt1 := txAndReceipt.Receipt

	for _, log := range receipt1.GetLogs() {
		topics := log.GetTopics()
		if len(topics) == 3 && topics[0] == transferEventSig  {

			//fmt.Printf(">> approving to dydx, tx: %s\n", txAndReceipt.Tx.GetTo())
			//fmt.Printf(">> approving to dydx, tx: %s\n", txAndReceipt.Tx.GetFrom())
			//fmt.Printf(">> approving to dydx, tx: %s\n", txAndReceipt.Tx)
			amount, ok := plugin.HexToDecimal(log.GetData())
			if(ok){

				fmt.Printf(">> tx: %s\n,%s\n,%s\n,amount%s\n", txAndReceipt.Tx.GetHash(),
					txAndReceipt.Tx.GetFrom(),txAndReceipt.Tx.GetTo(),amount)
				//fmt.Printf(">> approving to dydx, tx: %s\n", amount)

			}else{
				fmt.Printf("error %s\n",ok)
			}



		}
	}



}
func main()  {
	api := "https://rinkeby.infura.io/v3/19d753b2600445e292d54b1ef58d4df4"
	w := watch.NewHttpBasedEthWatcher(context.Background(), api)

	callback := func(txAndReceipt *structs.RemovableTxAndReceipt) {
		transferEventSig := "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"

		receipt1 := txAndReceipt.Receipt

		for _, log := range receipt1.GetLogs() {
			topics := log.GetTopics()
			if len(topics) == 3 && topics[0] == transferEventSig  {

				//fmt.Printf(">> approving to dydx, tx: %s\n", txAndReceipt.Tx.GetTo())
				//fmt.Printf(">> approving to dydx, tx: %s\n", txAndReceipt.Tx.GetFrom())
				//fmt.Printf(">> approving to dydx, tx: %s\n", txAndReceipt.Tx)
				amount, ok := plugin.HexToDecimal(log.GetData())
				if(ok){

					fmt.Printf(">> tx: %s\n,%s\n,%s\n,amount%s\n", txAndReceipt.Tx.GetHash(),
					txAndReceipt.Tx.GetFrom(),txAndReceipt.Tx.GetTo(),amount)
					//fmt.Printf(">> approving to dydx, tx: %s\n", amount)

				}else{
					fmt.Printf("error %s\n",ok)
				}



			}
		}



	}
	callback1 := func(txAndReceipt *structs.RemovableTxAndReceipt) {
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
					//
					//to ,err:=eth.HashToAddress(dex.HexToHash(log.Topics[2]))
					//if(err!=nil){
					//	fmt.Print("error to")
					//}
					//strings.ToLower(addr.Hex())
					//

					amount, ok := plugin.HexToDecimal(log.Data)

					if ok {
						fmt.Printf("fuck ,hash %s address %s,from %s ,to %s ,amount %s \n",hash,address,from,to,amount)
						//rst = append(rst, TransferEvent{log.Address, from, to, amount})
					}
				}
			}
		}



	}






	// only accept txs which send to DAI
	//filterFunc := func(tx sdk.Transaction) bool {
	//	return tx.GetTo() == "0x89d24a6b4ccb1b6faa2625fe562bdd9a23260359"
	//}

	//w.RegisterTxReceiptPlugin(plugin.NewTxReceiptPluginWithFilter(callback, filterFunc))
	w.RegisterTxReceiptPlugin(plugin.NewTxReceiptPlugin(callback))
	w.RegisterTxReceiptPlugin(plugin.NewTxReceiptPlugin(callback1))


	//w.RegisterTxReceiptPlugin(plugin.NewERC20TransferPlugin(func(token, from, to string, amount decimal.Decimal, isRemove bool) {
	//	fmt.Println("New ERC20 Transfer >>", token, from, "->", to, amount, isRemove)
	//}))

	//err := w.RunTillExitFromBlock(7844853)
	//if err != nil {
	//	fmt.Println("RunTillExit with err:", err)
	//}
	w.RunTillExit()
}