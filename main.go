package main

import (
	"github.com/gofiber/fiber/v2"
)

func main() {
	app := fiber.New()

	app.Get("/", func(c *fiber.Ctx) error {
		return c.JSON(fiber.Map{"text": "podman-template test by wk-18k 😎"})
	})

	app.Listen(":3000")
}
