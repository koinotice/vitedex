package main

import (
	"fmt"
	"github.com/koinotice/vitedex/ethwatcher"
	"log"
	"math/big"
)

func main() {
	api := "wss://rinkeby.infura.io/ws"

	client, err := ethwatcher.NewEthWatcher(api, 5, "0xD0C06e8aC6448FECE40ee96833EF17f188525aA8")
	if err != nil {
		log.Fatal("erro")
	}
	//var height * big.Int
	n := new(big.Int)
	fmt.Printf("%s",n)

	//height :=  (*big.Int)(new(big.Int).SetUint64(uint64(4709410)));//new(big.Int).SetUint64(uint64(4709410))

	//block, _ := client.BlockByNumber(context.Background(), height)
	//
	//fmt.Printf("block hash is %v \n", block.BlockHash.Hex())
	blkCh := make(chan *big.Int, 1000)

	//bigIntNumber:=client.CurrentHeight()
	//hh:= big.NewInt(int64(4709410))
	//hh, _ := n.SetString("4709410", 0)

	///var hh, _ = new(big.Int).SetString("218882428714186575617", 0)
	//var x, _ = new(big.Int).SetString("21888242871839275222246405745257275088696311157297823662689037894645226208583", 10)

	//ec.StartWatchBlock(start, blkCh)
	client.StartWatchBlock(  blkCh)
}
