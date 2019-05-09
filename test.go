package main

import (
	"context"
	"fmt"
	"github.com/yuchunyun/lvmd/client"
	"time"
)

func main() {
	addr := "202.173.9.3:1736"
	ConnectTimeout := time.Duration(2) * time.Second
	ctx := context.TODO()
	size := 2147483648

	conn, err := client.NewLVMConnection(addr, ConnectTimeout)
	defer conn.Close()
	if err != nil {
		fmt.Println(err)
	}

	resp, err := conn.GetLV(ctx, "k8s")
	fmt.Println(err)
	fmt.Println(resp)
}
