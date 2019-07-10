package main
import (
	_ "github.com/joho/godotenv/autoload"
)

import(
	"fmt"
 	"os"
)

func main()  {
	fmt.Print(os.Getenv("HSK_DATABASE_URL"))

}
