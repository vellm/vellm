package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

// publishCmd represents the publish command
var publishCmd = &cobra.Command{
	Use:   "publish",
	Short: "Publish a markdown file or an entire folder to the cloud",
	Long: `Publish a markdown file or an entire folder with several
	markdown files. You can also use the task to overwrite an existing file.`,
	Run: func(cmd *cobra.Command, args []string) {
		// TODO: Work your own magic here
		fmt.Println("publish called")
	},
}

func init() {
	RootCmd.AddCommand(publishCmd)
}
