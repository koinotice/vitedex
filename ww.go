package main

import (
	"context"
	"fmt"
	"github.com/koinotice/vitedex/ethwatcher"
	"log"
	"math/big"
)

//  (Public) Returns F(n).
func fibonacci(n int) *big.Int {
	if n < 0 {
		panic("Negative arguments not implemented")
	}
	fst, _ := fib(n)
	return fst
}

// (Private) Returns the tuple (F(n), F(n+1)).
func fib(n int) (*big.Int, *big.Int) {
	if n == 0 {
		return big.NewInt(0), big.NewInt(1)
	}
	a, b := fib(n / 2)
	c := Mul(a, Sub(Mul(b, big.NewInt(2)), a))
	d := Add(Mul(a, a), Mul(b, b))
	if n%2 == 0 {
		return c, d
	} else {
		return d, Add(c, d)
	}
}
func Mul(x, y *big.Int) *big.Int {
	return big.NewInt(0).Mul(x, y)
}
func Sub(x, y *big.Int) *big.Int {
	return big.NewInt(0).Sub(x, y)
}
func Add(x, y *big.Int) *big.Int {
	return big.NewInt(0).Add(x, y)
}
func main() {

	//cc,_:=fmt.Println(fibonacci(123))
	//fmt.Println(fibonacci(124))
	api := "wss://rinkeby.infura.io/ws"

	client, err := ethwatcher.NewEthWatcher(api, 5, "0xD0C06e8aC6448FECE40ee96833EF17f188525aA8")
	if err != nil {
		log.Fatal("erro")
	}
	//var height * big.Int
	n := new(big.Int)
	fmt.Printf("%s",n)

	 height :=  new(big.Int).SetUint64(uint64(4709410))

	 block, _ := client.BlockByNumber(context.Background(), height)
	//
	 fmt.Printf("block hash is %v \n", block.BlockHash.Hex())
	 blkCh := make(chan * ethwatcher.PushEvent);//make([]* ethwatcher.PushEvent,0)

	//bigIntNumber:=client.CurrentHeight()
	//hh:= big.NewInt(int64(4709410))
	//hh, _ := n.SetString("4709410", 0)

	///var hh, _ = new(big.Int).SetString("218882428714186575617", 0)
	//var x, _ = new(big.Int).SetString("21888242871839275222246405745257275088696311157297823662689037894645226208583", 10)

	//ec.StartWatchBlock(start, blkCh)
	balances := make([]big.Int, 1000)
for{
	client.StartWatch( balances[0] ,0, blkCh)

}
	 // client.StartWatch( balances[0] ,0, blkCh)
}
